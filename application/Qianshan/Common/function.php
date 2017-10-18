<?php

function GetInputHtml($name,$type,$content,$provalue){
	$inputHtml = '';
	if ($type == 'text'){
		$inputHtml = '<input type="text" name="'.$name.'" value="'.$provalue.'">';
	}elseif ($type == 'radio'){
		$inputHtml = '<input type="radio" name="'.$name.'" >'.$content;
	}elseif ($type == 'checkbox'){
		foreach (explode("\n",$content) as $k=>$v){
			list($value,$text) = explode("=",$v);
			$inputHtml .= '<input type="checkbox" name="'.$name.'[]" value="'.$value.'" '.(in_array($value,$provalue) ? 'checked="checked"' : '').'>'.$text;
		}
	}elseif ($type == 'select'){
		$inputHtml = '<select name="'.$name.'">';
		foreach (explode("\n",$content) as $k=>$v){
			list($value,$text) = explode("=",$v);
			$inputHtml .= '<option value="'.intval($value).'">'.trim($text).'</option>';
		}
		$inputHtml .= '</select>';
	}elseif ($type == 'mselect'){
		
	}elseif ($type == 'color'){
	}elseif ($type == 'date'){
	}elseif ($type == 'datetime'){
	}elseif ($type == 'month'){
	}elseif ($type == 'week'){
		
	}elseif ($type == 'range'){
		$inputHtml .= '<input type="range" name="'.$name.'" >';
	}elseif ($type == 'region'){
		$inputHtml .= '<input type="text" name="'.$name.'1" >-<input type="text" name="'.$name.'2" >';
	}
	
	return $inputHtml;
}
function GetSettingHtml($proinfo){
	$proinfokey = array();
	foreach ($proinfo as $k=>$v){
		$proinfokey[] = $k;
	}
	
	foreach (M('JsCanshu')->where()->select() as $k=>$v){
		if (in_array($v['name'],$proinfokey)){

			if (in_array($v['type'],array('checkbox'))){
				//dump($proinfo[$v['name']]);
				$proinfo[$v['name']] = unserialize($proinfo[$v['name']]);
			}
		}
	}
	return $proinfo;
}
/*
两个时间相差的年、月、天、时、秒、分、秒数、以及总的天数

*/
function diffDate($date1,$date2){
    $datetime1 = new \DateTime($date1);
    $datetime2 = new \DateTime($date2);
    $interval = $datetime1->diff($datetime2);
    $time['y']         = $interval->format('%Y');
    $time['m']         = $interval->format('%m');
    $time['d']         = $interval->format('%d');
    $time['h']         = $interval->format('%H');
    $time['i']         = $interval->format('%i');
    $time['s']         = $interval->format('%s');
    $time['a']         = $interval->format('%a');    // 两个时间相差总天数
    return $time;
}   
?>