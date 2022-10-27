<?php
	error_reporting(0);
  session_start();
	include('swatchity_config.php');
	include('swatchity_db_connect.php');
	include('swatchity_functions.php');
	$mode=ingest_var_safe("mode","get");

	function save_notification($user_id,$label){
		global $db;
		$q="insert into notifications (notification_label,notification_user, notification_date) VALUES('$label', '$user_id', NOW())";
		mysqli_query($db,$q);
	}

	function encode_vrb($msg){
		$tmp="";
		for ($i=0;$i<strlen($msg);$i++){
			$val=ord(strtoupper(substr($msg,$i,1)));
			if (($val<65) || ($val>90)){
				$tmp.=substr($msg,$i,1);
			} else {
				$val=90-$val;
				//echo "(".$val.")";
				if ($val<10){$tmp.=$val;}else{
					$tmp.=chr(55+$val);
				}
			}
		}
		$msg="{".$tmp."}";
		$msg=str_replace("!","#",$msg);
		$msg=str_replace("?","*",$msg);
		$msg=str_replace(",","^",$msg);
		$msg=str_replace(".",";",$msg);
		$msg=str_replace(" ","/",$msg);
		return($msg);
	}





	switch($mode){
		case "save_user_level":
			$user_id=ingest_var_safe("user_id","post");
			$user_level=ingest_var_safe("user_level","post");
			$q="update users set user_level='$user_level' where user_id='$user_id'";
			mysqli_query($db,$q);
			save_notification($user_id,"Congratulations on achieving level $user_level!");

		break;
		case "translate_variant_b":
			$msg=ingest_var_safe("msg","get");
			echo encode_vrb($msg);
		break;
		case "get_ad":
			$q="select * from ads order by rand() limit 0,1";
			$result=mysqli_query($db,$q);
			while ($row=mysqli_fetch_assoc($result)){
				echo json_encode($row);
				echo "\n";
			}
			mysqli_free_result($result);
			break;
		case "get_num_unread_notifications":
			$user_id=ingest_var_safe("user_id","post");
			$user_last_read_notification=ingest_var_safe("user_last_read_notification","post");
			$user_last_read_notification*=1;
			$q="select count(notification_id) as count from notifications where notification_user=$user_id AND notification_id>$user_last_read_notification";
			$result=mysqli_query($db,$q);
			while ($row=mysqli_fetch_assoc($result)){
				$count=$row['count'];
			}
			echo $count;
			mysqli_free_result($result);
			break;
		case "upload_image":
			$user_id=ingest_var_safe("user_id","post");
			$data=ingest_var_safe("data","post");

			$tmp_path = $_FILES[0]['name'];
			$ext = strtolower(pathinfo($tmp_path, PATHINFO_EXTENSION));
			switch($ext){
				case "png":
					$img = imagecreatefrompng($_FILES[0]['tmp_name']);
				break;
				case "gif":
					$img = imagecreatefromgif($_FILES[0]['tmp_name']);
				break;
				default:
				// includes jpg / jpeg
					$img = imagecreatefromjpeg($_FILES[0]['tmp_name']);
				break;
			}

			
			$totals['r']=0;
			$totals['g']=0;
			$totals['b']=0;
			$pixels=0;
			
			$width=imagesx($img);
			$height=imagesy($img);
			
			$x=floor($width*.25);$y=floor($height*.25);
				$rgba=imagecolorsforindex($img, imagecolorat($img, $x, $y));$totals['r']+=$rgba['red'];$totals['g']+=$rgba['green'];$totals['b']+=$rgba['blue'];$pixels++;

			$x=floor($width*.5);$y=floor($height*.25);
				$rgba=imagecolorsforindex($img, imagecolorat($img, $x, $y));$totals['r']+=$rgba['red'];$totals['g']+=$rgba['green'];$totals['b']+=$rgba['blue'];$pixels++;
			$x=floor($width*.75);$y=floor($height*.25);
				$rgba=imagecolorsforindex($img, imagecolorat($img, $x, $y));$totals['r']+=$rgba['red'];$totals['g']+=$rgba['green'];$totals['b']+=$rgba['blue'];$pixels++;
			$x=floor($width*.25);$y=floor($height*.5);
				$rgba=imagecolorsforindex($img, imagecolorat($img, $x, $y));$totals['r']+=$rgba['red'];$totals['g']+=$rgba['green'];$totals['b']+=$rgba['blue'];$pixels++;
			$x=floor($width*.5);$y=floor($height*.5);
				$rgba=imagecolorsforindex($img, imagecolorat($img, $x, $y));$totals['r']+=$rgba['red'];$totals['g']+=$rgba['green'];$totals['b']+=$rgba['blue'];$pixels++;
			$x=floor($width*.75);$y=floor($height*.5);
				$rgba=imagecolorsforindex($img, imagecolorat($img, $x, $y));$totals['r']+=$rgba['red'];$totals['g']+=$rgba['green'];$totals['b']+=$rgba['blue'];$pixels++;
			$x=floor($width*.25);$y=floor($height*.75);
				$rgba=imagecolorsforindex($img, imagecolorat($img, $x, $y));$totals['r']+=$rgba['red'];$totals['g']+=$rgba['green'];$totals['b']+=$rgba['blue'];$pixels++;
			$x=floor($width*.5);$y=floor($height*.75);
				$rgba=imagecolorsforindex($img, imagecolorat($img, $x, $y));$totals['r']+=$rgba['red'];$totals['g']+=$rgba['green'];$totals['b']+=$rgba['blue'];$pixels++;
			$x=floor($width*.75);$y=floor($height*.75);
				$rgba=imagecolorsforindex($img, imagecolorat($img, $x, $y));$totals['r']+=$rgba['red'];$totals['g']+=$rgba['green'];$totals['b']+=$rgba['blue'];$pixels++;
/*				
			$x=floor($width*.25);$y=floor($height*.25);
				$rgb=imagecolorat($img,$x,$y);$r = ($rgb >> 16) & 0xFF;$g = ($rgb >> 8) & 0xFF;$b = $rgb & 0xFF;$totals['r']+=$r;$totals['g']+=$g;$totals['b']+=$b;$pixels++;
			$x=floor($width*.5);$y=floor($height*.25);
				$rgb=imagecolorat($img,$x,$y);$r = ($rgb >> 16) & 0xFF;$g = ($rgb >> 8) & 0xFF;$b = $rgb & 0xFF;$totals['r']+=$r;$totals['g']+=$g;$totals['b']+=$b;$pixels++;
			$x=floor($width*.75);$y=floor($height*.25);
				$rgb=imagecolorat($img,$x,$y);$r = ($rgb >> 16) & 0xFF;$g = ($rgb >> 8) & 0xFF;$b = $rgb & 0xFF;$totals['r']+=$r;$totals['g']+=$g;$totals['b']+=$b;$pixels++;
			$x=floor($width*.25);$y=floor($height*.5);
				$rgb=imagecolorat($img,$x,$y);$r = ($rgb >> 16) & 0xFF;$g = ($rgb >> 8) & 0xFF;$b = $rgb & 0xFF;$totals['r']+=$r;$totals['g']+=$g;$totals['b']+=$b;$pixels++;
			$x=floor($width*.5);$y=floor($height*.5);
				$rgb=imagecolorat($img,$x,$y);$r = ($rgb >> 16) & 0xFF;$g = ($rgb >> 8) & 0xFF;$b = $rgb & 0xFF;$totals['r']+=$r;$totals['g']+=$g;$totals['b']+=$b;$pixels++;
			$x=floor($width*.75);$y=floor($height*.5);
				$rgb=imagecolorat($img,$x,$y);$r = ($rgb >> 16) & 0xFF;$g = ($rgb >> 8) & 0xFF;$b = $rgb & 0xFF;$totals['r']+=$r;$totals['g']+=$g;$totals['b']+=$b;$pixels++;
			$x=floor($width*.25);$y=floor($height*.75);
				$rgb=imagecolorat($img,$x,$y);$r = ($rgb >> 16) & 0xFF;$g = ($rgb >> 8) & 0xFF;$b = $rgb & 0xFF;$totals['r']+=$r;$totals['g']+=$g;$totals['b']+=$b;$pixels++;
			$x=floor($width*.5);$y=floor($height*.75);
				$rgb=imagecolorat($img,$x,$y);$r = ($rgb >> 16) & 0xFF;$g = ($rgb >> 8) & 0xFF;$b = $rgb & 0xFF;$totals['r']+=$r;$totals['g']+=$g;$totals['b']+=$b;$pixels++;
			$x=floor($width*.75);$y=floor($height*.75);
				$rgb=imagecolorat($img,$x,$y);$r = ($rgb >> 16) & 0xFF;$g = ($rgb >> 8) & 0xFF;$b = $rgb & 0xFF;$totals['r']+=$r;$totals['g']+=$g;$totals['b']+=$b;$pixels++;
*/
			$avg_r=floor($totals['r']/$pixels);
			$avg_g=floor($totals['g']/$pixels);
			$avg_b=floor($totals['b']/$pixels);

			$tmp_r="";$tmp_g="";$tmp_b="";
			if ($avg_r<16){$tmp_r="0";}
			if ($avg_g<16){$tmp_g="0";}
			if ($avg_b<16){$tmp_b="0";}

			echo $tmp_r.dechex($avg_r).$tmp_g.dechex($avg_g).$tmp_b.dechex($avg_b);
//echo $totals['r']."*".$totals['g']."*".$totals['b'];
//echo "|".$avg_r."|".$avg_g."|".$avg_b;

		break;
		case "hello":
			echo "Is it mee you're looking for? I can see it in your eyes. I can see it in your smile.";
			break;
			
		case "set_user_last_read_notification":
			$user_id=ingest_var_safe("user_id","post");
			$user_last_read_notification=ingest_var_safe("user_last_read_notification","post");
			$q="update users set user_last_read_notification='$user_last_read_notification' where user_id='$user_id'";
			mysqli_query($db,$q);
		break;
		case "set_user_last_read_message":
			$user_id=ingest_var_safe("user_id","post");
			$user_last_read_message=ingest_var_safe("user_last_read_message","post");
			$q="update users set user_last_read_message='$user_last_read_message' where user_id='$user_id'";
			mysqli_query($db,$q);
		break;
		case "get_num_unread_messages":
			$user_id=ingest_var_safe("user_id","post");
			$user_last_read_message=ingest_var_safe("user_last_read_message","post");
			$q="select count(swatch_id) as count from swatches where swatch_audience=$user_id AND swatch_id>$user_last_read_message";
			$result=mysqli_query($db,$q);
			while ($row=mysqli_fetch_assoc($result)){
				$count=$row['count'];
			}
			echo $count;
			mysqli_free_result($result);
		break;
		case "save_pal":
			$user_id=ingest_var_safe("user_id","post");
			$pal_user_you=ingest_var_safe("pal_user_you","post");
			$pal_on_off=ingest_var_safe("pal_on_off","post");
			if ($pal_on_off==0){
				$q="delete from pals where pal_user_me='$user_id' AND pal_user_you='$pal_user_you'";
			} else {
				$q="insert into pals (pal_user_me, pal_user_you) VALUES ($user_id,$pal_user_you)";
			}
			mysqli_query($db,$q);
		break;
		case "save_favorite":
			$user_id=ingest_var_safe("user_id","post"); // favoritor
			$fav_swatch_id=ingest_var_safe("fav_swatch_id","post"); 
			$fav_swatch_user_id=ingest_var_safe("fav_swatch_user_id","post"); // swatch author
			$fav_swatch_user_name=ingest_var_safe("fav_swatch_user_name","post"); // swatch author
			$fav_on_off=ingest_var_safe("fav_on_off","post");
			$swatch_color=ingest_var_safe("swatch_color","post");
			if ($fav_on_off=="true"){
				$q="INSERT INTO favorites (fav_user_id, fav_swatch_id, fav_swatch_user_id, fav_date) VALUES  ($user_id, $fav_swatch_id, $fav_swatch_user_id, NOW())";
				mysqli_query($db,$q);

				$q="update swatches set swatch_num_faves=swatch_num_faves+1 where swatch_id='$fav_swatch_id'";
				mysqli_query($db,$q);

				$q="update users set user_stats_favs=user_stats_favs+1 where user_id='$fav_swatch_user_id'";
				mysqli_query($db,$q);
				save_notification($fav_swatch_user_id,"$fav_swatch_user_name favrorited your swatch ___BEGINCOLOR___".$swatch_color."___ENDCOLOR___.");
			} else {
				$q="update swatches set swatch_num_faves=swatch_num_faves-1 where swatch_id='$fav_swatch_id'";
				mysqli_query($db,$q);

				$q="DELETE FROM favorites where fav_user_id='$user_id' AND fav_swatch_id='$fav_swatch_id'"; 
				mysqli_query($db,$q);
				$q="update users set user_stats_favs=user_stats_favs-1 where user_id='$fav_swatch_user_id'";
				mysqli_query($db,$q);
			}
		break;
		case "post_swatch":
			$user_id=ingest_var_safe("user_id","post");
			$color=ingest_var_safe("color","post");
			$user_name=ingest_var_safe("user_name","post");
			$audience=ingest_var_safe("audience","post");
			$q="INSERT INTO swatches (swatch_user,swatch_color,swatch_audience,swatch_date) VALUES ($user_id,'$color',$audience,now())";
			mysqli_query($db,$q);

			$avg_color_sql=" user_stats_avg_color=conv( ( conv(user_stats_avg_color,16,10) + (conv('$color',16,10)/user_stats_swatches) ) ,10,16) ";			
			if ($audience==0){
				// update user stats
				// avg color #swatches
				$q="update users set user_stats_swatches=user_stats_swatches+1, $avg_color_sql where user_id='$user_id'";
				mysqli_query($db,$q);
			} else {
				// post is message
				// update user stats
				// user_stats_msgs
				$q="update users set user_stats_msgs=user_stats_msgs+1, $avg_color_sql where user_id='$audience";
				mysqli_query($db,$q);

				save_notification($audience,"$user_name sent you a message.");
			}
		break;
		case "save_user_setting":
			$setting_name=ingest_var_safe("this_setting_name","post");
			$setting_val=ingest_var_safe("this_setting_val","post");
			$user_id=ingest_var_safe("user_id","post");
			$q="update users set $setting_name='$setting_val' where user_id='$user_id'";
			mysqli_query($db,$q);
			echo mysqli_error($db);
		break;
		case "admin_delete_news":
			$news_id=ingest_var_safe("news_id","post")*1;
			if ($news_id>1){
				$q="DELETE from news where news_id='$news_id'";
				mysqli_query($db,$q);
				echo mysqli_error($db);
			}
		break;
		case "admin_save_news_all_languages_test":
			include('translate.php');
			$q="";
			$news_id=ingest_var_safe("news_id","post");
			$news_headline=$_POST['news_headline'];
			$news_excerpt=$_POST['news_excerpt'];
			$news_content=$_POST['news_content'];
				$news_headline_ita=translate_me("it",$news_headline);
				$news_excerpt_ita=translate_me("it",$news_excerpt);
				$news_content_ita=translate_me("it",$news_content);
				$q.="news_headline_ita='$news_headline_ita', news_excerpt_ita='$news_excerpt_ita', news_content_ita='$news_content_ita',";
			echo $q;
		break;
		case "admin_save_news_all_languages":
			include('translate.php');
			$news_id=ingest_var_safe("news_id","post");
			$news_headline=$_POST['news_headline'];
			$news_excerpt=$_POST['news_excerpt'];
			$news_content=$_POST['news_content'];

			if ($news_id>=1){
				$q ="UPDATE news set news_date=NOW(), ";
				//news_headline_eng_us='$news_headline', news_excerpt_eng_us='$news_excerpt', news_content_eng_us='$news_content', ";
				//mysqli_real_escape_string($db,"kjhgkjhg");
			// eng_uk
				$news_headline_eng_uk=translate_me("en-gb",$news_headline);
				$news_excerpt_eng_uk=translate_me("en-gb",$news_excerpt);
				$news_content_eng_uk=translate_me("en-gb",$news_content);
				$q.="news_headline_eng_uk='$news_headline_eng_uk', news_excerpt_eng_uk='$news_excerpt_eng_uk', news_content_eng_uk='$news_content_eng_uk',";

			//ita
				$news_headline_ita=translate_me("it",$news_headline);
				$news_excerpt_ita=translate_me("it",$news_excerpt);
				$news_content_ita=translate_me("it",$news_content);
				$q.="news_headline_ita='$news_headline_ita', news_excerpt_ita='$news_excerpt_ita', news_content_ita='$news_content_ita',";
			
			//ger
				$news_headline_ger=translate_me("de",$news_headline);
				$news_excerpt_ger=translate_me("de",$news_excerpt);
				$news_content_ger=translate_me("de",$news_content);
				$q.="news_headline_ger='$news_headline_ger', news_excerpt_ger='$news_excerpt_ger', news_content_ger='$news_content_ger',";

			//fre
				$news_headline_fre=translate_me("fr",$news_headline);
				$news_excerpt_fre=translate_me("fr",$news_excerpt);
				$news_content_fre=translate_me("fr",$news_content);
				$q.="news_headline_fre='$news_headline_fre', news_excerpt_fre='$news_excerpt_fre', news_content_fre='$news_content_fre',";

			//esp
				$news_headline_esp=translate_me("es",$news_headline);
				$news_excerpt_esp=translate_me("es",$news_excerpt);
				$news_content_esp=translate_me("es",$news_content);
				$q.="news_headline_esp='$news_headline_esp', news_excerpt_esp='$news_excerpt_esp', news_content_esp='$news_content_esp',";

			//rus
				$news_headline_rus=translate_me("ru",$news_headline);
				$news_excerpt_rus=translate_me("ru",$news_excerpt);
				$news_content_rus=translate_me("ru",$news_content);
				$q.="news_headline_rus='$news_headline_rus', news_excerpt_rus='$news_excerpt_rus', news_content_rus='$news_content_rus',";

			//chi
				$news_headline_chi=translate_me("zh-cn",$news_headline);
				$news_excerpt_chi=translate_me("zh-cn",$news_excerpt);
				$news_content_chi=translate_me("zh-cn",$news_content);
				$q.="news_headline_chi='$news_headline_chi', news_excerpt_chi='$news_excerpt_chi', news_content_chi='$news_content_chi',";


			// vrb
				$news_headline_vrb=addslashes(encode_vrb($news_headline));
				$news_excerpt_vrb=addslashes(encode_vrb($news_excerpt));
				$news_content_vrb=addslashes(encode_vrb($news_content));
				$q.="news_headline_vrb='$news_headline_vrb', news_excerpt_vrb='$news_excerpt_vrb', news_content_vrb='$news_content_vrb' ";
				$q.="where news_id='$news_id'";
				echo $q;
				mysqli_query($db,$q);
				echo mysqli_error($db);
			}
		break;
		case "send_password_reset_link":
			$user_email=ingest_var_safe("user_email","post");
			$q="select * from users where user_email like '$user_email'";
			$result=mysqli_query($db,$q);
			if ($row=mysqli_fetch_assoc($result)){
				$user_id=$row['user_id'];
				$token=encode_reset_token($user_id);
				$to=$user_email;
				$subject="Swatchity Password Reset";
				$url="http://www.swatchity.com/reset_password.php?reset_token=$token&reset=".urlencode($user_email);
				$body="You have requested that your Swatchity password be reset. Please click go to the URL below to reset your password: $url";
				$headers = 'From: Swatchity <noreply@swatchity.com>' . PHP_EOL .
						'Reply-To: Swatchity <noreply@swatchity.com>' . PHP_EOL .
						'X-Mailer: PHP/' . phpversion();
	
				if (mail($to,$suvbject,$body,$headers)){
					echo "ok";
				} else {
					echo "error";
				}

			} else {
				echo "error email not found";
				
			}
			mysqli_free_result($result);

		break;
		case "admin_save_news":
			$news_id=ingest_var_safe("news_id","post");
			$news_headline=ingest_var_safe("news_headline","post");
			$news_excerpt=ingest_var_safe("news_excerpt","post");
			$news_content=ingest_var_safe("news_content","post");
			if ($news_id<1){
				$q="INSERT into news (news_date,news_headline_eng_us,news_excerpt_eng_us,news_content_eng_us) VALUES ( NOW(),'$news_headline','$news_excerpt','$news_content')";
			} else {
				$q="UPDATE news set news_date=NOW(), news_headline_eng_us='$news_headline', news_excerpt_eng_us='$news_excerpt', news_content_eng_us='$news_content' where news_id='$news_id'";
			}
			mysqli_query($db,$q);
			echo mysqli_error($db);
		case "get_top_swatchers":
			$q="SELECT *, (user_stats_swatches+user_stats_favs*10+user_stats_msgs*5) as score from users order by score desc limit 0,5";
			$result=mysqli_query($db,$q);
			while ($row=mysqli_fetch_assoc($result)){
				echo json_encode($row);
				echo "\n";
			}
			mysqli_free_result($result);
		break;
		case "get_news_detail":
			$language=ingest_var_safe("language","post");
			$news_id=ingest_var_safe("news_id","post");
			$q="SELECT news_id, news_date, news_excerpt_".$language." as news_excerpt, news_headline_".$language." as news_headline, news_content_".$language." as news_content from news where news_id='$news_id'";
			$result=mysqli_query($db,$q);
			if ($row=mysqli_fetch_assoc($result)){
				echo json_encode($row);
				echo "\n";
			}
			mysqli_free_result($result);
		break;
		case "get_news_feed":
			$language=ingest_var_safe("language","post");
			$q="SELECT news_id, news_date, news_excerpt_".$language." as news_excerpt, news_headline_".$language." as news_headline, news_content_".$language." as news_content from news order by news_id desc";
			$result=mysqli_query($db,$q);
			while ($row=mysqli_fetch_assoc($result)){
				echo json_encode($row);
				echo "\n";
			}
			mysqli_free_result($result);
		break;
		case "admin_get_news_feed":
			$language=ingest_var_safe("language","post");
			$q="SELECT news_id, news_date, news_excerpt_".$language." as news_excerpt, news_headline_".$language." as news_headline, news_content_".$language." as news_content from news order by news_id desc";
			$result=mysqli_query($db,$q);
			while ($row=mysqli_fetch_assoc($result)){
				echo json_encode($row);
				echo "\n";
			}
			mysqli_free_result($result);
		break;
		case "get_trends":
				$user_id=ingest_var_safe("user_id","post");
				$q="select * from swatches ";
				$q.="left join favorites on fav_swatch_id=swatch_id AND fav_user_id=$user_id left join users on swatch_user=user_id ";
				$q.="where 1 AND swatch_audience=0 order by swatch_num_faves desc, swatch_date desc limit 0,5";
			//$q="SELECT * from swatches, users where user_id=swatch_user order by swatch_num_faves desc, swatch_date desc limit 0,5";

			$result=mysqli_query($db,$q);
			while ($row=mysqli_fetch_assoc($result)){
				echo json_encode($row);
				echo "\n";
			}
			mysqli_free_result($result);
		break;
		case "get_feed":
			$user_id=ingest_var_safe("user_id","post");
			$last_swatch_id=ingest_var_safe("sw_last_swatch_id","post");
			$feed_mode=ingest_var_safe("feed_mode","get");
			$srch=ingest_var_safe("srch","get");
			$page=ingest_var_safe("page","post")*1; //"more" clicked
			$num_per_page=ingest_var_safe("num_per_page","post")*1; 
			$start=$page*$num_per_page;
			$the_feed_type=ingest_var_safe("the_feed_type","post");
			$pals_only=ingest_var_safe("pals_only","post");

			if ($the_feed_type=="top"){$tmp_top_sql=" and swatch_id>$last_swatch_id ";}else{$tmp_top_sql="";}
	
			// if last_swatch_id = 0 then fresh load
			$fav_sql="left join favorites on fav_swatch_id=swatch_id AND fav_user_id=$user_id left join users on swatch_user=user_id";
			//	select * from swatches left join favorites on fav_swatch_id=swatch_id AND fav_user_id=1 left join users on swatch_user=user_id WHERE swatch_audience=0  order by swatch_id desc limit 0, 50
			if ($feed_mode=="user_search"){
				$q="select * from swatches ";
				$q.="left join favorites on fav_swatch_id=swatch_id AND fav_user_id=$user_id left join users on swatch_user=user_id ";
				$q.="left join pals on pal_user_me='$user_id' AND pal_user_you=user_id ";
				$q.="where 1 $tmp_top_sql AND swatch_user='$srch' order by swatch_id desc";
			} else if ($feed_mode=="messages"){
				$q="select * from swatches ";
				$q.="left join favorites on fav_swatch_id=swatch_id AND fav_user_id=$user_id left join users on swatch_user=user_id ";
				$q.="where 1 $tmp_top_sql AND swatch_audience='$user_id' order by swatch_id desc";
			} else if ($feed_mode=="color_search"){
				//$color_dec=hexdec($srch);
				$match_score_thresh=75;
				$q ="Select *, abs(conv('$srch',16,10)-(conv(swatch_color,16,10))) as match_score from swatches ";
				$q.="left join favorites on fav_swatch_id=swatch_id AND fav_user_id=$user_id left join users on swatch_user=user_id ";
				$q.="where 1 $tmp_top_sql AND (";
				$q.="(abs(conv(substring('$srch',1,2),16,10)-(conv(substring(swatch_color,1,2),16,10)))<$match_score_thresh ) ";
				$q.="AND  (abs(conv(substring('$srch',3,2),16,10)-(conv(substring(swatch_color,3,2),16,10)))<$match_score_thresh ) ";
				$q.="AND  (abs(conv(substring('$srch',5,2),16,10)-(conv(substring(swatch_color,5,2),16,10)))<$match_score_thresh ) ";
				$q.=") order by match_score asc, swatch_date desc";
			} else if ($feed_mode=="notifications"){
				$q="select * from notifications where notification_user=$user_id order by notification_id desc";
			} else {

				$q="select * from swatches ";
				$q.="left join favorites on fav_swatch_id=swatch_id AND fav_user_id=$user_id left join users on swatch_user=user_id ";
				if ($pals_only*1==1){
					$q.=" right join pals on pal_user_me='$user_id' ";
					//$q.=" WHERE swatch_color like 'ffffff' ";
				} else {
					$q.="where 1 ";
				}
				$q.="AND swatch_audience=0 $tmp_top_sql order by swatch_id desc";
			}
			$q.=" limit $start, $num_per_page";


			$result=mysqli_query($db,$q);
			while ($row=mysqli_fetch_assoc($result)){
				echo json_encode($row);
				echo "\n";
			}
			mysqli_free_result($result);
			break;
		case "crypt":
			$str=ingest_var_safe("str","get");
			echo cryptStr($str);
			break;
		case "register":
			$user_name=ingest_var_safe("user_name","post");
			$user_email=ingest_var_safe("user_email","post");
			$user_password=cryptStr(ingest_var_safe("user_password","post"));
			// first check for dupes
			$q="select * from users where user_name like '$user_name'";
			$result=mysqli_query($db,$q);
			if ($row=mysqli_fetch_assoc($result)){
				echo "Error: The user name you selected has been taken. Please select another.";
				break;
			}
			mysqli_free_result($result);
			$q="select * from users where user_email like '$user_email'";
			$result=mysqli_query($db,$q);
			if ($row=mysqli_fetch_assoc($result)){
				echo "Error: The email you selected has already been used. Please try again.";
				break;
			}
			mysqli_free_result($result);
			$q="INSERT INTO users (user_name,user_email,user_password,user_date_joined) VALUES ('$user_name', '$user_email', '$user_password', now())";
			mysqli_query($db,$q);
			$q="select * from users where user_name like '$user_name' AND user_email like '$user_email'";
			$result=mysqli_query($db,$q);
			if ($row=mysqli_fetch_assoc($result)){
        $_SESSION['user_name'] = $user_name;
        $_SESSION['user_password'] = $user_password;
				echo json_encode($row);
			}
			mysqli_free_result($result);
			break;
		case "get_user_stats":
			$user_id=ingest_var_safe("user_id","post");
			$q="select * from users where user_id=$user_id";
			$result=mysqli_query($db,$q);
			if ($row=mysqli_fetch_assoc($result)){
				echo json_encode($row);
			} else {
				echo "ERROR";
			}
			mysqli_free_result($result);
		break;
		case "login_session":
			if ( ($mode=="login_session") && (isset($_SESSION['user_name'])) ){
				$user_name=$_SESSION['user_name'];
				$user_password=$_SESSION['user_password'];
			}
		case "login":
			if (!isset($user_name)){
				$user_name=ingest_var_safe("user_name","post");
				$user_password=cryptStr(ingest_var_safe("user_password","post"));
			}
			$q="select * from users where user_name like '$user_name' AND user_password like '$user_password'";
			$result=mysqli_query($db,$q);
			if ($row=mysqli_fetch_assoc($result)){
        $_SESSION['user_name'] = $user_name;
        $_SESSION['user_password'] = $user_password;
        $_SESSION['user_level'] = $row['user_level'];
				echo json_encode($row);
			}
			mysqli_free_result($result);
			break;
		case "logout":
      $_SESSION['user_name'] = '';
      $_SESSION['user_password'] = '';
      $_SESSION['user_level'] = -1;
			break;
	}

	mysqli_close($db);
?>