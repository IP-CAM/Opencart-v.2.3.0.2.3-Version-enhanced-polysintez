<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

final class Front {
	private $registry;
	private $pre_action = array();
	private $error;

	public function __construct($registry) {
		$this->registry = $registry;
	}
	
	public function addPreAction(Action $pre_action) {
		$this->pre_action[] = $pre_action;
	}
	
	public function dispatch(Action $action, Action $error) {
		$this->error = $error;

		foreach ($this->pre_action as $pre_action) {
			$result = $this->execute($pre_action);

			if ($result instanceof Action) {
				$action = $result;

				break;
			}
		}


        /* NeoSeo Redirect Manager - begin */
        if ( ( defined('REDIRECT_ENABLED') || (!defined('HTTP_CATALOG') && isset($_SERVER['HTTP_HOST']) ) ) && $this->registry->get("config")->get('soforp_redirect_manager_status') == 1 ) {
            $this->registry->get("load")->model('tool/soforp_redirect_manager');
            $this->registry->get("model_tool_soforp_redirect_manager")->checkUrl();
        }
        /* NeoSeo Redirect Manager - end */
                
		while ($action instanceof Action) {
			$action = $this->execute($action);
		}
	}

	private function execute(Action $action) {
		$result = $action->execute($this->registry);

		if ($result instanceof Action) {
			return $result;
		} 
		
		if ($result instanceof Exception) {
			$action = $this->error;
			
			$this->error = null;
			
			return $action;
		}
	}
}
