<?php

class JsMinifier {
	const ORD_LF            = 10;
	const ORD_SPACE         = 32;
	const ACTION_KEEP_A     = 1;
	const ACTION_DELETE_A   = 2;
	const ACTION_DELETE_A_B = 3;

	protected $a           = "\n";
	protected $b           = '';
	protected $input       = '';
	protected $inputIndex  = 0;
	protected $inputLength = 0;
	protected $lookAhead   = null;
	protected $output      = '';
	protected $lastByteOut  = '';
	protected $keptComment = '';

	/**
	 * Minify Javascript.
	 *
	 * @param string $js Javascript to be minified
	 *
	 * @return string
	 */
	public static function process($js)
	{
		$jsmin = new self($js);
		return $jsmin->_process();
	}

	/**
	 * @param string $input
	 */
	public function __construct($input)
	{
		$this->input = $input;
	}

	/**
	 * Perform minification, return result
	 *
	 * @return string
	 */
	public function _process()
	{
		if ($this->output !== '') { // min already run
			return $this->output;
		}

		$mbIntEnc = null;
		if (function_exists('mb_strlen') && ((int)ini_get('mbstring.func_overload') & 2)) {
			$mbIntEnc = mb_internal_encoding();
			mb_internal_encoding('8bit');
		}
		$this->input = str_replace("\r\n", "\n", $this->input);
		$this->inputLength = strlen($this->input);

		$this->action(self::ACTION_DELETE_A_B);

		while ($this->a !== null) {
			// determine next command
			$command = self::ACTION_KEEP_A; // default
			if ($this->a === ' ') {
				if (($this->lastByteOut === '+' || $this->lastByteOut === '-')
					&& ($this->b === $this->lastByteOut)) {
					// Don't delete this space. If we do, the addition/subtraction
					// could be parsed as a post-increment
				} elseif (! $this->isAlphaNum($this->b)) {
					$command = self::ACTION_DELETE_A;
				}
			} elseif ($this->a === "\n") {
				if ($this->b === ' ') {
					$command = self::ACTION_DELETE_A_B;

					// in case of mbstring.func_overload & 2, must check for null b,
					// otherwise mb_strpos will give WARNING
				} elseif ($this->b === null
					|| (false === strpos('{[(+-!~', $this->b)
						&& ! $this->isAlphaNum($this->b))) {
					$command = self::ACTION_DELETE_A;
				}
			} elseif (! $this->isAlphaNum($this->a)) {
				if ($this->b === ' '
					|| ($this->b === "\n"
						&& (false === strpos('}])+-"\'', $this->a)))) {
					$command = self::ACTION_DELETE_A_B;
				}
			}
			$this->action($command);
		}
		$this->output = trim($this->output);

		if ($mbIntEnc !== null) {
			mb_internal_encoding($mbIntEnc);
		}
		return $this->output;
	}

	/**
	 * ACTION_KEEP_A = Output A. Copy B to A. Get the next B.
	 * ACTION_DELETE_A = Copy B to A. Get the next B.
	 * ACTION_DELETE_A_B = Get the next B.
	 *
	 * @param int $command
	 * @throws Nitro_JSMin_UnterminatedRegExpException|Nitro_JSMin_UnterminatedStringException
	 */
	protected function action($command)
	{
		// make sure we don't compress "a + ++b" to "a+++b", etc.
		if ($command === self::ACTION_DELETE_A_B
			&& $this->b === ' '
			&& ($this->a === '+' || $this->a === '-')) {
			// Note: we're at an addition/substraction operator; the inputIndex
			// will certainly be a valid index
			if ($this->input[$this->inputIndex] === $this->a) {
				// This is "+ +" or "- -". Don't delete the space.
				$command = self::ACTION_KEEP_A;
			}
		}

		switch ($command) {
			case self::ACTION_KEEP_A: // 1
				$this->output .= $this->a;

				if ($this->keptComment) {
					$this->output = rtrim($this->output, "\n");
					$this->output .= $this->keptComment;
					$this->keptComment = '';
				}

				$this->lastByteOut = $this->a;

			// fallthrough intentional
			case self::ACTION_DELETE_A: // 2
				$this->a = $this->b;
				if ($this->a === "'" || $this->a === '"') { // string literal
					$str = $this->a; // in case needed for exception
					for(;;) {
						$this->output .= $this->a;
						$this->lastByteOut = $this->a;

						$this->a = $this->get();
						if ($this->a === $this->b) { // end quote
							break;
						}
						if ($this->isEOF($this->a)) {
							throw new Nitro_JSMin_UnterminatedStringException(
								"Nitro_JSMin: Unterminated String at byte {$this->inputIndex}: {$str}");
						}
						$str .= $this->a;
						if ($this->a === '\\') {
							$this->output .= $this->a;
							$this->lastByteOut = $this->a;

							$this->a       = $this->get();
							$str .= $this->a;
						}
					}
				}

			// fallthrough intentional
			case self::ACTION_DELETE_A_B: // 3
				$this->b = $this->next();
				if ($this->b === '/' && $this->isRegexpLiteral()) {
					$this->output .= $this->a . $this->b;
					$pattern = '/'; // keep entire pattern in case we need to report it in the exception
					for(;;) {
						$this->a = $this->get();
						$pattern .= $this->a;
						if ($this->a === '[') {
							for(;;) {
								$this->output .= $this->a;
								$this->a = $this->get();
								$pattern .= $this->a;
								if ($this->a === ']') {
									break;
								}
								if ($this->a === '\\') {
									$this->output .= $this->a;
									$this->a = $this->get();
									$pattern .= $this->a;
								}
								if ($this->isEOF($this->a)) {
									throw new Nitro_JSMin_UnterminatedRegExpException(
										"Nitro_JSMin: Unterminated set in RegExp at byte "
										. $this->inputIndex .": {$pattern}");
								}
							}
						}

						if ($this->a === '/') { // end pattern
							break; // while (true)
						} elseif ($this->a === '\\') {
							$this->output .= $this->a;
							$this->a = $this->get();
							$pattern .= $this->a;
						} elseif ($this->isEOF($this->a)) {
							throw new Nitro_JSMin_UnterminatedRegExpException(
								"Nitro_JSMin: Unterminated RegExp at byte {$this->inputIndex}: {$pattern}");
						}
						$this->output .= $this->a;
						$this->lastByteOut = $this->a;
					}
					$this->b = $this->next();
				}
			// end case ACTION_DELETE_A_B
		}
	}

	/**
	 * @return bool
	 */
	protected function isRegexpLiteral()
	{
		if (false !== strpos("(,=:[!&|?+-~*{;", $this->a)) {
			// we obviously aren't dividing
			return true;
		}
		if ($this->a === ' ' || $this->a === "\n") {
			$length = strlen($this->output);
			if ($length < 2) { // weird edge case
				return true;
			}
			// you can't divide a keyword
			if (preg_match('/(?:case|else|in|return|typeof)$/', $this->output, $m)) {
				if ($this->output === $m[0]) { // odd but could happen
					return true;
				}
				// make sure it's a keyword, not end of an identifier
				$charBeforeKeyword = substr($this->output, $length - strlen($m[0]) - 1, 1);
				if (! $this->isAlphaNum($charBeforeKeyword)) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * Return the next character from stdin. Watch out for lookahead. If the character is a control character,
	 * translate it to a space or linefeed.
	 *
	 * @return string
	 */
	protected function get()
	{
		$c = $this->lookAhead;
		$this->lookAhead = null;
		if ($c === null) {
			// getc(stdin)
			if ($this->inputIndex < $this->inputLength) {
				$c = $this->input[$this->inputIndex];
				$this->inputIndex += 1;
			} else {
				$c = null;
			}
		}
		if (ord($c) >= self::ORD_SPACE || $c === "\n" || $c === null) {
			return $c;
		}
		if ($c === "\r") {
			return "\n";
		}
		return ' ';
	}

	/**
	 * Does $a indicate end of input?
	 *
	 * @param string $a
	 * @return bool
	 */
	protected function isEOF($a)
	{
		return ord($a) <= self::ORD_LF;
	}

	/**
	 * Get next char (without getting it). If is ctrl character, translate to a space or newline.
	 *
	 * @return string
	 */
	protected function peek()
	{
		$this->lookAhead = $this->get();
		return $this->lookAhead;
	}

	/**
	 * Return true if the character is a letter, digit, underscore, dollar sign, or non-ASCII character.
	 *
	 * @param string $c
	 *
	 * @return bool
	 */
	protected function isAlphaNum($c)
	{
		return (preg_match('/^[a-z0-9A-Z_\\$\\\\]$/', $c) || ord($c) > 126);
	}

	/**
	 * Consume a single line comment from input (possibly retaining it)
	 */
	protected function consumeSingleLineComment()
	{
		$comment = '';
		while (true) {
			$get = $this->get();
			$comment .= $get;
			if (ord($get) <= self::ORD_LF) { // end of line reached
				// if IE conditional comment
				if (preg_match('/^\\/@(?:cc_on|if|elif|else|end)\\b/', $comment)) {
					$this->keptComment .= "/{$comment}";
				}
				return;
			}
		}
	}

	/**
	 * Consume a multiple line comment from input (possibly retaining it)
	 *
	 * @throws Nitro_JSMin_UnterminatedCommentException
	 */
	protected function consumeMultipleLineComment()
	{
		$this->get();
		$comment = '';

		for(;;) {
			$get = $this->get();
			if ($get === '*') {
				if ($this->peek() === '/') { // end of comment reached
					$this->get();
					if (0 === strpos($comment, '!')) {
						// preserved by YUI Compressor
						if (!$this->keptComment) {
							// don't prepend a newline if two comments right after one another
							$this->keptComment = "\n";
						}
						//$this->keptComment .= "/*!" . substr($comment, 1) . "*/\n";
					} else if (preg_match('/^@(?:cc_on|if|elif|else|end)\\b/', $comment)) {
						// IE conditional
						$this->keptComment .= "/*{$comment}*/";
					}
					return;
				}
			} elseif ($get === null) {
				throw new Nitro_JSMin_UnterminatedCommentException(
					"Nitro_JSMin: Unterminated comment at byte {$this->inputIndex}: /*{$comment}");
			}
			$comment .= $get;
		}
	}

	/**
	 * Get the next character, skipping over comments. Some comments may be preserved.
	 *
	 * @return string
	 */
	protected function next()
	{
		$get = $this->get();
		if ($get === '/') {
			switch ($this->peek()) {
				case '/':
					$this->consumeSingleLineComment();
					$get = "\n";
					break;
				case '*':
					$this->consumeMultipleLineComment();
					$get = ' ';
					break;
			}
		}
		return $get;
	}
}

class Nitro_JSMin_UnterminatedStringException extends Exception {}
class Nitro_JSMin_UnterminatedCommentException extends Exception {}
class Nitro_JSMin_UnterminatedRegExpException extends Exception {}

function minify_js($content) {

	if (defined('HTTP_CATALOG') ) {
		return $content;
	}

	return JsMinifier::process($content);
}

class CssMinifier {

	/**
	 * Minify a CSS string
	 *
	 * @param string $css
	 *
	 * @param array $options (currently ignored)
	 *
	 * @return string
	 */
	public static function process($css, $options = array())
	{
		$obj = new self($options);
		return $obj->_process($css);
	}

	/**
	 * @var array
	 */
	protected $_options = null;

	/**
	 * Are we "in" a hack? I.e. are some browsers targetted until the next comment?
	 *
	 * @var bool
	 */
	protected $_inHack = false;


	/**
	 * Constructor
	 *
	 * @param array $options (currently ignored)
	 */
	private function __construct($options) {
		$this->_options = $options;
	}

	/**
	 * Minify a CSS string
	 *
	 * @param string $css
	 *
	 * @return string
	 */
	protected function _process($css)
	{
		$css = str_replace("\r\n", "\n", $css);

		// preserve empty comment after '>'
		// http://www.webdevout.net/css-hacks#in_css-selectors
		$css = preg_replace('@>/\\*\\s*\\*/@', '>/*keep*/', $css);

		// preserve empty comment between property and value
		// http://css-discuss.incutio.com/?page=BoxModelHack
		$css = preg_replace('@/\\*\\s*\\*/\\s*:@', '/*keep*/:', $css);
		$css = preg_replace('@:\\s*/\\*\\s*\\*/@', ':/*keep*/', $css);

		// apply callback to all valid comments (and strip out surrounding ws
		$css = preg_replace_callback('@\\s*/\\*([\\s\\S]*?)\\*/\\s*@'
			,array($this, '_commentCB'), $css);

		// remove ws around { } and last semicolon in declaration block
		$css = preg_replace('/\\s*{\\s*/', '{', $css);
		$css = preg_replace('/;?\\s*}\\s*/', '}', $css);

		// remove ws surrounding semicolons
		$css = preg_replace('/\\s*;\\s*/', ';', $css);

		// remove ws around urls
		$css = preg_replace('/
                url\\(      # url(
                \\s*
                ([^\\)]+?)  # 1 = the URL (really just a bunch of non right parenthesis)
                \\s*
                \\)         # )
            /x', 'url($1)', $css);

		// remove ws between rules and colons
		$css = preg_replace('/
                \\s*
                ([{;])              # 1 = beginning of block or rule separator 
                \\s*
                ([\\*_]?[\\w\\-]+)  # 2 = property (and maybe IE filter)
                \\s*
                :
                \\s*
                (\\b|[#\'"-])        # 3 = first character of a value
            /x', '$1$2:$3', $css);

		// remove ws in selectors
		$css = preg_replace_callback('/
                (?:              # non-capture
                    \\s*
                    [^~>+,\\s]+  # selector part
                    \\s*
                    [,>+~]       # combinators
                )+
                \\s*
                [^~>+,\\s]+      # selector part
                {                # open declaration block
            /x'
			,array($this, '_selectorsCB'), $css);

		// minimize hex colors
		$css = preg_replace('/([^=])#([a-f\\d])\\2([a-f\\d])\\3([a-f\\d])\\4([\\s;\\}])/i'
			, '$1#$2$3$4$5', $css);

		// remove spaces between font families
		$css = preg_replace_callback('/font-family:([^;}]+)([;}])/'
			,array($this, '_fontFamilyCB'), $css);

		$css = preg_replace('/@import\\s+url/', '@import url', $css);

		// replace any ws involving newlines with a single newline
		$css = preg_replace('/[ \\t]*\\n+\\s*/', "\n", $css);

		// separate common descendent selectors w/ newlines (to limit line lengths)
		$css = preg_replace('/([\\w#\\.\\*]+)\\s+([\\w#\\.\\*]+){/', "$1\n$2{", $css);

		// Use newline after 1st numeric value (to limit line lengths).
		$css = preg_replace('/
            ((?:padding|margin|border|outline):\\d+(?:px|em)?) # 1 = prop : 1st numeric value
            \\s+
            /x'
			,"$1\n", $css);

		// prevent triggering IE6 bug: http://www.crankygeek.com/ie6pebug/
		$css = preg_replace('/:first-l(etter|ine)\\{/', ':first-l$1 {', $css);

		return trim($css);
	}

	/**
	 * Replace what looks like a set of selectors
	 *
	 * @param array $m regex matches
	 *
	 * @return string
	 */
	protected function _selectorsCB($m)
	{
		// remove ws around the combinators
		return preg_replace('/\\s*([,>+~])\\s*/', '$1', $m[0]);
	}

	/**
	 * Process a comment and return a replacement
	 *
	 * @param array $m regex matches
	 *
	 * @return string
	 */
	protected function _commentCB($m)
	{
		$hasSurroundingWs = (trim($m[0]) !== $m[1]);
		$m = $m[1];
		// $m is the comment content w/o the surrounding tokens,
		// but the return value will replace the entire comment.
		if ($m === 'keep') {
			return '/**/';
		}
		if ($m === '" "') {
			// component of http://tantek.com/CSS/Examples/midpass.html
			return '/*" "*/';
		}
		if (preg_match('@";\\}\\s*\\}/\\*\\s+@', $m)) {
			// component of http://tantek.com/CSS/Examples/midpass.html
			return '/*";}}/* */';
		}
		if ($this->_inHack) {
			// inversion: feeding only to one browser
			if (preg_match('@
                    ^/               # comment started like /*/
                    \\s*
                    (\\S[\\s\\S]+?)  # has at least some non-ws content
                    \\s*
                    /\\*             # ends like /*/ or /**/
                @x', $m, $n)) {
				// end hack mode after this comment, but preserve the hack and comment content
				$this->_inHack = false;
				return "/*/{$n[1]}/**/";
			}
		}
		if (substr($m, -1) === '\\') { // comment ends like \*/
			// begin hack mode and preserve hack
			$this->_inHack = true;
			return '/*\\*/';
		}
		if ($m !== '' && $m[0] === '/') { // comment looks like /*/ foo */
			// begin hack mode and preserve hack
			$this->_inHack = true;
			return '/*/*/';
		}
		if ($this->_inHack) {
			// a regular comment ends hack mode but should be preserved
			$this->_inHack = false;
			return '/**/';
		}
		// Issue 107: if there's any surrounding whitespace, it may be important, so
		// replace the comment with a single space
		return $hasSurroundingWs // remove all other comments
			? ' '
			: '';
	}

	/**
	 * Process a font-family listing and return a replacement
	 *
	 * @param array $m regex matches
	 *
	 * @return string
	 */
	protected function _fontFamilyCB($m)
	{
		// Issue 210: must not eliminate WS between words in unquoted families
		$pieces = preg_split('/(\'[^\']+\'|"[^"]+")/', $m[1], null, PREG_SPLIT_DELIM_CAPTURE | PREG_SPLIT_NO_EMPTY);
		$out = 'font-family:';
		while (null !== ($piece = array_shift($pieces))) {
			if ($piece[0] !== '"' && $piece[0] !== "'") {
				$piece = preg_replace('/\\s+/', ' ', $piece);
				$piece = preg_replace('/\\s?,\\s?/', ',', $piece);
			}
			$out .= $piece;
		}
		return $out . $m[2];
	}
}

function minify_css($content) {

	if (defined('HTTP_CATALOG') ) {
		return $content;
	}

	return CssMinifier::process($content);
}

class HtmlMinifier {
	/**
	 * @var boolean
	 */
	protected $_jsCleanComments = true;

	protected $_keepHTMLComments = false;

	/**
	 * "Minify" an HTML page
	 *
	 * @param string $html
	 *
	 * @param array $options
	 *
	 * 'cssMinifier' : (optional) callback function to process content of STYLE
	 * elements.
	 *
	 * 'jsMinifier' : (optional) callback function to process content of SCRIPT
	 * elements. Note: the type attribute is ignored.
	 *
	 * 'xhtml' : (optional boolean) should content be treated as XHTML1.0? If
	 * unset, minify will sniff for an XHTML doctype.
	 *
	 * @return string
	 */
	public static function process($html, $options = array()) {
		$min = new self($html, $options);
		return $min->_process();
	}


	/**
	 * Create a minifier object
	 *
	 * @param string $html
	 *
	 * @param array $options
	 *
	 * 'cssMinifier' : (optional) callback function to process content of STYLE
	 * elements.
	 *
	 * 'jsMinifier' : (optional) callback function to process content of SCRIPT
	 * elements. Note: the type attribute is ignored.
	 *
	 * 'jsCleanComments' : (optional) whether to remove HTML comments beginning and end of script block
	 *
	 * 'xhtml' : (optional boolean) should content be treated as XHTML1.0? If
	 * unset, minify will sniff for an XHTML doctype.
	 *
	 * @return null
	 */
	public function __construct($html, $options = array())
	{
		$this->_html = str_replace("\r\n", "\n", trim($html));
		if (isset($options['xhtml'])) {
			$this->_isXhtml = (bool)$options['xhtml'];
		}

		$this->_cssMinifier = 'minify_css';
		$this->_jsMinifier = 'minify_js';

		if (isset($options['jsCleanComments'])) {
			$this->_jsCleanComments = (bool)$options['jsCleanComments'];
		}
		if (isset($options['keepHTMLComments'])) {
			$this->_keepHTMLComments = (bool)$options['keepHTMLComments'];
		}
	}


	/**
	 * Minify the markeup given in the constructor
	 *
	 * @return string
	 */
	public function _process()
	{
		if ($this->_isXhtml === null) {
			$this->_isXhtml = (false !== strpos($this->_html, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML'));
		}

		$this->_replacementHash = 'MINIFYHTML' . md5($_SERVER['REQUEST_TIME']);
		$this->_placeholders = array();

		// replace SCRIPTs (and minify) with placeholders
		$this->_html = preg_replace_callback(
			'/(\\s*)<script(\\b[^>]*?>)([\\s\\S]*?)<\\/script>(\\s*)/i'
			,array($this, '_removeScriptCB')
			,$this->_html);

		// replace STYLEs (and minify) with placeholders
		$this->_html = preg_replace_callback(
			'/\\s*<style(\\b[^>]*>)([\\s\\S]*?)<\\/style>\\s*/i'
			,array($this, '_removeStyleCB')
			,$this->_html);

		// minify styles
		$this->_html = preg_replace_callback(
			'/\\s*<link(\\b[^>]*>)\\s*/i'
			,array($this, '_minifyStyles')
			,$this->_html);

		// remove HTML comments (not containing IE conditional comments).
		if (!$this->_keepHTMLComments) {
			$this->_html = preg_replace_callback(
				'/<!--([\\s\\S]*?)-->/'
				,array($this, '_commentCB')
				,$this->_html);
		}

		// replace PREs with placeholders
		$this->_html = preg_replace_callback('/\\s*<pre(\\b[^>]*?>[\\s\\S]*?<\\/pre>)\\s*/i'
			,array($this, '_removePreCB')
			,$this->_html);

		// replace TEXTAREAs with placeholders
		$this->_html = preg_replace_callback(
			'/\\s*<textarea(\\b[^>]*?>[\\s\\S]*?<\\/textarea>)\\s*/i'
			,array($this, '_removeTextareaCB')
			,$this->_html);

		// trim each line.
		// @todo take into account attribute values that span multiple lines.
		$this->_html = preg_replace('/^\\s+|\\s+$/m', '', $this->_html);

		// remove ws around block/undisplayed elements
		$this->_html = preg_replace('/\\s+(<\\/?(?:area|base(?:font)?|blockquote|body'
			.'|caption|center|cite|col(?:group)?|dd|dir|div|dl|dt|fieldset|form'
			.'|frame(?:set)?|h[1-6]|head|hr|html|legend|li|link|map|menu|meta'
			.'|ol|opt(?:group|ion)|p|param|t(?:able|body|head|d|h||r|foot|itle)'
			.'|ul)\\b[^>]*>)/i', '$1', $this->_html);

		// remove ws outside of all elements
		$this->_html = preg_replace(
			'/>(\\s(?:\\s*))?([^<]+)(\\s(?:\s*))?</'
			,'>$1$2$3<'
			,$this->_html);

		// use newlines before 1st attribute in open tags (to limit line lengths)
		//$this->_html = preg_replace('/(<[a-z\\-]+)\\s+([^>]+>)/i', "$1\n$2", $this->_html);

		// fill placeholders
		$this->_html = str_replace(
			array_keys($this->_placeholders)
			,array_values($this->_placeholders)
			,$this->_html
		);
		// issue 229: multi-pass to catch scripts that didn't get replaced in textareas
		$this->_html = str_replace(
			array_keys($this->_placeholders)
			,array_values($this->_placeholders)
			,$this->_html
		);
		return $this->_html;
	}

	protected function _commentCB($m)
	{
		return (0 === strpos($m[1], '[') || false !== strpos($m[1], '<!['))
			? $m[0]
			: '';
	}

	protected function _reservePlace($content)
	{
		$placeholder = '%' . $this->_replacementHash . count($this->_placeholders) . '%';
		$this->_placeholders[$placeholder] = $content;
		return $placeholder;
	}

	protected $_isXhtml = null;
	protected $_replacementHash = null;
	protected $_placeholders = array();
	protected $_cssMinifier = null;
	protected $_jsMinifier = null;

	protected function _removePreCB($m)
	{
		return $this->_reservePlace("<pre{$m[1]}");
	}

	protected function _removeTextareaCB($m)
	{
		return $this->_reservePlace("<textarea{$m[1]}");
	}

	protected function _minifyStyles($m)
	{

		$matches = "";
		if( preg_match("/\\shref=(?:(?:\\'([^\\']*)\\')|(?:\"([^\"]*)\")|([^\\s]*))/i"," " . $m[1], $matches) ) {

			if( isset($matches[2]) ) {
				$link = $matches[2];
			} else {
				$link = $matches[1];
			}

			if( isset($_SERVER['HTTPS'] ) ) {
				$server_url = 'https://'.$_SERVER['SERVER_NAME'].'/';
			}else{
				$server_url = 'http://'.$_SERVER['SERVER_NAME'].'/';
			}

			$need_slash= '/';
			if( 0 === strpos($link, $server_url)){
				$link=str_replace($server_url,'',$link);
				$need_slash = '';
			}
			if( 0 === strpos($link, '/')){
				$link=substr($link,1);
				$need_slash= '';
			}

			$matches_version ="";
			// убераем если есть что то после .css
			if(preg_match_all("/^(.*?\\.css)(.*)$/is",$link,$matches_version)){
				if( isset($matches_version[2][0]) ) {
					$link = str_replace($matches_version[2][0],'',$link);
				}
			}

			if( 0 === strpos($link, "catalog/") || 0 === strpos($link, "system/") ) {
				// Наш пациент, стиль локальный
				//$newLink = rtrim(dirname($link),'/') . "/compact-" . basename($link);
				$newLink = $need_slash . "media/" . str_replace("/","_",$link);

				$source = rtrim(realpath(DIR_APPLICATION . "../"),"/") . "/" . $link;
				$dest = rtrim(realpath(DIR_APPLICATION . "../"),"/") . "/" . $newLink;
				if( !file_exists($dest) || @filemtime($dest) < @filemtime($source) ) {
					$css = @file_get_contents($source);
					$minifier = $this->_cssMinifier ? $this->_cssMinifier : 'trim';
					$css = call_user_func($minifier, $css);

					// Теперь надо заменить абсолютные пути на относительные, от корня.
					// Было src:url('../fonts/fontawesome-webfont.eot?v=4.4.0')
					// Стало src:url('/catalog/view/stylesheet/fonts/fontawesome-webfont.eot?v=4.4.0')
					$base_path = "/" . ltrim( rtrim(dirname(dirname($link)),"/") , "/" ) . "/";
					$css = str_replace("../",$base_path, $css);

					if( FALSE === file_put_contents($dest, $css) ) {
						return $m[0];
					}
				}

				if( defined('FORCE_INLINE_OPTIMIZATION') ) {
					$destContent = file_get_contents($dest);
					if( trim($destContent) == "" ) {
						return "";
					} else {
						return "<style>" . $destContent . "</style>" ;
					}
				}
				return str_replace($link, $newLink, $m[0]);
			}

		}
		return $m[0];
	}

	protected function _removeStyleCB($m)
	{
		$openStyle = "<style{$m[1]}";
		$css = $m[2];
		// remove HTML comments
		$css = preg_replace('/(?:^\\s*<!--|-->\\s*$)/', '', $css);

		// remove CDATA section markers
		$css = $this->_removeCdata($css);

		// minify
		$minifier = $this->_cssMinifier
			? $this->_cssMinifier
			: 'trim';
		$css = call_user_func($minifier, $css);

		return $this->_reservePlace($this->_needsCdata($css)
			? "{$openStyle}/*<![CDATA[*/{$css}/*]]>*/</style>"
			: "{$openStyle}{$css}</style>"
		);
	}

	protected function _removeScriptCB($m)
	{
		$matches = "";
		if( preg_match("/\\ssrc=(?:(?:\\'([^\\']*)\\')|(?:\"([^\"]*)\")|([^\\s]*))/i"," " . $m[2], $matches) ) {
			if( isset($matches[2]) ) {
				$link = $matches[2];
			} else {
				$link = $matches[1];
			}

			if( isset($_SERVER['HTTPS'] ) ) {
				$server_url = 'https://'.$_SERVER['SERVER_NAME'].'/';
			}else{
				$server_url = 'http://'.$_SERVER['SERVER_NAME'].'/';
			}

			$need_slash= '/';
			if( 0 === strpos($link, $server_url)){
				$link=str_replace($server_url,'',$link);
				$need_slash = '';
			}
			if( 0 === strpos($link, '/')){
				$link=substr($link,1);
				$need_slash= '';
			}

			$matches_version ="";
			// убераем если есть что то после .js
			if(preg_match_all("/^(.*?\\.js)(.*)$/is",$link,$matches_version)){
				if( isset($matches_version[2][0]) ) {
					$link = str_replace($matches_version[2][0],'',$link);
				}
			}

			if( 0 === strpos($link, "catalog/") || 0 === strpos($link, "system/") ) {
				// Наш пациент, скрипт локальный
				//$newLink = rtrim(dirname($link),'/') . "/compact-" . basename($link);
				$newLink = $need_slash . "media/" . str_replace("/","_",$link);
				//var_dump($newLink);
				//exit;

				$source = rtrim(realpath(DIR_APPLICATION . "../"),"/") . "/" . $link;
				$dest = rtrim(realpath(DIR_APPLICATION . "../"),"/") . "/" . $newLink;

				if( !file_exists($dest) || @filemtime($dest) < @filemtime($source) ) {
					$dirname = dirname($dest);
					if (!file_exists($dirname)) {
						mkdir($dirname, 0777, true);
					}
					$js = @file_get_contents($source);
					$minifier = $this->_jsMinifier
						? $this->_jsMinifier
						: 'trim';
					$js = call_user_func($minifier, $js);
					if( FALSE === file_put_contents($dest, $js) ) {
						return $m[0];
					}
				}

				if( defined('FORCE_INLINE_OPTIMIZATION') ) {
					$destContent = file_get_contents($dest);
					if( trim($destContent) == "" ) {
						return "";
					} else {
						return "<script>" . $destContent . "</script>" ;
					}
				}
				return str_replace($link, $newLink, $m[0]);
			}
		}

		$openScript = "<script{$m[2]}";
		$js = $m[3];

		// whitespace surrounding? preserve at least one space
		$ws1 = ($m[1] === '') ? '' : ' ';
		$ws2 = ($m[4] === '') ? '' : ' ';

		// remove HTML comments (and ending "//" if present)
		if ($this->_jsCleanComments) {
			$js = preg_replace('/(?:^\\s*<!--\\s*|\\s*(?:\\/\\/)?\\s*-->\\s*$)/', '', $js);
		}

		// remove CDATA section markers
		$js = $this->_removeCdata($js);

		// minify
		$minifier = $this->_jsMinifier
			? $this->_jsMinifier
			: 'trim';
		$js = call_user_func($minifier, $js);

		return $this->_reservePlace($this->_needsCdata($js)
			? "{$ws1}{$openScript}/*<![CDATA[*/{$js}/*]]>*/</script>{$ws2}"
			: "{$ws1}{$openScript}{$js}</script>{$ws2}"
		);
	}

	protected function _removeCdata($str)
	{
		return (false !== strpos($str, '<![CDATA['))
			? str_replace(array('<![CDATA[', ']]>'), '', $str)
			: $str;
	}

	protected function _needsCdata($str)
	{
		return ($this->_isXhtml && preg_match('/(?:[<&]|\\-\\-|\\]\\]>)/', $str));
	}
}

class ModelToolSoforpOptimizer extends Model
{
	public function process($content)
	{
		return HtmlMinifier::process($content, array(
			'jsCleanComments' => true,
			'keepHTMLComments' => true
		));
	}

}
