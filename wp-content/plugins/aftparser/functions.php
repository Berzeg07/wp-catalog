<?php
//
/**
 * 
 * Дополнительные функции
 * 
 */

if (!defined( 'ABSPATH' )){
	exit('Вызов файлов плагина напрямую запрещен.');
}

if(!function_exists("apt_generate_post_thumb")){
    /**
     * Function to fetch the image from URL and generate the required thumbnails
     */
    function apt_generate_post_thumb($matches, $key, $post_content, $post_id){

        // Make sure to assign correct title to the image. Extract it from img tag
        $imageTitle = '';
        preg_match_all('/<\s*img [^\>]*title\s*=\s*[\""\']?([^\""\'>]*)/i', $post_content, $matchesTitle);

        if (count($matchesTitle) && isset($matchesTitle[1])) {
            $imageTitle = $matchesTitle[1][$key];
        }

        // Get the URL now for further processing
        $imageUrl = $matches[1][$key];


        if (!(($uploads = wp_upload_dir(current_time('mysql')) ) && false === $uploads['error'])) {
            return null;
        }

        $max_size = 50;
        foreach ($matches[1] as $key => $ff) {
            $size = getimagesize($uploads['path']."/".$ff);
            if($size && intval($size[0]) > intval($max_size)){
                $imageUrl = $ff;
                $max_size = intval($size[0]);
            }
        }

        // Get the file name
        $filename = substr($imageUrl, (strrpos($imageUrl, '/'))+1);

        // Generate unique file name
        $filename = wp_unique_filename( $uploads['path'], $filename );

        // Move the file to the uploads dir
        $new_file = $uploads['path'] . "/$filename";

        if (!ini_get('allow_url_fopen')) {
            $file_data = curl_get_file_contents($imageUrl);
        } else {
            $file_data = @file_get_contents($imageUrl);
        }

        if (!$file_data) {
            return null;
        }

        file_put_contents($new_file, $file_data);

        // Set correct file permissions
        $stat = stat( dirname( $new_file ));
        $perms = $stat['mode'] & 0000666;
        @ chmod( $new_file, $perms );

        // Get the file type. Must to use it as a post thumbnail.
        $wp_filetype = wp_check_filetype( $filename, $mimes );

        extract( $wp_filetype );

        // No file type! No point to proceed further
        if ( ( !$type || !$ext ) && !current_user_can( 'unfiltered_upload' ) ) {
            return null;
        }

        // Compute the URL
        $url = $uploads['url'] . "/$filename";

        // Construct the attachment array
        $attachment = array(
            'post_mime_type' => $type,
            'guid' => $url,
            'post_parent' => null,
            'post_title' => $imageTitle,
            'post_content' => '',
        );

        $thumb_id = wp_insert_attachment($attachment, $file, $post_id);
        if ( !is_wp_error($thumb_id) ) {
            require_once(ABSPATH . '/wp-admin/includes/image.php');

            // Added fix by misthero as suggested
            wp_update_attachment_metadata( $thumb_id, wp_generate_attachment_metadata( $thumb_id, $new_file ) );
            update_attached_file( $thumb_id, $new_file );

            return $thumb_id;
        }

        return null;
    }
}
 
function startsWith($haystack, $needle) {
    return $needle === "" || strrpos($haystack, $needle, -strlen($haystack)) !== FALSE;
}

function endsWith($haystack, $needle) {
    return $needle === "" || strpos($haystack, $needle, strlen($haystack) - strlen($needle)) !== FALSE;
}

/**
 * Генерация случайной строки для имени картинки
 * $l- длинна строки, к примеру 9 символов. $c - из каких символов бдет эта строка состоять
 */
if(!function_exists('h_rand_str')){
	function h_rand_str ($l, $c = 'abcdefghijklmnopqrstuvwxyz1234567890') {
		for ($s = '', $cl = strlen($c)-1, $i = 0; $i < $l; $s .= $c[mt_rand(0, $cl)], ++$i);
		return $s;
	}
}
// Объединяет воедино chunked html
if(!function_exists('http_unchunk')){
	function http_unchunk($chunk) { 
        $pos = 0; 
        $len = strlen($chunk); 
        $dechunk = null; 

        while(($pos < $len) 
            && ($chunkLenHex = substr($chunk,$pos, ($newlineAt = strpos($chunk,"\n",$pos+1))-$pos))) 
        { 
            if (! is_hex($chunkLenHex)) { 
                trigger_error('Value is not properly chunk encoded', E_USER_WARNING); 
                return $chunk; 
            } 

            $pos = $newlineAt + 1; 
            $chunkLen = hexdec(rtrim($chunkLenHex,"\r\n")); 
            $dechunk .= substr($chunk, $pos, $chunkLen); 
            $pos = strpos($chunk, "\n", $pos + $chunkLen) + 1; 
        } 
        return $dechunk; 
    } 
} 
if(!function_exists('is_hex')){
    /** 
     * determine if a string can represent a number in hexadecimal 
     * 
     * @param string $hex 
     * @return boolean true if the string is a hex, otherwise false 
     */ 
    function is_hex($hex) { 
        // regex is for weenies 
        $hex = strtolower(trim(ltrim($hex,"0"))); 
        if (empty($hex)) { $hex = 0; }; 
        $dec = hexdec($hex); 
        return ($hex == dechex($dec)); 
    } 
}