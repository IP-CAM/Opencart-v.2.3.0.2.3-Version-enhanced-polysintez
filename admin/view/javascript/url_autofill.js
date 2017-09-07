var ru2en = {
  fromChars : 'абвгдезиклмнопрстуфэйхё',
  toChars : 'abvgdeziklmnoprstufeyhe',
  biChars : {'ы':'yi','ж':'j','ц':'ts','ч':'ch','ш':'sh','щ':'sch','ю':'yu','я':'ya','&':'-and-'},
  vowelChars : 'аеёиоуыэюя',
  translit : function(str) {
    str = str.replace(/[_\s\.,?!\[\](){}\\\/"':;]+/g, '-')
             .toLowerCase()
             .replace(new RegExp('(ь|ъ)(['+this.vowelChars+'])', 'g'), 'j$2')
             .replace(/(ь|ъ)/g, '');

    var _str = '';
    for (var x=0; x<str.length; x++)
      if ((index = this.fromChars.indexOf(str.charAt(x))) > -1)
        _str += this.toChars.charAt(index);
      else
        _str += str.charAt(x);
    str = _str;

    var _str = '';
    for (var x=0; x<str.length; x++)
      if (this.biChars[str.charAt(x)])
        _str += this.biChars[str.charAt(x)];
      else
        _str += str.charAt(x);
    str = _str;

    str = str.replace(/j{2,}/g, 'j')
             .replace(/[^-0-9a-z]+/g, '')
             .replace(/-{2,}/g, '-')
             .replace(/^-+|-+$/g, '');

    return str;
  }
}

function setTranslit(src, dst, force){
  if ($('input[name="'+src+'"]').val() != undefined){
      var srcVal = $('input[name="'+src+'"]').val();
      var dstVal = $('input[name="'+dst+'"]').val();

      if (force || (dstVal == ''))
        $('input[name="'+dst+'"]').val(ru2en.translit(srcVal));
		
	$('input[name="'+src+'"]').change(function(){
      var srcVal = $('input[name="'+src+'"]').val();
      var dstVal = $('input[name="'+dst+'"]').val();

      if (force || (dstVal == ''))
        $('input[name="'+dst+'"]').val(ru2en.translit(srcVal));
    });
  }
}

$(document).ready(function(){
  // Products
  setTranslit('product_description\\[' + language_id + '\\]\\[name\\]', 'keyword', false);
  // Info Articles
  setTranslit('information_description\\[' + language_id + '\\]\\[title\\]', 'keyword', false);
  // NEWS
  setTranslit('news\\[' + language_id + '\\]\\[title\\]', 'keyword', false);
  setTranslit('revblog_description\\[' + language_id + '\\]\\[title\\]', 'keyword', false);
  // Categories
  setTranslit('category_description\\[' + language_id + '\\]\\[name\\]', 'keyword', false);
  // Manufacturer
  setTranslit('name', 'keyword', false);
});