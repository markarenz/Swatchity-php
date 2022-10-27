<?php
	include('swatchity_config.php');
	include('swatchity_db_connect.php');
	include('swatchity_functions.php');

	if (isset($_GET['id'])){
		$id=ingest_var_safe("id","get");
		$q="select * from swatches, users where user_id=swatch_user AND swatch_id='$id'";
		$result=mysqli_query($db,$q);
		$swatch=mysqli_fetch_assoc($result);
		$hex=$swatch['swatch_color'];
		mysqli_free_result($result);
	}
	if (isset($_GET['hex'])){
		$hex=$_GET['hex'];
		$dec=dechex($hex);
		$hex=dechex($dec);
	}
	$img_url=$swatchity_config['base_domain']."/swatchity_image.php?hex=".$hex;
	$user_profile_bits=explode(",",$swatch['user_profile']);
	for ($i=0;$i<=3;$i++){
		if ($user_profile_bits[$i]==""){
			$user_profile_bits[$i]="000000";
		}
	}
	$timestamp=date('D M j @h:ia',strtotime($swatch['swatch_date']));
	$this_url=$swatchity_config['base_domain']."/share.php?id=".$id;
	$short_url=make_bitly_url($this_url,'swatchitybitly','R_3e4fa3bfc8d4491199e9ef82e1590bfd');

?><!DOCTYPE html>
<html class="" lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<meta name="twitter:card" content="summary_large_image">
		<meta name="twitter:site" content="@swatchity">
		<meta name="twitter:creator" content="@swatchity">
		<meta name="twitter:title" content="Swatch">
		<meta name="twitter:description" content="A color">
		<meta name="twitter:image" content="<?php echo $img_url; ?>">

		<meta property="og:title" content="Swatch by <?php echo $swatch['user_name'];?>" />
		<meta property="og:site_name" content="Swatchity"/>
		<meta property="og:url" content="<?php echo $this_url; ?>" />
		<meta property="og:description" content="Who has time to read 140 characters? Swatchity makes it easy! Just pick a color and go! Catch up with friends, build your brand, code your app, and share your precious family photos! Swatchity: live a more colorful life!" />
		<meta property="og:image" content="<?php echo $img_url; ?>" />



		<link href='http://fonts.googleapis.com/css?family=Bubbler+One' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Belgrano' rel='stylesheet' type='text/css'>
		<link rel='stylesheet' href='/swatchity.css' type='text/css' media='all' />
		<title>Swatchity.com | Swatch by <?php echo $swatch['user_name'];?></title>
	</head>
	<body>
			<div class="casual_header">
				<a href="<?php echo $swatchity_config['base_domain']; ?>"><img src="images/swtchity_logo_100.png" alt="logo" style="margin-top:20px;"></a>
			</div>

			<div class="share_swatch_container">

				<div style="text-align:right">
					<a href="<?php echo $swatchity_config['base_domain']; ?>?login=true">login/register</a>
				</div>

				<div class="share_swatch" id="swatch_main" style="background-color:#<?php echo $hex; ?>">
					<img src="<?php echo $swatchity_config['base_domain']; ?>/swatchity_image.php?hex=<?php echo $hex; ?>">
				</div>
				<div class="share_swatch_caption">
					<div class="feed_profile_badge">
					<?php
						for ($i=0;$i<=3;$i++){
							echo "<div style=\"float:left;width:50%;height:50%;background:#".$user_profile_bits[$i].";\"></div>";
						}
					?>
						<div class="feed_profile_badge_cover">
						</div>
					</div>
					<?php echo $swatch['user_name']." (L:".$swatch['user_level'].") - $timestamp"; ?>
				</div>
				
				<div class="v_spacer_50"></div>
				<div style="text-align:center">
					<a class="share_btn share_btn_facebook" target="_blank" href="http://www.facebook.com/sharer/sharer.php?u=<?php echo $this_url; ?>&t=Swatchity+-+Live+a+more+colorful+life!+<?php echo $swatchity_config['base_domain']; ?>"><span>Facebook</span></a>

					<a class="share_btn share_btn_twitter" target="_blank" href="https://twitter.com/intent/tweet?text=Swatchity:+Swatch+by+<?php echo urlencode($swatch['user_name']); ?>+%23Swatchity+<?php echo $short_url; ?>"><span>Twitter</span></a>

					<a class="share_btn share_btn_linkedIn" target="_blank" href="https://www.linkedin.com/shareArticle?mini=true&url=<?php echo $short_url;?>&title=Swatch%20by%20<?php echo urlencode($swatch['user_name']);?>&summary=Live%20a%20more%20colorful%20life%20at%20Swatchity.com!&source=Swatchity.com"><span>LinkedIn</span></a>

					<a class="share_btn share_btn_pinterest" target="_blank" href="https://pinterest.com/pin/create/button/?url=<?php echo $short_url;?>&media=<?php echo $img_url;?>&description=Live%20a%20more%20colorful%20life%20at%20Swatchity.com!"><span>Pinterest</span></a>

					<a class="share_btn share_btn_googlePlus" target="_blank" href="https://plus.google.com/share?url=<?php echo $this_url;?>"><span>Google+</span></a>

					<div class="v_spacer_50"></div>

					<h1 style="color:#249d82;"><i>Live a more colorful life today!</i></h1>
					<a href="<?php echo $swatchity_config['base_domain']; ?>?login=true"><img src="images/public_btn_get_started.jpg" class="img_center_full" alt="get started"></a>

				</div>



				
			</div>
				<div class="v_spacer_50"></div>
				<div class="v_spacer_50"></div>


		<style>
			#swatch_main:after{
				border-color: #<?php echo $hex;?> transparent;
			}
		</style>
		<?php include('swatchity_footer_simple.php');?>
	</body>
</html>
<?php mysqli_close($db); ?>