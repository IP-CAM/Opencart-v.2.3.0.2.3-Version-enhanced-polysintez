<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ModelToolImage extends Model {
	public function resize($filename, $width, $height) {

//        /* NeoSeo Watermark - begin */
//        $this->load->model("tool/soforp_watermark");
//        return $this->model_tool_soforp_watermark->resize($filename, $width, $height );
//        /* NeoSeo Watermark - end */
            
		if (!is_file(DIR_IMAGE . $filename) || substr(str_replace('\\', '/', realpath(DIR_IMAGE . $filename)), 0, strlen(DIR_IMAGE)) != DIR_IMAGE) {
			return;
		}

		$extension = pathinfo($filename, PATHINFO_EXTENSION);

		$image_old = $filename;
		$image_new = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . (int)$width . 'x' . (int)$height . '.' . $extension;

		if (!is_file(DIR_IMAGE . $image_new) || (filectime(DIR_IMAGE . $image_old) > filectime(DIR_IMAGE . $image_new))) {
			list($width_orig, $height_orig, $image_type) = getimagesize(DIR_IMAGE . $image_old);
				 
			
            $info = getimagesize(DIR_IMAGE . $image_old);
				 
			if (!in_array($image_type, array(IMAGETYPE_PNG, IMAGETYPE_JPEG, IMAGETYPE_GIF))  && (isset($info['mime']) && ($info['mime'] != 'image/svg+xml'))) { 
       
				return DIR_IMAGE . $image_old;
			}
						
			$path = '';

			$directories = explode('/', dirname($image_new));

			foreach ($directories as $directory) {
				$path = $path . '/' . $directory;

				if (!is_dir(DIR_IMAGE . $path)) {
					@mkdir(DIR_IMAGE . $path, 0777);
				}
			}

			
		if (($width_orig != $width || $height_orig != $height) && isset($width_orig)) {
      
				$image = new Image(DIR_IMAGE . $image_old);
				$image->resize($width, $height);
				
		//opencart turbo start
			if ($this->config->get('turbo_global_jpg_image') && $this->config->get('turbo_global_png_image')  && $this->config->get('turbo_status')) {
				$image->save(DIR_IMAGE . $image_new, (int)$this->config->get('turbo_global_jpg_image'), (int)$this->config->get('turbo_global_png_image'));	
			} else {
				$image->save(DIR_IMAGE . $image_new);
			}
		//opencart turbo end 
	
			} else {
				copy(DIR_IMAGE . $image_old, DIR_IMAGE . $image_new);
			}
		}
		
		$imagepath_parts = explode('/', $image_new);
		$image_new = implode('/', array_map('rawurlencode', $imagepath_parts));
		
		if ($this->request->server['HTTPS']) {
			return $this->config->get('config_ssl') . 'image/' . $image_new;
		} else {
			return $this->config->get('config_url') . 'image/' . $image_new;
		}
	}
}