<?php

function locatep($n){
	if ($n == 2){
		return array(2);
	}
	elseif ($n < 2) {
		return array();
	}
	$p = array(2);
	$arr = array();
	for ($i = 3; $i < $n +1; $i+=2){
		array_push($arr, $i);
	}
	
	while (count($arr)> 1 && pow($arr[0], 2) <= $n){
		$num = array_shift($arr);
		array_push($p, $num);
		$arr = red($num, $arr);
	}
	$p = array_merge($p, $arr);
	return $p;
}

function red($k, $arr){
	$i = 2;
	while($k*$i <= end($arr)){
		reset($arr); //may not be needed
		$arr = array_diff($arr, array($k*$i));
		$i = $i + 1;
	}
	return $arr;
}

$n = $_GET["n"];
if($n > 200){
	$n = 200;
}
$a = locatep($n);
print_r($a);

?>