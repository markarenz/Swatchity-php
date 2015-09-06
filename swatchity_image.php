<?php
$hex="0000FF";
if (isset($_GET['hex'])){
	$hex=$_GET['hex'];
}
$r=hexdec(substr($hex,0,2));
$g=hexdec(substr($hex,2,2));
$b=hexdec(substr($hex,4,2));

$im = imagecreatetruecolor(550, 420);
$clr = imagecolorallocate($im, $r, $g, $b);
imagefill($im, 0, 0, $clr);
header('Content-type: image/png');
imagepng($im);
imagedestroy($im);
?>