<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
if ( ! function_exists('array2xml')) {
	/**
	 * 배열을 XML로 바꾸어 출력한다.
	 * @param Array $data
	 */
	function array2xml($data, $deepth = 0)
	{
		if(!empty($data) && is_array($data)) {
			foreach ($data as $key => $value) {
				$tabs = str_repeat("\t", $deepth);

				if(is_array($value) && !empty($value)) {
					foreach ($value as $sub_data) {
						echo "{$tabs}<{$key}>\n";
						array2xml($sub_data, $deepth + 1);
						echo "{$tabs}</{$key}>\n";
					}
				} else {
					echo $tabs . '<' . $key . '>' . xml_convert(str_replace(chr(8), '', empty($value) ? NULL : $value)) . '</' . $key . '>' . "\n";
				}
			}
		} else {
			echo is_array($data) ? '' : str_replace(chr(8), '', $data);
		}
	}
}