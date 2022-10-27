<!DOCTYPE html>
<?php if (isset($_SESSION['user_level'])){$user_level=$_SESSION['user_level']*1;} else { $user_level=-1;}?>
<html lang="en-US" prefix="og: http://ogp.me/ns#">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta property="og:title" content="Swatchity - Live a more colorful life!" />
	<meta property="og:site_name" content="Swatchity"/>
	<meta property="og:url" content="http://www.swatchity.com" />
	<meta property="og:description" content="Who has time to read 140 characters? Swatchity makes it easy! Just pick a color and go! Catch up with friends, build your brand, code your app, and share your precious family photos! Swatchity: live a more colorful life!" />
	<meta property="og:image" content="http://www.swatchity.com/images/levels/swatchity_512_level_-1.jpg" />
	<title>Swatchity</title>
	<script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/jquery-ui-1.11.4/jquery-ui.js"></script>
	<script src="/swatchity.js"></script>
	<link rel="icon" type="image/png" href="favicon.ico">
	<link rel="apple-touch-icon" sizes="114x114" href="swatchity_114.png" />
	<link href='http://fonts.googleapis.com/css?family=Quicksand:400,700' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Belgrano' rel='stylesheet' type='text/css'>
	<link rel='stylesheet' href='/swatchity.css' type='text/css' media='all' />
	<script>
	var jump_to_login=false;
	<?php 
		if (isset($_GET['login'])){
			echo "jump_to_login=true;\n";
		}
	?>
	</script>
</head>
<body>
	<div id="page">
		<div id="ui_panel_public" class="ui_panel">
			<div id="ui_public_main">
				<div id="public_login_block">
						<a href="#" onclick="ui_transition_to('ui_panel_login_register'); return false;">Login / Register</a>
				</div>
				<div id="public_logo">
					<img src="images/public_logo.png" alt="Swatchity Logo" class="img_center_full" width="566" height="152">
				</div>
				
				<div class="public_windowbox" id="public_box_01">
					<img id="public_box_01_img" class="public_windowbox_img" src="images/public_01_img.jpg" alt="Butterfly">
					<div class="public_windowbox_shadow_upper"></div>
					<div class="public_windowbox_shadow_lower"></div>
					<img id="public_box_01_text" src="images/public_01_text.png" alt="Express yourself">
				</div>
				
				<div class="public_text_box">
					<p>
						Ever get the feeling that your tired old social network is slowing ... you ... down?  140 characters? Who has time to read all that?
					</p>
					<p>
						Swatchity makes it simple. Just pick a color and go. Super quick to post and lightning fast to read. Our guiding design principle was to land somewhere on the border of "simple" and "simplistic." We did it! And so can you. All the functions are there. Post, search, direct message, and even track trends on Swatchity. Get ready to live a more colorful life.
					</p>


					<div class="public_info_left">
						<img src="images/public_info_01.jpg" alt="Catch Up">
						<span>
							Catch up with friends<sup>1</sup> on Swatchity.
						</span>
					</div>


					<div class="public_info_right">
						<span>
							Store and share your precious family photos with Swatchity.
						</span>
						<img src="images/public_info_02.jpg" alt="Photos">
					</div>
	
	
					<div class="public_info_left">
						<img src="images/public_info_03.jpg" alt="Brand">
						<span>
							Build your brand<sup>2</sup> on Swatchity.
						</span>
					</div>


					<div class="public_info_right">
						<span>
							Build your apps<sup>3</sup> on top of Swatchity's full-featured gen-6 API.
						</span>
						<img src="images/public_info_04.jpg" alt="Apps">
					</div>
	
	
					<div class="public_info_left">
						<img src="images/public_info_05.jpg" alt="Validation">
						<span>
							Most of all, feel the tingle of parasocial<sup>4</sup> validation!
						</span>
					</div>

				</div>

				<div class="public_windowbox" id="public_box_02">
					<img id="public_box_02_img" class="public_windowbox_img" src="images/public_02_img.jpg" alt="Meow">
					<div class="public_windowbox_shadow_upper"></div>
					<div class="public_windowbox_shadow_lower"></div>
					<img id="public_box_02_text" src="images/public_02_text.png" alt="I'm Swatching To">
				</div>
				
				<div class="public_text_box">
					<p>
						What are you waiting for? Whether you’re a new user, advertiser, app developer or investor, Swatchity is here to transform your life.  The time has come to live a more colorful life.
					</p>
					<p>&nbsp;</p>

						<a href="#" onclick="ui_transition_to('ui_panel_login_register'); return false;"><img src="images/public_btn_get_started.jpg" class="img_center_full" alt="get started"></a>

					<p>&nbsp;</p>

					<p>
						<sup>1</sup> Swatchity is neither a law firm (except in Florida), a religious group, nor a diet plan (except in Florida)
					</p>
					<p>
						<sup>3</sup> No longer seeking series 1 venture capital funding
					</p>
					<p>
						<sup>3</sup> First an only social platform to fully integrate J19 Variant B
					</p>
					<p>
						<sup>4</sup> Swatchity is not a cult.
					</p>
				</div>
								
			</div>
		</div>


		<div id="ui_panel_login_register" class="ui_panel">
			<div class="casual_header">
				<img src="images/swtchity_logo_100.png" alt="logo" style="margin-top:20px;">
			</div>

			<div class="ui_panel_interior">
				<div class="ui_sub_panel" id="login_subpanel">
					<h1>Log In</h1>
					<form action="swatchity_lookup.php?mode=login" id="swatchity_login_form" method="POST" onsubmit="swatchity_login(); return false;">
						<div>
							<input type="text" name="user_name" id="user_name" placeholder="User Name">
						</div>
						<div>
							<input type="password" name="user_password" id="user_password" placeholder="Password">
						</div>
						<input type="submit" value="Log In">
						<a href="#" class="wide_text_button" onclick="ui_transition_to('ui_panel_public'); return false;">Cancel</a>
						<div class="form_alert_box"></div>
					</form>
					<a href="#" onclick="jQuery('#ui_login_forgot1').show();return false;">Forgot your password?</a>
				</div>
				<div id="ui_login_forgot1" style="display:none;">
						<div class="v_spacer_50" id="register_v_spacer"></div>
						<form action="swatchity_lookup.php?mode=forgot" id="swatchity_forgot_form" method="POST" onsubmit="send_password_reset_link(); return false;">
							<div>
								<input type="text" name="password_reset_email" id="password_reset_email" placeholder="User Email">
							</div>
							<input type="submit" value="Send Reset Link">
							<a href="#" class="wide_text_button" onclick="ui_transition_to('ui_panel_public'); return false;">Cancel</a>
							<div class="form_alert_box"></div>
						</form>
				</div>
				<div class="v_spacer_50" id="register_v_spacer"></div>

				<div class="ui_sub_panel" id="swatchity_reg_sub_panel">
					<h1>Register</h1>
					<form action="swatchity_lookup.php?mode=register" id="swatchity_reg_form" method="POST" onsubmit="swatchity_register(this); return false;">
						<div>
							<input type="text" name="user_name" id="reg_user_name" class="is_required input_no_spaces input_limit_30" placeholder="User Name">
						</div>
						<div>
							<input type="text" name="user_email" id="reg_user_email" class="is_required is_email input_no_spaces" placeholder="Email">
						</div>
						<div>
							<input type="password" name="user_password" id="reg_user_password" class="is_required password_original" placeholder="Password">
						</div>
						<div>
							<input type="password" name="user_password2" id="reg_user_password2" class="password_confirm" placeholder="Confirm Password">
						</div>
						<div>
							<input type="checkbox" name="register_i_agree" class="is_required is_tos" id="register_i_agree" value="1" onclick="jQuery('#terms-of-service-text').toggle(250);"><div class="checkbox_label">Agree to terms of service</div>
						</div>
						<div class="form_alert_box clear_floats"></div>
						<div id="terms-of-service-text" class="dingy_text" style="display:none;">
							<?php 
								$tmp=file_get_contents("terms-of-service.txt"); 
								$tmp=str_replace("\r","\n",$tmp);$tmp=str_replace("\n","<br />",$tmp);
								echo $tmp;
							?>
						</div>
						<input type="submit" value="Register">
						<a href="#" class="wide_text_button" onclick="ui_transition_to('ui_panel_public'); return false;">Cancel</a>
					</form>
				</div>

			</div>
			
		</div>

		<div id="ui_panel_home" class="ui_panel" >
			<div class="ui_home_bar">
				<div class="ui_panel_interior">
					<a href="#" onclick="ui_transition_to('ui_panel_home');hide_menu();return false;"><div id="ui_header_logo"></div></a>
					
					<a href="#" id="btn_home" class="img-btn has-icon icon-wht has-highlight icon-home" onclick="ui_transition_to('ui_panel_home');hide_menu();return false;"><span>Home</span><div class="btn_nav_disp_active_page"></div></a>

					<a href="#" id="btn_messages" class="img-btn has-icon has_ui_disc_badge icon-wht has-highlight icon-messages" onclick="read_messages();hide_menu();return false;"><span>Messages</span><div class="ui_disc_badge" id="ui_messages_badge"></div><div class="btn_nav_disp_active_page"></div></a>

					<a href="#" id="btn_notifications" class="img-btn has-icon has_ui_disc_badge icon-wht has-highlight icon-notifications" onclick="show_notifications();hide_menu();return false;"><span>Notifications</span><div class="ui_disc_badge" id="ui_notifications_badge"></div><div class="btn_nav_disp_active_page"></div></a>

					<a href="#" id="btn_search" class="img-btn has-icon icon-wht has-highlight icon-search" onclick="init_search();return false;"><span>Search</span><div class="btn_nav_disp_active_page"></div></a>

					<a href="#" id="btn_swatch" class="img-btn has-icon icon-wht has-highlight icon-write" onclick="write_new_swatch();return false;"><span>New Swatch</span><div class="btn_nav_disp_active_page"></div></a>

					<a href="#" class="img-btn has-icon icon-wht has-highlight icon-menu" onclick="jQuery('#ui_sub_menu').toggle();jQuery(this).toggleClass('btn_active');return false;"><span>Menu</span></a>
				</div>
			</div>

			<div class="ui_panel_interior">
				<div id="ui_sub_menu">
					<ul>
						<li><a href="#" onclick="edit_user_profile();return false;">edit profile</a>
						<li><a href="#" onclick="edit_user_settings();return false;">user settings</a>
						<li><a href="#" onclick="return false;">contact</a>
						<li><a href="#" onclick="return false;">join the swatchity team</a>
						<li><a href="#" onclick="swatchity_logout(); return false;">log out</a>
					</ul>
				</div>

				<div id="ui_sidebar_collapser" class="mobile_only" onclick="jQuery('#ui_sidebar').toggle();jQuery(this).toggleClass('collapser_expanded');return false;">
				</div>
				<div id="ui_sidebar">
					<div id="ui_profile_block">
						<div id="ui_profile_upper" >
							<div class="half_col left_col">
								<div id="ui_header_profile_badge_container">
									<div id="ui_header_profile_badge" class="user_profile_badge" onclick="edit_user_profile();" style="cursor: pointer;"></div>
								</div>
							</div>
							<div class="half_col right_col">
								<div class="inner_padded">
									<div class="ui_profile_stat">
										<h3>Swatches</h3>
										<h2 id="disp_user_stats_swatches">234</h2>
									</div>
	
									<div class="ui_profile_stat">
										<h3 class="localized_text" id="profile_stat_attention_text">Attention</h3>
										<h2 id="disp_user_stats_attention">124%</h2>
									</div>
	
									<div class="ui_profile_stat">
										<h3>Fälhzeneus</h3>
										<h2 id="disp_user_stats_meta">12.57</h2>
									</div>

									<div class="ui_profile_stat">
										<h3 class="localized_text" id="profile_stat_points_to_go_text">Level Up</h3>
										<h2 id="disp_user_pts_to_next_level">0</h2>
									</div>
								</div>
							</div>
							<div class="clear_floats"></div>
						</div>
						<div id="ui_profile_lower">
							<div class="inner_padded" id="user_name_display">
							</div>
						</div>
					</div>

					<div id="ui_leaderboard_block">
						<div id="ui_leaderboard_block_header">
							<h2 class="localized_text" id="txt_the_exalted">The Exalted</h2>
						</div>
						<div id="ui_leaderboard_block_main">
							<div class="padded_10">
								<h2 class="centered_text localized_text" id="txt_top_swatchers">Top Swatchers</h2>
									<ol style="margin-bottom:0;" id="sidebar_top_swatchers">
										<li><div ></div> <b>UserName</b> (125400)
										<li><div ></div> AnotherUser (125400)
										<li><div ></div> ThirdUser (125400)
										<li><div ></div> NoSpacesInNames (125400)
										<li><div ></div> YetAnotherUser (125400)
									</ol>
								<a href="#" onclick="return false;" class="bold_link" >See More</a>
								<hr />
								<h2 class="centered_text localized_text" id="txt_trending">Trending</h2>
								<div id="sidebar_trending">
								</div>
								<a href="#" onclick="return false;" class="bold_link" >See More</a>
								<br />
							</div>
						</div>
					</div>
					
					<div id="ui_ad_block">
						<div id="ui_ad_block_header">
							<!--
								<a href=""><img src="images/ad_dummy.jpg" alt="Advertising"></a>
							-->
						</div>
					</div>
					
				
					<div id="ui_news_block">
						<div id="ui_news_block_header">
							<h2 class="localized_text" id="swatchity_news_header">Swatchity News</h2>
						</div>
						<div id="ui_news_block_main">
							<div class="padded_10" id="ui_news_content">
							</div>
						</div>
					</div>
					<div class="clear_floats"></div>
				</div>

				<div id="ui_feed_block">
					<div id="ui_feed_block_header">
						<div class="inner_padded feed_header_inner" id="feed_header_home">
							<div id="feed_header_profile_badge_container">
								<div id="feed_header_profile_badge" class="user_profile_badge"></div>
							</div>

							
							<div id="feed_header_input_container">
								<input type="text" class="localized_text" id="feed_header_text_input" placeholder="What's on your mind?" onfocus="jQuery(this).blur();jQuery('#btn_swatch').click();">
							</div>

							<a href="#" class="img-btn has-icon icon-wht has-highlight icon-camera" onclick="jQuery('#swatchy_fileinput').trigger('click');return false;"><span>Camera</span></a>
							<a href="#" id="feed_header_pals_only" class="icon-pals" onclick="jQuery(this).toggleClass('icon-pals_active'); reset_feed(); refresh_timeline('top'); return false;"><span>Pals Only</span></a>
							<div class="hiddenfile">
							  <input name="upload" type="file" id="swatchy_fileinput" onchange="prepare_upload();"/>
							</div>
							
							
							<div class="clear_floats"></div>	

						</div>

						<div class="inner_padded feed_header_inner" id="feed_header_messages">
							<h1 class="localized_text" id="message_feed_header">Messages</h1>
							<div class="clear_floats"></div>	

						</div>

						<div class="inner_padded feed_header_inner" id="feed_header_notifications">
							<h1 class="localized_text" id="notifications_feed_header">Notifications</h1>
							<div class="clear_floats"></div>	

						</div>


						<div class="inner_padded feed_header_inner" id="feed_header_user_search">
							<div id="feed_header_search_user_profile_badge_container">
								<div id="feed_header_search_user_profile_badge" class="user_profile_badge"></div>
							</div>
							<div id="feed_header_search_user_disp_name_container">
								<div id="feed_header_search_user_disp_name">
								</div>
								<div style="text-align:center">
									Swatches: <span id="disp_user_srch_stats_swatches">234</span> &nbsp; - &nbsp; <span class="localized_text" id="user_search_attention">Attention</span>: <span id="disp_user_srch_stats_attention">124%</span> &nbsp; - &nbsp; Fälhzeneus: <span id="disp_user_srch_stats_meta">12.57</span>
								</div>
							</div>

							<div class="clear_floats"></div>	

						</div>
						<div class="inner_padded feed_header_inner" id="feed_header_color_search">
							<div class="color_search_label_left localized_text" id="color_search_txt_label">Search color:</div>
							<div id="feed_header_color_search_input_container">
								<input type="text" id="feed_header_color_search_text_input" class="localized_text" placeholder="my search color..." onfocus="jQuery(this).blur();jQuery('#btn_search').click();">
							</div>
							
							<div class="clear_floats"></div>	

						</div>
						

					</div>
					<div id="ui_feed_block_main">
						<div class="inner_padded">
							<div id="ui_feed">
								<div style="display:block;text-align:center">
									<img src="images/swatchity_activity.gif">
								</div>
							</div>
						</div>
					</div>
					<div class="clear_floats"></div>

				</div>
				<div class="clear_floats"></div>
			</div>
			<div id="home_footer">
				&copy;2015 Swatchity.com <?php 
						$last_filedate=filemtime("swatchity.js");
						$time=filemtime("swatchity_lookup.php");
						if ($time>$last_filedate){$last_filedate=$time;}
						$time=filemtime("index.php");
						if ($time>$last_filedate){$last_filedate=$time;}
						$time=filemtime("swatchity.css");
						if ($time>$last_filedate){$last_filedate=$time;}
						$version=1+(($last_filedate-1435764652)/10000000);
						echo "v".$version;
				?>
			</div>
		</div>
		
		
		<div id="ui_panel_profile_edit" class="ui_panel">
			<div class="ui_panel_interior">
				<div class="ui_form_container">
					<h1>Edit Your Profile</h1>
					<div class="v_spacer_row">
						<div class="profile_swatch" id="profile_swatch_1" onclick="edit_user_profile_swatch(1);"></div>
						<span class="localized_text" id="profile_edit_q1">1: What do you do for a living?</span>
						
					</div>
					
					<div class="v_spacer_row">
						<div class="profile_swatch" id="profile_swatch_2" onclick="edit_user_profile_swatch(2);"></div>
						<span class="localized_text" id="profile_edit_q2">2: What is your quest? </span>
						
					</div>
					<div class="v_spacer_row">
						<div class="profile_swatch" id="profile_swatch_3" onclick="edit_user_profile_swatch(3);"></div>
						<span class="localized_text" id="profile_edit_q3">3: If you were a tree, what sort of tree would you be? </span>
						
					</div>
					<div class="v_spacer_row">
						<div class="profile_swatch" id="profile_swatch_4" onclick="edit_user_profile_swatch(4);"></div>
						<span class="localized_text" id="profile_edit_q4">4: Flipflops- yes or no?</span>
						
					</div>
					<div class="v_spacer_row content_align_right">
						<a href="#" onclick="ui_transition_to('ui_panel_home');return false;" class="ui_text_btn ui_btn_cancel">Cancel</a>
						&nbsp;
						<a href="#" onclick="edit_user_profile_save();return false;" class="ui_text_btn">Save</a>
					</div>
				</div>
			</div>
		</div>

		<div id="ui_panel_settings_edit" class="ui_panel">
			<div class="ui_panel_interior">
				<div class="ui_form_container">
					<h1>edit your settings</h1>
					<label>Language</label><select id="settings_user_language" onchange="set_user_language();return false;">
							<option value="eng_us">English, 'Murican</option>
							<option value="eng_uk">English, Olde Timey</option>
							<option value="esp">Español-ish</option>
							<option value="ger">Falsche Deutsch</option>
							<option value="fre">Franglais</option>
							<option value="ita">Italia-Not-Quite</option>
							<option value="rus">Неумелое России</option>
							<option value="chi">中国不好</option>
							<option value="vrb">J19 Variant B</option>
						</select>
					<label >Timezone</label><select id="settings_user_timezone" onchange="save_user_setting(this);reset_feed();refresh_timeline('bottom');return false;">
							<option value="5">Almaty, Kazakhstan</option>
							<option value="-6">Austin, TX USA</option>
							<option value="1">Blankenberg, Germany</option>
							<option value="0">Cardiff, Wales</option>
							<option value="2">Chernobyl, Ukraine</option>
							<option value="7">Chongqing, China</option>
							<option value="-7">Cimarron, NM USA</option>
							<option value="-525960">Hill Valley, CA USA</option>
							<option value="-5">Indianapolis, IN USA</option>
							<option value="6">Khatanga, Russia</option>
							<option value="99999">Milliways, Magrathea</option>
							<option value="-402960">Moon, The</option>
							<option value="9">Shadaloo City, Shadaloo</option>
							<option value="-8">Stockton, CA USA</option>
							<option value="11">Wellington, New Zealand</option>
							<option value="8">Yakutsk, Russia</option>
							<option value="4">Yekaterinburg, Russia</option>
							<option value="3">Yerevan, Armenia</option>
						</select>
					<div class="content_align_right">
						<a href="#" onclick="ui_transition_to('ui_panel_home');return false;" class="ui_text_btn localized_text" id="btn_text_return">Return</a>
					</div>
				</div>
			</div>
		</div>


		<div id="ui_news_modal" class="ui_panel ui_modal_panel">
			<div class="classy_div" id="ui_news_content_stage">
			</div>
		</div>

		<div id="ui_swatch_modal" class="ui_panel ui_modal_panel">
			<div class="bg_close" onclick="jQuery(this).parent().hide();jQuery('#btn_swatch').removeClass('btn_active');"></div><a href="#" onclick="jQuery(this).parent().hide();jQuery('#btn_swatch').removeClass('btn_active');" class="btn_close"><span>CLOSE</span></a>
			<a href="#" id="swatch_picker_day_night" onclick="swatch_picker_toggle_day_night();return false;"><span>Day or Night</span></a>
			<div class="square_stage" id="ui_swatch_modal_stage">
			</div>
		</div>

		<div id="preload" class="ui_panel">
			<?php
				$dirname = "images/";
				$images = glob($dirname."*.png");
				foreach($images as $image) {
					echo '<img alt="image" src="'.$image.'" /><br />';
				}
				$images = glob($dirname."*.jpg");
				foreach($images as $image) {
					echo '<img alt="image" src="'.$image.'" /><br />';
				}
				if (isset($_GET['admin'])){ ?>
					<script type="text/javascript">
						var news_id=-1;
						var item=[];
						function admin_show_news(){
							var html='';
							html+='<div class="classy_div"><div class="content_align_right"><a href="#" class="ui_text_btn" onclick="admin_news_edit(-1);return false;">New</a></div>';
							my_url='swatchity_lookup.php?mode=admin_get_news_feed';
							$.post(my_url, {
									language:'eng_us'
							}, function(data, textStatus){
								if (data.charAt(0)=="{"){
									data_lines=data.split('\n');
									for(i=0;i<(data_lines.length-1);i++){
										line = jQuery.parseJSON( data_lines[i] );
										html+='<div>' + line['news_headline'] + ' <a href="#" onclick="admin_news_delete('+line['news_id']+');return false;">Delete</a> &nbsp; <a href="#" onclick="admin_news_edit('+line['news_id']+');return false;">Edit</a></div>\n';
									}
									html+='</div>';
									jQuery('#super_modal_alert').html(html);
									jQuery('#super_modal_alert').show();
								}
							});
						}
						function admin_news_delete(id){
							if (confirm('Are you sure you want to delete this item?')){
								my_url='swatchity_lookup.php?mode=admin_delete_news';
								$.post(my_url, {
									news_id:id,
								}, function(data, textStatus){
									admin_show_news();
								});
							
							}
						}
						function admin_save_news(id){
							my_url='swatchity_lookup.php?mode=admin_save_news';
							$.post(my_url, {
								news_id:news_id,
								news_headline:jQuery('#admin_news_headline').val(),
								news_excerpt:jQuery('#admin_news_excerpt').val(),
								news_content:jQuery('#admin_news_content').val(),
							}, function(data, textStatus){
							});
							admin_show_news();
						}
						function admin_save_news_all_languages(id){
							my_url='swatchity_lookup.php?mode=admin_save_news_all_languages';
							$.post(my_url, {
								news_id:news_id,
								news_headline:jQuery('#admin_news_headline').val(),
								news_excerpt:jQuery('#admin_news_excerpt').val(),
								news_content:jQuery('#admin_news_content').val(),
							}, function(data, textStatus){
console.log(data);
							});
							admin_show_news();
						}
						function admin_news_edit_2(id){
							var html='';
							html+='<form class="classy_form" onsubmit="return false">';
							html+='<input type="text" id="admin_news_headline" value="'+item['news_headline']+'">';
							html+='<input type="text" id="admin_news_excerpt" value="'+item['news_excerpt']+'">';
							html+='<textarea id="admin_news_content">'+item['news_content']+'</textarea>';
							html+='<div class="v_spacer_row content_align_right">';
							html+='<a href="#" onclick="admin_show_news();return false;" class="ui_text_btn ui_btn_cancel">Cancel</a>&nbsp;';
							html+='<a href="#" onclick="admin_save_news_all_languages('+id+');return false;" class="ui_text_btn">Save Lingos</a>&nbsp;';
							html+='<a href="#" onclick="admin_save_news('+id+');return false;" class="ui_text_btn">Save</a></div>';
							html+='</form>';


							jQuery('#super_modal_alert').html(html);
							jQuery('#super_modal_alert').show();
						
						}
						function admin_news_edit(id){
							if (id<1){
								item=[];item['news_headline']='';item['news_excerpt']='';item['news_content']='';
								admin_news_edit_2(-1);
							} else {
								my_url='swatchity_lookup.php?mode=get_news_detail';
								news_id=id;
								$.post(my_url, {
									news_id:id,
									language:'eng_us'
								}, function(data, textStatus){
									if (data.charAt(0)=="{"){
										item = jQuery.parseJSON( data);
										admin_news_edit_2(id);
									}
								});
							}
						}
						jQuery( document ).ready(function() {
							jQuery(window).delay(1000).fadeIn(0,function(){
								if (user['user_role']>900){
									user['user_language']="eng_us";
									admin_show_news();
								}
							});
						});
					</script>
				<?php }
			
				if (isset($_GET['autopilot'])){ ?>
					<script type="text/javascript">
						function auto_pilot(){
							var t_delay=Math.floor((Math.random() * 60) + 30);
							my_url='swatchity_lookup.php?mode=post_swatch';
							var rnd_user=Math.floor((Math.random() * 4) + 6); // 6-9
							var rnd_color=random_color();
							$.post(my_url, {
								user_id:rnd_user,
								audience:0,
								color:rnd_color
							}, function(data, textStatus){
								jQuery(window).delay(t_delay*1000).fadeIn(0,function(){
									auto_pilot();
								});
							});
						}
						jQuery( document ).ready(function() {
							jQuery(window).delay(1000).fadeIn(0,function(){
								if (user['user_role']>900){
									auto_pilot();
								}
							});
						});
					</script>
				<?php }
			?>
		</div>

	</div>
	
<div id="super_modal_alert">
	
</div>

<div id="main_loading">
	<img alt="level image" src="images/levels/swatchity_512_level_<?php echo $user_level; ?>.jpg">
	<h1>Loading</h1>
</div>


<!--
					<a href="#" onclick="swatchity_logout(); return false;">log out</a>
-->

</body>
</html>