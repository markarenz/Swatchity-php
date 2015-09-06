var user=[];
var current_panel='ui_panel_public';
var new_items=[];
var last_swatch_id=0;
var swatch_picker_mode='';
var window_active=true;
var feed_mode='';
var srch_user='';
var srch_color='';
var lbl_months=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
var results_page=0;
var results_num_per_page=50;
var localized_text_arr=[];
var level_goals=[15,40,75,150,250,400,500,1000,2500,7500,10000];
var swatch_picker_lockout=false;
function isValidEmailAddress(emailAddress) {
	var pattern = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
	return pattern.test(emailAddress);
};

function is_this_dark(hex){
	var rgb = parseInt(hex, 16);   // convert rrggbb to decimal
	var r = (rgb >> 16) & 0xff;  // extract red
	var g = (rgb >>  8) & 0xff;  // extract green
	var b = (rgb >>  0) & 0xff;  // extract blue
	var luma = 0.2126 * r + 0.7152 * g + 0.0722 * b; 
	if (luma<175){
		return(true);
	} else {
		return(false);
	}
}

function swatchity_validate_form_basic(frm){
	var errors='';
	var frm_id=jQuery(frm).attr('id');
	jQuery('#'+frm_id+' .is_required').each(function(){
		var placeholder=jQuery(this).attr('placeholder');
		if (jQuery(this).hasClass('is_tos')){placeholder='Terms of Service';}
		if (jQuery(this).is(':checkbox')){
			if (jQuery(this).is(':checked') !=true){
				errors+=placeholder + ' is required.<br />\n';
			}
		} else {
			if (jQuery(this).val()==''){
				errors+=placeholder + ' is required.<br />\n';
			}
		}
	});
	jQuery('#'+frm_id+' .is_email').each(function(){
		if (jQuery(this).val()!=''){
			if (!isValidEmailAddress(jQuery(this).val())){
				errors+=jQuery(this).attr('placeholder') + ' must be a valid email address.<br />\n';
			}
		}
	});
	
	jQuery('#'+frm_id+' .input_no_spaces').each(function(){
		var placeholder=jQuery(this).attr('placeholder');
		if (jQuery(this).val().match(/\s/g)){
				errors+=jQuery(this).attr('placeholder') + ' must not contain spaces.<br />\n';
		}
	});	
	jQuery('#'+frm_id+' .input_limit_30').each(function(){
		var placeholder=jQuery(this).attr('placeholder');
		if (jQuery(this).val().length>30){
				errors+=jQuery(this).attr('placeholder') + ' must not be more than 30 characters long.<br />\n';
		}
	});	
	 
	jQuery('#'+frm_id+' .password_original').each(function(){
		var original_pass=jQuery('.password_original:first-child').val();
		if (( !(original_pass.match(/([a-zA-Z])/) && original_pass.match(/([0-9])/)) ) || (original_pass.length<8)) {
				errors+='Password should be at least 8 characters with at least one uppercase letter and one numeral.<br />\n';
		}
	});
	jQuery('#'+frm_id+' .password_confirm').each(function(){
		var original_pass=jQuery('.password_original:first-child').val();
		if (jQuery(this).val()!='' || original_pass!=''){
			if (jQuery(this).val()!=original_pass){
				errors+='Passwords must match.<br />\n';
			}
		}
	});
	jQuery(frm).find('.form_alert_box').html(errors);
	if (errors.length>0){
		jQuery('#terms-of-service-text').hide();
		return false;
	}
	return true;
}
function swatchity_register(frm){
	if(swatchity_validate_form_basic(frm)){
		var name=jQuery('#reg_user_name').val();
		var password=jQuery('#reg_user_password').val();
		var email=jQuery('#reg_user_email').val();
		my_url='swatchity_lookup.php?mode=register';
		$.post(my_url, {
			user_name:name,
			user_email:email,
			user_password:password
		}, function(data, textStatus){
			user = jQuery.parseJSON( data );
			jQuery(frm).find('.form_alert_box').html('REGISTER: ' + user['user_email']);
			// automatically log them in
			jQuery('#user_name').val(name);
			jQuery('#user_password').val(email);
			//jQuery( "#swatchity_reg_sub_panel" ).hide();
		    location.reload();
		});
	}
}
function write_new_swatch(){
	swatch_picker_mode='new-swatch';
	hide_menu();
	init_swatch_modal('');
	jQuery('#ui_swatch_modal').show();
	jQuery('#btn_swatch').addClass('btn_active');
}

function set_nav_bar_active_page(slug){
	jQuery('#ui_panel_home .ui_home_bar .img-btn').each(function(){
		if (jQuery(this).attr('id')=='btn_'+slug){
			jQuery(this).find('.btn_nav_disp_active_page').addClass('btn_nav_disp_active_page_is_active');
		} else {
			jQuery(this).find('.btn_nav_disp_active_page').removeClass('btn_nav_disp_active_page_is_active');
			//jQuery('#btn_' + slug).find('.btn_nav_disp_active_page').addClass('btn_nav_disp_active_page_is_active');
		}
	});
}
function show_notifications(){
	set_nav_bar_active_page('notifications');
	hide_menu();
	feed_mode='notifications';
	reset_feed();
	refresh_timeline('top');
	jQuery('#ui_notifications_badge').hide();

}

function init_search(){
	swatch_picker_mode='search';
	set_nav_bar_active_page('search');
	hide_menu();
	init_swatch_modal('');
	jQuery('#ui_swatch_modal').show();
	jQuery('#btn_swatch').addClass('btn_active');
}

function init_settings_panel(){
	jQuery('#settings_user_timezone').val(user['user_timezone']);
	jQuery('#settings_user_language').val(user['user_language']);
	
}
function edit_user_settings(){
	hide_menu();
	ui_transition_to('ui_panel_settings_edit');
	
}

function initiate_message(user_id){
	swatch_picker_mode='message_'+user_id;
	hide_menu();
	init_swatch_modal('');
	jQuery('#ui_swatch_modal').show();
	jQuery('#btn_swatch').addClass('btn_active');
}

function edit_user_profile(){
//	swatch_picker_mode='';
//	init_swatch_modal();
	hide_menu();
	ui_transition_to('ui_panel_profile_edit');
}


function edit_user_profile_swatch(num){
	swatch_picker_mode='profile_' + num;
	hide_menu();
	var tmp=jQuery('#profile_swatch_'+num).css('background-color');
	var init_color;
	if (tmp=='rgba(0, 0, 0, 0)'){
		init_color='bb4444';
	} else {
		init_color=rgb2hex(tmp);
	}
	init_swatch_modal(init_color);
	jQuery('#ui_swatch_modal').show();
	jQuery('#btn_swatch').addClass('btn_active');
}

function get_user_stats_meta(avg_color){
	var user_meta = parseInt("0x" + avg_color)/parseInt("0x" + 'FFFFFF');
	user_meta=Math.floor(user_meta*10000)/1000	
	return(user_meta);
}

function update_leaderboard(){
	my_url='swatchity_lookup.php?mode=get_top_swatchers';
	$.post(my_url, {
	}, function(data, textStatus){
		if (data.charAt(0)=="{"){
			var html='';
			data_lines=data.split('\n');
			for(i=0;i<(data_lines.length-1);i++){
				line = jQuery.parseJSON( data_lines[i] );
				html+='<li class="top_swatcher"><a href="#" onclick="search_user('+line['user_id']+');return false;"><div class="top_swatcher_profile_badge_container"><div class="top_swatcher_profile_badge">'+draw_profile_badge(line['user_profile'])+'</div></div><b>'+line['user_name']+' (L:'+line['user_level']+')</b></a>  - '+line['score']+'\n';
			}
			jQuery('#sidebar_top_swatchers').html(html);
		}
	});
	

	my_url='swatchity_lookup.php?mode=get_trends';
	$.post(my_url, {
		user_id:user['user_id']
	}, function(data, textStatus){
		if (data.charAt(0)=="{"){
			html='';
			data_lines=data.split('\n');
			for(i=0;i<(data_lines.length-1);i++){
				line = jQuery.parseJSON( data_lines[i] );
				
				var tmp_my_class='';
				if ( is_this_dark(line['swatch_color']) ){tmp_my_class+=' is_dark ';}
				html+='<div class="trending_swatch ' + tmp_my_class + '" style="background:#'+line['swatch_color']+';">\n';
				html+='<div class="padded_10">\n';


					// favorite
						this_user_id=line['swatch_user'];
						this_color=line['swatch_color'];
						this_id=line['swatch_id'];
						this_user=line['user_name'];

						fav_html='<a href="#" onclick="';
						if(this_user_id!=user['user_id']){
							fav_html+='toggle_favorite_this_swatch(this,'+this_id+',\''+this_color+'\','+this_user_id+',\''+escape(this_user)+'\');';
						}
						fav_html+='return false;" class="feed_swatch_btn_fav ';

						if (line['fav_swatch_id']==line['swatch_id']){
							fav_html+=' swatch_favorited ';
						}
						
						fav_html+='"><div class="trend_swatch_fav_num_faves ';
							if (line['swatch_num_faves']>0){
								fav_html+=' feed_swatch_fav_num_faves_active">';
								fav_html+=line['swatch_num_faves'];
							} else { fav_html+='">';}
						fav_html+='</div></a>';
						html+=fav_html;


				html+='<div class="trending_swatch_score">'+line['swatch_num_faves']+'</div>\n';
				html+='<div class="trending_swatch_user_name"><a href="#" onclick="search_user('+line['user_id']+');return false;">'+line['user_name']+' (L:'+line['user_level']+')</a></div>\n';
				html+='</div>\n';
				html+='</div>\n';
			}
			jQuery('#sidebar_trending').html(html);
		}
	});


}
function send_password_reset_link(){
	var this_email=jQuery('#password_reset_email').val();
	my_url='swatchity_lookup.php?mode=send_password_reset_link';
	$.post(my_url, {
		user_email:this_email,
	}, function(data, textStatus){
		if (data!='ok'){
			jQuery('#swatchity_forgot_form .form_alert_box').html('There was a problem sending your email. Please try again later.');			
		} else {
			jQuery('#ui_login_forgot1').hide();
		}
	});
}


function disp_user_info_header(){
		var badge_html=draw_profile_badge(user['user_profile']);
		//jQuery('.user_profile_badge').html(badge_html);
		jQuery('#ui_header_profile_badge').html(badge_html);
		jQuery('#feed_header_profile_badge').html(badge_html);
		
		jQuery('#disp_user_stats_swatches').html(user['user_stats_swatches']+ '<sup>&curren;</sup>');
		var attention=user['user_stats_favs']*1 + user['user_stats_msgs']*5;
		var points=attention+user['user_stats_swatches']*1;
		if (points>=level_goals[user['user_level']]){
			// level up!
			user['user_level']++;
			// save user_level
				my_url='swatchity_lookup.php?mode=save_user_level';
				$.post(my_url, {
					user_id:user['user_id'],
					user_level:user['user_level']
				}, function(data, textStatus){
				});
				
			var html='<img src="images/levels/swatchity_512_level_'+user['user_level']+'.jpg"><h1>Level Up!</h1>';
			if (jQuery('#main_loading').css('display')=="none"){
				jQuery('#main_loading').html(html);
				jQuery('#main_loading').html(html).fadeIn(300).delay(2000).fadeOut(300);
			}
		}
		var points_to_go=level_goals[user['user_level']]-points;
		jQuery('#disp_user_pts_to_next_level').html(points_to_go);
		
		jQuery('#user_name_display').html(
		
		'<a href="#" onclick="search_user('+user['user_id']+');return false;">'+ user['user_name'] + '</a> <a href="#" onclick="show_level();return false;">(L:' + user['user_level']+')</a>');
		jQuery('#disp_user_stats_attention').html(attention + '<sup>&#x259;</sup>');
		var user_meta=get_user_stats_meta(user['user_stats_avg_color']);
		jQuery('#disp_user_stats_meta').html(user_meta + '<sup>&#x28a;</sup>');
		
		//' <a href="#" onclick="return false;" style="text-decoration:none;"><span>&#9654;</span><span id="">&#9660;</span></a>');
}
function swatchity_login(){
	var name=jQuery('#user_name').val();
	var password=jQuery('#user_password').val();
	my_url='swatchity_lookup.php?mode=login';
	
	$.post(my_url, {
		user_name:name,
		user_password:password,
	}, function(data, textStatus){
		if (data.charAt(0)=="{"){
			user = jQuery.parseJSON( data );
			ui_transition_to('ui_panel_home');
			disp_user_info_header();
			get_localized_text();

		}
	});
}
function show_level(){
	var html='<img src="images/levels/swatchity_512_level_'+user['user_level']+'.jpg"><a href="#" onclick="jQuery(this).parent().hide();return false;" class="btn_close"><span>CLOSE</span></a>';
	if (jQuery('#main_loading').css('display')=="none"){
		jQuery('#main_loading').html(html);
		jQuery('#main_loading').fadeIn(250);
	}
}
function check_login_cookies(){
	my_url='swatchity_lookup.php?mode=login_cookies';
	$.post(my_url, {
		cookies_check:'true',
	}, function(data, textStatus){
		if (data.charAt(0)=="{"){
			user = jQuery.parseJSON( data );
			jQuery(window).delay(500).fadeIn(0,function(){
				ui_transition_to('ui_panel_home');
			});
			disp_user_info_header();
			get_localized_text();

		} else {
			if (jump_to_login==true){
				ui_transition_to('ui_panel_login_register');
			} else {
				ui_transition_to('ui_panel_public');
			}
		}
	});
}

function get_news_feed(){
	my_url='swatchity_lookup.php?mode=get_news_feed';
	$.post(my_url, {
		language:user['user_language']
	}, function(data, textStatus){
		if (data.charAt(0)=="{"){
			html='';
			data=data.split('\r').join('\n');
			data_lines=data.split('\n');
			for (i=0;i<data_lines.length;i++){
				if (data_lines[i].length>1){
					news_item = jQuery.parseJSON(data_lines[i]);
					html+='<div class="news_item">';
					html+='<div class="news_item_header"><a href="#" onclick="show_news_item('+news_item['news_id']+');return false;">';
					html+=news_item['news_headline'];
					html+='</a></div>';
					html+='<div class="news_item_excerpt">';
					html+=news_item['news_excerpt'];
					html+='</div></div>\n';

				}
			}
			jQuery('#ui_news_content').html(html);
		}
	});
}
function show_news_item(id){
	my_url='swatchity_lookup.php?mode=get_news_detail';
	$.post(my_url, {
		language:user['user_language'],
		news_id:id
	}, function(data, textStatus){
	
		news_item = jQuery.parseJSON(data);
		var html='';
		//html+='<div class="bg_close" onclick="jQuery(this).parent().parent().hide();jQuery(\'#btn_swatch\').removeClass(\'btn_active\');"></div>';
		html+='<a href="#" onclick="jQuery(this).parent().parent().hide();jQuery(\'#btn_swatch\').removeClass(\'btn_active\');return false;" class="btn_close"><span>CLOSE</span></a>';

		html+='<h1 class="centered_text">'+news_item['news_headline']+'</h1>';
		var content=news_item['news_content'];
		content=content.split('\r').join('\n');
		content=content.split('\n\n').join('\n');
		content=content.split('\n').join('<br /><br />');
		
		html+=content;
		jQuery('#ui_news_content_stage').html(html);
		
		jQuery('#ui_news_modal').show();
	});

	
}

function draw_profile_badge(str){
	var output='';
	if (str==''){
		// blank profile = solid red color
		str="bb4444,bb4444,bb4444,bb4444";
	}
	str=str.split(' ').join('');
	var bits=str.split(',');
	var num_parts=bits.length;
	if (num_parts>4){num_parts=4;}
	var size=50;
	var i;
	for (i=0;i<num_parts;i++){
		output+='<div style="float:left;width:'+size+'%;height:'+size+'%;background:#'+ bits[i] +';"></div>';
	}
	return output;
}

function init_profile_edit_panel(){
	var colors=user['user_profile'].split(',');
	for (i=0;i<=3;i++){
		var j=i+1;
		jQuery('#profile_swatch_'+j).css('background-color','#'+colors[i]);
	}
}
function call_refresh_timeline(){
	refresh_timeline('top');
	var refresh_delay=45;
	jQuery('#ui_feed_block').delay(refresh_delay*1000).fadeIn(0,function(){
		call_refresh_timeline();
	});
}

function reset_feed(){
	scroll_to_top_of_screen();
	last_swatch_id=0;
	results_page=0;
	jQuery('#ui_feed').html('<div class="activity_indicator" style="display:block;text-align:center"><img src="http://www.swatchity.com/images/swatchity_activity.gif"></div>');
}
function scroll_to_top_of_screen(){
	//jQuery('#ui_panel_home').scrollTop(0);
 	jQuery('#ui_panel_home').animate({scrollTop:0},250);
 }
function ui_transition_to(panel_id){
	current_panel=panel_id;
	jQuery( "#swatchity_reg_sub_panel" ).show();

	switch(panel_id){
		case "ui_panel_home":
			feed_mode='home';
			set_nav_bar_active_page('home');
			reset_feed();
			update_leaderboard();
			call_refresh_timeline();
			get_news_feed();
		break;
		case "ui_panel_settings_edit":
			init_settings_panel();
		break;

		case "ui_panel_profile_edit":
			init_profile_edit_panel();
		break;
	}
	jQuery('.ui_panel').each(function(){
		if (jQuery(this).attr('id')!=panel_id){
			jQuery(this).hide(0);
		} else {
			jQuery(this).show(0);
		}
		jQuery(this).height(jQuery(window).height());
	});
	scroll_to_top_of_screen();
}
function swatchity_logout(){
	my_url='swatchity_lookup.php?mode=logout';
	$.post(my_url, {
		cookies_check:'true',
	}, function(data, textStatus){
		jQuery('#disp_user_name').html('');
		ui_transition_to('ui_panel_public');
	});
}

function hide_menu(){
	jQuery('#ui_sub_menu').hide();jQuery(this).removeClass('btn_active');
}

function decimalToHexString(number){
    var tmp= (number / 256 + 1 / 512).toString(16).substring(2, 4);
    return(tmp);
}
function random_color(){
	var rnd;
	var rnd_hex;
	var color_str='';
	for (i=0;i<=2;i++){
		rnd=Math.floor((Math.random() * 255) + 1);
		rnd_hex=decimalToHexString(rnd);
		color_str+=rnd_hex;
	}
	return(color_str);	
}

function rgb2hex(rgb) {
    rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
    function hex(x) {
        return ("0" + parseInt(x).toString(16)).slice(-2);
    }
    return hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
}
function hex_get_component(hex,component){
	switch(component){
		case 'r':
			return(hex.substring(0, 2));
			break;
		case 'g':
			return(hex.substring(2, 4));
			break;
		case 'b':
			return(hex.substring(4, 6));
			break;
	}
}
function hex_math(hex,dr,dg,db,rollover){
	// dr,dg,db are decimals
	var r=hex_get_component(hex,'r');
	var g=hex_get_component(hex,'g');
	var b=hex_get_component(hex,'b');

	var r_dec=parseInt("0x" + r);
	var g_dec=parseInt("0x" + g);
	var b_dec=parseInt("0x" + b);
	r=r_dec+dr;
	g=g_dec+dg;
	b=b_dec+db;
	if (rollover){
		if (r>255){r=r-255;}
		if (g>255){g=g-255;}
		if (b>255){b=b-255;}

		if (r<0){r=255-r;}
		if (g<0){g=255-g;}
		if (b<0){b=255-b;}
	} else {
		if (r>255){r=255;}
		if (g>255){g=255;}
		if (b>255){b=255;}

		if (r<0){r=0;}
		if (g<0){g=0;}
		if (b<0){b=0;}
	}
	hex=decimalToHexString(r)+decimalToHexString(g)+decimalToHexString(b);
	return(hex);
}
function my_rnd(max,min,polar){
	var posNeg=1;
	if (polar){
		if (Math.random()<.5){
			posNeg=-1;
		}
	}
	return(posNeg*Math.floor((Math.random() * max) + min));
}
function sm_rnd(){
	var sm_range=25;
	return(my_rnd(sm_range,5,true));
}

function db_date_to_string(dbdate){
	//2015-05-19 09:44:07
	var date_time=dbdate.split(' ');
	var date=date_time[0];
	var time=date_time[1];
	var date_bits=date.split('-');
	var year=date_bits[0];
	var yearshort=year.substring(0,2);
	var month=date_bits[1]*1;
	var day=date_bits[2]*1;
	var time_bits=time.split(':');
	var hours=time_bits[0];
	var ampm='am';
	if (hours>11){ampm='pm';}
	if (hours>12){hours-=12;}
	var mins=time_bits[1]*1;
	var secs=time_bits[2]*1;

	return(month + '/' + day + '/' + yearshort + ' @' + hours + ':' +mins +ampm);
}

 function isDST(t) { //t is the date object to check, returns true if daylight saving time is in effect.
    var jan = new Date(t.getFullYear(),0,1);
    var jul = new Date(t.getFullYear(),6,1);
    return Math.min(jan.getTimezoneOffset(),jul.getTimezoneOffset()) == t.getTimezoneOffset();  
}

function calcTime(date_str,offset) {
	// db time is pdt (gmt-7)
	// offset = tz stored in db
	// gmt-4 becomes offset =3 (dst)
	// gtm+1 becomes offset =8 (dst)
	// gtm-7 becomes offset =0 (dst)
	offset+=9;
	// DST?
		var today = new Date();
		if (isDST(today)){
			offset-=1;
		}
	date_str=date_str.split(' ').join('T');
    d =  new Date(date_str);
    utc = d.getTime()+ (d.getTimezoneOffset() * 60000);
    nd = new Date(utc+(3600000*offset));
    var the_date = nd.getDate();
	var the_month = nd.getMonth();
	var the_year = nd.getYear()*1+1900;
	var the_hours = nd.getHours();
	if (the_hours>11){the_ampm='pm';}else{the_ampm='am';}
	if (the_hours>12){the_hours-=12;}
	var the_minutes=nd.getMinutes();
	var txt= lbl_months[the_month] + ' ' + the_date + ', ' + the_year + ' @' + the_hours + ':' +the_minutes + ' ' + the_ampm;
    return(txt);
}
function save_user_setting(obj){
	var setting_name=jQuery(obj).attr('id').split('settings_').join('');
	var setting_val=jQuery(obj).val();
	user[setting_name]=setting_val;
	var my_url='swatchity_lookup.php?mode=save_user_setting';
	$.post(my_url, {
		this_setting_name:setting_name,
		this_setting_val:setting_val,
		user_id:user['user_id']
	}, function(data, textStatus){
	});	
}
function swatch_picker_toggle_day_night(){
	jQuery('#swatch_picker_day_night').toggleClass('btn_active');
	jQuery('#ui_swatch_modal').toggleClass('swatch_picker_daylight');
	jQuery('#ui_swatch_modal .btn_close').toggleClass('btn_close_daylight');
}
function day_night_toggle(obj){
	jQuery(obj).toggleClass('btn_active');
	jQuery(obj).parent().find('.ui_form_container').toggleClass('modal_bg_daylight');
//	jQuery('#ui_swatch_modal .btn_close').toggleClass('btn_close_daylight');
}

function read_messages(){
	feed_mode='messages';
	set_nav_bar_active_page('messages');
	reset_feed();
	refresh_timeline('bottom');
	jQuery('#ui_messages_badge').hide();
}
function search_user(user_id){
	set_nav_bar_active_page('home');
	feed_mode='user_search';
	srch_user=user_id;
	reset_feed();
	refresh_timeline('bottom');
}
function show_feed_header(){
	jQuery('.feed_header_inner').each(function(){
		var id=jQuery(this).attr('id');
		if (id=='feed_header_'+feed_mode){
			jQuery(this).show();
		} else {
			jQuery(this).hide();
		}
	});
	jQuery('ui_feed_block_header').removeClass('home');
	jQuery('ui_feed_block_header').removeClass('user_search');
	jQuery('ui_feed_block_header').removeClass('color_search');
	jQuery('ui_feed_block_header').addClass('feed_mode');
}

function check_notifications(){
	my_url='swatchity_lookup.php?mode=get_num_unread_notifications';
	$.post(my_url, {
		user_id:user['user_id'],
		user_last_read_notification:user['user_last_read_notification']
	}, function(data, textStatus){
		data*=1;
		if (data>0){
			jQuery('#ui_notifications_badge').html(data);
			jQuery('#ui_notifications_badge').show(250);
		} else {
			jQuery('#ui_notifications_badge').hide();
		}
	});
}
function check_messages(){
	my_url='swatchity_lookup.php?mode=get_num_unread_messages';
	$.post(my_url, {
		user_id:user['user_id'],
		user_last_read_message:user['user_last_read_message']
	}, function(data, textStatus){
		data*=1;
		if (data>0){
			jQuery('#ui_messages_badge').html(data);
			jQuery('#ui_messages_badge').show(250);
		} else {
			jQuery('#ui_messages_badge').hide();
		}
	});
}

function toggle_favorite_this_swatch(obj,this_fav_swatch_id,this_swatch_color,this_fav_swatch_user_id,this_fav_swatch_user_name){
	jQuery(obj).toggleClass('swatch_favorited');
	var num_fav=jQuery(obj).find('.feed_swatch_fav_num_faves').html()*1;
	var is_favorited=false;
	if (jQuery(obj).hasClass('swatch_favorited')){
		is_favorited=true;
		num_fav++;
		jQuery(obj).find('.feed_swatch_fav_num_faves').html(num_fav);
	} else {
		num_fav--;
		jQuery(obj).find('.feed_swatch_fav_num_faves').html(num_fav);
	}

	if (num_fav>0){
		jQuery(obj).find('.feed_swatch_fav_num_faves').addClass('feed_swatch_fav_num_faves_active');
	} else {
		jQuery(obj).find('.feed_swatch_fav_num_faves').removeClass('feed_swatch_fav_num_faves_active');
	}

	var my_url='swatchity_lookup.php?mode=save_favorite';
	$.post(my_url, {
		user_id:user['user_id'],
		fav_swatch_id:this_fav_swatch_id,
		fav_swatch_user_id:this_fav_swatch_user_id,
		fav_swatch_user_name:this_fav_swatch_user_name,
		swatch_color:this_swatch_color,
		fav_on_off:is_favorited
	}, function(data, textStatus){
	});	
}

function share_this_swatch(obj,swatch_id,swatch_color,user_id,user_name){
	img_url='http://www.swatchity.com/swatchity_image.php?hex=' + swatch_color;

	tmp='https://twitter.com/intent/tweet?text=Swatchity: live a more colorful life! +';
	tmp+='+%23Swatchity+'+img_url;

}

function toggle_pals(obj,other_user_id){
	jQuery(obj).toggleClass('icon-pals_active');
	if (jQuery(obj).hasClass('icon-pals_active')){
		is_pal=1;
	} else {
		is_pal=0;
	}
	var my_url='swatchity_lookup.php?mode=save_pal';
	$.post(my_url, {
		user_id:user['user_id'],
		pal_user_you:other_user_id,
		pal_on_off:is_pal
	}, function(data, textStatus){
	});	
}
function refresh_timeline(feed_type){
	if (feed_mode!='messages'){
		check_messages();
	}
	if (feed_mode!='notifications'){
		check_notifications();
	}

	if (last_swatch_id==0){feed_type='bottom';}
	var html="";
	// modes: normal, search, user_search
	var my_url='swatchity_lookup.php?mode=get_feed&feed_mode='+feed_mode;
	show_feed_header();
	if (feed_mode=='user_search'){
		my_url+='&srch='+srch_user;
	} else if (feed_mode=='color_search'){
		my_url+='&srch='+srch_color;
	}
	var this_pals_only=0;if (jQuery('#feed_header_pals_only').hasClass('icon-pals_active')){this_pals_only=1;}
console.log(this_pals_only);
	$.post(my_url, {
		user_id:user['user_id'],
		page:results_page,
		num_per_page:results_num_per_page,
		the_feed_type:feed_type,
		pals_only:this_pals_only,
		sw_last_swatch_id:last_swatch_id
	}, function(data, textStatus){
		data=data.split('\r').join('\n');
		data_lines=data.split('\n');
		header_unset=true;
		if (data_lines.length<2){
			//html+='No more. So Sad.';
			//jQuery('#ui_feed').append(html);
		} else {
			jQuery('.activity_indicator').hide();
			for (i=0;i<data_lines.length;i++){
				if (data_lines[i].length>1){
					new_item = jQuery.parseJSON(data_lines[i]);
					if (feed_mode=='notifications'){
						this_id=new_item['notification_id']*1;
						if (this_id>last_swatch_id){
							last_swatch_id=this_id;
						}
						// adjust for user's timezone
						this_date=new_item['notification_date'];
						tmp_tz=user['user_timezone']*1;
						if (tmp_tz==99999){tmp_tz=5000000000000;}
						this_date=calcTime(this_date,tmp_tz);
						var lbl=new_item['notification_label'];
						lbl=lbl.split('___BEGINCOLOR___').join('<div class="mini_swatch" style="background:#');
						lbl=lbl.split('___ENDCOLOR___').join('"></div>');
						// common translatable phrases
						lbl=lbl.split('favrorited your swatch').join(localized_text_arr['favrorited_your_swatch']);
						lbl=lbl.split('Congratulations on achieving level').join(localized_text_arr['congratulations_on_achieving_level']);
						html+='<div class="notification_feed_item ';
						if (this_id>user['user_last_read_notification']){
							html+='this_item_is_new';
						}
						html+=' ">'+this_date + ' - ' + lbl +'</div>';
					} else {
						this_id=new_item['swatch_id']*1;
						this_color=new_item['swatch_color'];
						this_date=new_item['swatch_date'];
						if (this_id>last_swatch_id){
							last_swatch_id=this_id;
						}
						if (header_unset){
							if (feed_mode=='user_search'){
								var user_search_badge=draw_profile_badge(new_item['user_profile']);
								jQuery('#feed_header_search_user_profile_badge').html(user_search_badge);
								var user_name_html = new_item['user_name'];
								if (new_item['user_id']!=user['user_id']){
									user_name_html+='<a href="#" class="img-btn has-icon icon-wht has-highlight icon-messages" onclick="initiate_message(\''+new_item['user_id']+'\');return false;"><span>Send Message</span></a>';

									user_name_html+='<a href="#" class=" ';
									if (new_item['pal_user_you']==new_item['user_id']){
										user_name_html+=' icon-pals_active ';
									}
									user_name_html+='icon-pals" onclick="toggle_pals(this,\''+new_item['user_id']+'\');return false;"><span>Pal</span></a>';
								}
								jQuery('#feed_header_search_user_disp_name').html(user_name_html);
								
								jQuery('#disp_user_srch_stats_swatches').html(new_item['user_stats_swatches']+ '<sup>&curren;</sup>');
								var attention=new_item['user_stats_favs']*1 + new_item['user_stats_msgs']*1
								jQuery('#disp_user_srch_stats_attention').html(attention + '<sup>&#x259;</sup>');
								var user_meta=get_user_stats_meta(new_item['user_stats_avg_color']);
								jQuery('#disp_user_srch_stats_meta').html(user_meta + '<sup>&#x28a;</sup>');
	
	
							} else if (feed_mode=='search_color'){
							}
							header_unset=false;
						}
						// adjust for user's timezone
						this_date=calcTime(this_date,user['user_timezone']*1);
						var this_user=new_item['user_name'];
						var this_user_profile=new_item['user_profile'];
						var this_user_id=new_item['user_id'];
						var this_user_level=new_item['user_level'];
						var tmp_my_class="";if(this_user_id==user['user_id']){tmp_my_class=' swatch_mine ';}
						if (feed_mode=='messages'){
							if (this_id>user['user_last_read_message']){
								tmp_my_class+=' this_item_is_new ';
							}
						}
						if (parseInt("0x" + this_color)<5592405){tmp_my_class+=' swatch_is_dark ';}
						html+='<div class="feed_swatch feed_swatch_new ' + tmp_my_class + '" style="display:none;">\n';
						html+='		<div class="swatch_bubble" id="swatch_'+this_id+'" style="background-color:#'+this_color+';">\n';
						// buttons

							// favorite
								html+='<a href="#" onclick="';
								if(this_user_id!=user['user_id']){
									html+='toggle_favorite_this_swatch(this,'+this_id+',\''+this_color+'\','+this_user_id+',\''+escape(this_user)+'\');';
								}
								html+='return false;" class="feed_swatch_btn_fav ';
								if (new_item['fav_swatch_id']==new_item['swatch_id']){
									html+=' swatch_favorited ';
								}
								html+='"><div class="feed_swatch_fav_num_faves ';
									if (new_item['swatch_num_faves']>0){
										html+=' feed_swatch_fav_num_faves_active">';
										html+=new_item['swatch_num_faves'];
									} else { html+='">';}
								html+='</div></a>';
	
							// export
								img_url='http://www.swatchity.com/swatchity_image.php?hex=' + this_color;
								//img_url='http://www.swatchity.com/swatch.php?hex=' + this_color;								

							html+='<a href="http://www.swatchity.com/share.php?id='+this_id+'" target="_blank" class="feed_swatch_btn_share "></a>';
							
							

						html+='		</div>\n';
						html+='		<div class="feed_swatch_caption">\n';
						
						var tmp_badge='			<div class="feed_profile_badge">'+draw_profile_badge(this_user_profile)+'<div class="feed_profile_badge_cover"></div></div>\n';
						var tmp_txt='			<a href="#" onclick="search_user('+this_user_id+');return false;">' + this_user + ' (L:'+this_user_level+')</a> - ' + this_date;
						var tmp_pals='<a href="#" onclick="togglePals();return false;" class="btn_pals"><span>Pals<span></a>\n'; 
						
						var msg_link_txt='';
						if (feed_mode=='messages'){
							msg_link_txt='			<a href="#" class="btn_mini_msg_link" onclick="initiate_message('+this_user_id+');return false;"><span>Reply</span></a> \n';
						}
						if(this_user_id==user['user_id']){
							html+=tmp_txt+'\n'+tmp_badge;
						} else{
							html+=tmp_badge+'\n'+tmp_txt + ' ' + msg_link_txt;
							//+ ' ' + tmp_pals;
						}
						html+='		</div>\n';
						html+='		<style>#swatch_'+this_id+':after{border-color: #'+this_color+' transparent;}</style>\n';
						html+='</div>\n';
					}
				}
			}
			if (feed_type=='top'){
				jQuery('#ui_feed').prepend(html);
			} else {
				if (data_lines.length>=results_num_per_page){
					html+='<div style="text-align:center"><a href="#" class="btn_feed_load_more" onclick="feed_load_more();remove(this);return false;">' + localized_text_arr['btn_load_more_text'] + '</a></div>';
				}
				jQuery('#ui_feed').append(html);
			}
			if (feed_mode=='notifications'){
				user['user_last_read_notification']=last_swatch_id;

				save_user_last_read_notification();
				jQuery('#user_last_read_notification').hide();
			}
			
			if (feed_mode=='messages'){
				user['user_last_read_message']=last_swatch_id;
				save_user_last_read_message();
				jQuery('#ui_messages_badge').hide();
			}

			i=0;
			jQuery('.feed_swatch_new').each(function(){
				jQuery(this).delay(i*50).show(500,function(){
					jQuery(this).removeClass('feed_swatch_new');
				});
				i++;
			});
			display_update_user_stats();
		}

	});
	
}


function display_update_user_stats(){
	my_url='swatchity_lookup.php?mode=get_user_stats';
	$.post(my_url, {
		user_id:user['user_id']
	}, function(data, textStatus){
		user = jQuery.parseJSON( data );
		disp_user_info_header();	
	});
}

function save_user_last_read_notification(){
	my_url='swatchity_lookup.php?mode=set_user_last_read_notification';
	$.post(my_url, {
		user_id:user['user_id'],
		user_last_read_notification:user['user_last_read_notification']
	}, function(data, textStatus){
	});
}

function save_user_last_read_message(){
	my_url='swatchity_lookup.php?mode=set_user_last_read_message';
	$.post(my_url, {
		user_id:user['user_id'],
		user_last_read_message:user['user_last_read_message']
	}, function(data, textStatus){
	});
}
function feed_load_more(){
	results_page++;
	refresh_timeline('bottom');
}
function edit_user_profile_save(){
	ui_transition_to('ui_panel_home');
	var profile_string=get_hex_from_obj_str('#profile_swatch_1');
	profile_string+=','+get_hex_from_obj_str('#profile_swatch_2');
	profile_string+=','+get_hex_from_obj_str('#profile_swatch_3');
	profile_string+=','+get_hex_from_obj_str('#profile_swatch_4');
	user['user_profile']=profile_string;
	my_url='swatchity_lookup.php?mode=save_user_setting';
	disp_user_info_header();
	$.post(my_url, {
		this_setting_name:'user_profile',
		this_setting_val:profile_string,
		user_id:user['user_id']
	}, function(data, textStatus){
		refresh_timeline('top');
	});

}

function get_hex_from_obj_str(obj_str){
		return color_cc=rgb2hex(jQuery(obj_str).css('background-color'));
}


function swatch_picker_touched(obj){
	var touched_class=jQuery(obj).attr('class');
	if (jQuery(obj).hasClass('swatch_picker_cc')){
		if (swatch_picker_lockout==false){
			swatch_picker_lockout=true;
			var color_cc=rgb2hex(jQuery('.swatch_picker_cc').css('background-color'));
			if (swatch_picker_mode=='new-swatch'){
				// process swatch, save
				my_url='swatchity_lookup.php?mode=post_swatch';
				$.post(my_url, {
					user_id:user['user_id'],
					user_name:user['user_name'],
					audience:0,
					color:color_cc
				}, function(data, textStatus){
					refresh_timeline('top');
				});
			} else if (swatch_picker_mode=='search'){
					feed_mode='color_search';
					srch_color=color_cc;
					jQuery('#feed_header_color_search_input_container').css('background-color','#'+color_cc);
					if (parseInt("0x" + color_cc)<12303291){
						jQuery('#feed_header_color_search_text_input').addClass('is_dark');
					} else {
						jQuery('#feed_header_color_search_text_input').removeClass('is_dark');
					}
					reset_feed();
					refresh_timeline('top');
			} else if (swatch_picker_mode.substring(0,7)=='message'){
				//send message
				swatch_picker_mode_bits=swatch_picker_mode.split('_');
				var to_user_id=swatch_picker_mode_bits[1];
				my_url='swatchity_lookup.php?mode=post_swatch';
				$.post(my_url, {
					user_id:user['user_id'],
					user_name:user['user_name'],
					audience:to_user_id,
					color:color_cc
				}, function(data, textStatus){
					refresh_timeline('top');
				});
				
				jQuery('#super_modal_alert').html('<h1>message sent.</h1>');
				jQuery('#super_modal_alert').fadeIn(500).delay(1500).fadeOut();
	
			} else if (swatch_picker_mode.substring(0,7)=='profile'){
				var profile_swatch_num=swatch_picker_mode.split('profile_').join('')*1;
				jQuery('#profile_swatch_'+profile_swatch_num).css('background-color','#'+color_cc);
			}
	
			// collapse UI	
			i=0;
			jQuery('.swatch_picker_cell').each(function(){
				if (jQuery(this).attr('class')!=touched_class){
					jQuery(this).delay(i*50).fadeOut(100,function(){
						swatch_picker_lockout=false;
						jQuery(this).remove();
					});
				}					
			});
			jQuery(obj).animate({ opacity: 1,left: "50%",top: "50%",height:"0%",width:"0%" }, 200, 'easeOutQuint', function () {
				jQuery(obj).parent().parent().fadeOut(200);jQuery('#btn_swatch').removeClass('btn_active');
			});
		}
	} else {
		i=0;
		jQuery('.swatch_picker_cell').each(function(){
			if (jQuery(this).attr('class')!=touched_class){
				jQuery(this).delay(i*50).fadeOut(100,function(){
					jQuery(this).remove();
				});
			} else {
				jQuery(this).removeClass(touched_class);
				jQuery(this).addClass('swatch_picker_cell');
				jQuery(this).addClass('swatch_picker_cc');
				jQuery(this).animate({ opacity: 1,left: "25%",top: "25%",height:"50%",width:"50%" }, 750, 'easeOutElastic', function () {
				});
				jQuery('#ui_swatch_modal').delay(250).fadeIn(0,function(){
					swatch_modal_launch_sub_colors();
				});
			}
			
			i++;
		});
	}
}
function hex_submissive_color(hex){
	var r=hex_get_component(hex,'r');
	var g=hex_get_component(hex,'g');
	var b=hex_get_component(hex,'b');
	var r_dec=parseInt("0x" + r);
	var g_dec=parseInt("0x" + g);
	var b_dec=parseInt("0x" + b);
	if ((r_dec<g_dec) && (r_dec<b_dec)){
		return('FF0000');
	} else if ((g_dec<r_dec) && (g_dec<b_dec) ){
		return('00FF00');
	} else {
		return('0000FF');
	}
}
function hex_dominant_color(hex){
	var r=hex_get_component(hex,'r');
	var g=hex_get_component(hex,'g');
	var b=hex_get_component(hex,'b');
	var r_dec=parseInt("0x" + r);
	var g_dec=parseInt("0x" + g);
	var b_dec=parseInt("0x" + b);
	if ((r_dec>g_dec) && (r_dec>b_dec)){
		return('FF0000');
	} else if ((g_dec>r_dec) && (g_dec>b_dec) ){
		return('00FF00');
	} else {
		return('0000FF');
	}
}
function hex_mix_colors(hex,mix_hex,amt,rnd){
	// amt is fraction of 1 (1=full mix / 0=no mix)
	var r=hex_get_component(hex,'r');
	var g=hex_get_component(hex,'g');
	var b=hex_get_component(hex,'b');
	var r_dec=parseInt("0x" + r);
	var g_dec=parseInt("0x" + g);
	var b_dec=parseInt("0x" + b);
	

	var r2=hex_get_component(mix_hex,'r');
	var g2=hex_get_component(mix_hex,'g');
	var b2=hex_get_component(mix_hex,'b');
	var r2_dec=parseInt("0x" + r2);
	var g2_dec=parseInt("0x" + g2);
	var b2_dec=parseInt("0x" + b2);

	r_dec=r_dec+(r2_dec-r_dec)*amt;
	g_dec=g_dec+(g2_dec-g_dec)*amt;
	b_dec=b_dec+(b2_dec-b_dec)*amt;
	hex=decimalToHexString(r_dec) + decimalToHexString(g_dec) + decimalToHexString(b_dec);
	return(hex);
}
function swatch_modal_launch_sub_colors(){
	var t=150;
	var t_offset=25;
	var tmp_t=0;
	var delay_t=100;
	var colors=[];
	var color_cc=rgb2hex(jQuery('.swatch_picker_cc').css('background-color'));
	var tmp;
	rnd_range=90;
	rnd_min=15;
	
	colors['tl']=hex_math(color_cc,my_rnd(rnd_range,rnd_min,false),my_rnd(rnd_range,rnd_min,false),sm_rnd(),true);

	colors['tc']=hex_mix_colors(color_cc,hex_dominant_color(color_cc),(Math.random()*.6+.1),0);
	colors['tr']=hex_mix_colors(color_cc,random_color(),(Math.random()*.6+.1),0);
	tmp=my_rnd(rnd_range,rnd_min,false);
	colors['cl']=hex_math(color_cc,-1*tmp,-1*tmp,-1*tmp,false);
	tmp=my_rnd(rnd_range,rnd_min,false);
	colors['cr']=hex_math(color_cc,tmp,tmp,tmp,false);
	colors['bl']=hex_mix_colors(color_cc,random_color(),(Math.random()*.6+.1),0);
	colors['bc']=hex_mix_colors(color_cc,hex_submissive_color(color_cc),(Math.random()*.6+.1),0);
	colors['br']=hex_math(color_cc,my_rnd(sm_rnd(),rnd_range,rnd_min,false),my_rnd(rnd_range,rnd_min,false),true);

	var html='';
	html+='<div class="swatch_picker_cell swatch_picker_tl" style="background-color:#'+colors['tl']+'" onclick="swatch_picker_touched(this);"></div>'; 
	html+='<div class="swatch_picker_cell swatch_picker_tc" style="background-color:#'+colors['tc']+'" onclick="swatch_picker_touched(this);"></div>'; 
	html+='<div class="swatch_picker_cell swatch_picker_tr" style="background-color:#'+colors['tr']+'" onclick="swatch_picker_touched(this);"></div>'; 

	html+='<div class="swatch_picker_cell swatch_picker_cl" style="background-color:#'+colors['cl']+'" onclick="swatch_picker_touched(this);"></div>'; 
	html+='<div class="swatch_picker_cell swatch_picker_cr" style="background-color:#'+colors['cr']+'" onclick="swatch_picker_touched(this);"></div>'; 

	html+='<div class="swatch_picker_cell swatch_picker_bl" style="background-color:#'+colors['bl']+'" onclick="swatch_picker_touched(this);"></div>'; 
	html+='<div class="swatch_picker_cell swatch_picker_bc" style="background-color:#'+colors['bc']+'" onclick="swatch_picker_touched(this);"></div>'; 
	html+='<div class="swatch_picker_cell swatch_picker_br" style="background-color:#'+colors['br']+'" onclick="swatch_picker_touched(this);"></div>'; 

	jQuery('#ui_swatch_modal_stage').append(html);
	i=0;
	swatch_picker_lockout=true;
	jQuery('#ui_swatch_modal').fadeIn(0,function(){
			i++;tmp_t=i*t_offset+delay_t;jQuery( '.swatch_picker_tl' ).delay(tmp_t).animate({opacity: 1,left: "5%",top: "5%"}, t, function() {});i++;
			i++;tmp_t=i*t_offset+delay_t;jQuery( '.swatch_picker_tc' ).delay(tmp_t).animate({opacity: 1,left: "37%",top: "5%"}, t, function() {});i++;
			i++;tmp_t=i*t_offset+delay_t;jQuery( '.swatch_picker_tr' ).delay(tmp_t).animate({opacity: 1,left: "69%",top: "5%"}, t, function() {});i++;
		
			i++;tmp_t=i*t_offset+delay_t;jQuery( '.swatch_picker_cl' ).delay(tmp_t).animate({opacity: 1,left: "5%",top: "37%"}, t, function() {});i++;
			i++;tmp_t=i*t_offset+delay_t;jQuery( '.swatch_picker_cr' ).delay(tmp_t).animate({opacity: 1,left: "69%",top: "37%"}, t, function() {});i++;
	
			i++;tmp_t=i*t_offset+delay_t;jQuery( '.swatch_picker_bl' ).delay(tmp_t).animate({opacity: 1,left: "5%",top: "69%"}, t, function() {});i++;
			i++;tmp_t=i*t_offset+delay_t;jQuery( '.swatch_picker_bc' ).delay(tmp_t).animate({opacity: 1,left: "37%",top: "69%"}, t, function() {});i++;
			i++;tmp_t=i*t_offset+delay_t;jQuery( '.swatch_picker_br' ).delay(tmp_t).animate({opacity: 1,left: "69%",top: "69%"}, t, function() {swatch_picker_lockout=false;});i++;
	});	
}
function init_swatch_modal(init_color){
	html=''
	if (init_color==''){init_color=random_color();}
	
	html+='<div class="swatch_picker_cell swatch_picker_cc" style="background-color:#'+init_color+'" onclick="swatch_picker_touched(this);"></div>'; 


	var i=0;
	var t=150;
	var sw=jQuery(window).width();
	var sh=jQuery(window).height();
	var sz;
	var max=600; 
	if (sw>sh){
		sz=sh;
	} else {
		sz=sw;
	}
	if (sz>max){sz=max;}
	jQuery('#ui_swatch_modal_stage').height(sz);
	jQuery('#ui_swatch_modal_stage').width(sz);
	jQuery('#ui_swatch_modal_stage').css('top', Math.floor( Math.abs(sh-sz)/2 ) + 'px');
	jQuery('#ui_swatch_modal_stage').css('left', Math.floor( Math.abs(sw-sz)/2 ) + 'px');

	jQuery('#ui_swatch_modal_stage').html(html);
	
	jQuery('#ui_swatch_modal').fadeIn(0,function(){
		jQuery('.swatch_picker_cc').delay(10).animate({ opacity: 1,left: "25%",top: "25%",height:"50%",width:"50%" }, 750, 'easeOutElastic', function () { });
		swatch_modal_launch_sub_colors();
	});
	
}

function init_mobile(){
	if (jQuery(window).width()<700){

/*
		jQuery('#ui_news_block_header').addClass('expandable_is_collapsed');
		jQuery('#ui_news_block_main').hide();

		jQuery('#ui_leaderboard_block_header').addClass('expandable_is_collapsed');
		jQuery('#ui_leaderboard_block_main').hide();

		jQuery('#ui_profile_lower').addClass('expandable_is_collapsed');
		jQuery('#ui_profile_upper').hide();
*/


	}
	jQuery('#main_loading').delay(500).fadeOut(500,function(){
	});
}
function prepare_upload(){
	var myData = $( '#swatchy_fileinput' ).serialize();
	var myData = new FormData(jQuery('#swatchy_fileinput'));     
	jQuery.each(jQuery('#swatchy_fileinput')[0].files, function(i, file) {
		myData.append(i, file);
	});	
	
	jQuery('#super_modal_alert').html('<h1>processing image...</h1>');
	jQuery('#super_modal_alert').fadeIn(500);
	 
	$.ajax({
		type: "POST", 
		cache: false,
		contentType: false,
		processData: false,
		url: "swatchity_lookup.php?mode=upload_image",  
		user_id: user['user_id'],
		data: myData,
		success: function( data ) {
			// process swatch, save
			my_url='swatchity_lookup.php?mode=post_swatch';
			$.post(my_url, {
				user_id:user['user_id'],
				user_name:user['user_name'],
				audience:0,
				color:data
			}, function(data, textStatus){
				jQuery('#super_modal_alert').fadeOut(500);
				refresh_timeline('top');
			});

		}
	});
}

function set_localized_text(){
	jQuery('.localized_text').each(function(){
		var this_id=jQuery(this).attr('id');
		if (jQuery(this).is('input')){
			jQuery(this).attr("placeholder",localized_text_arr[this_id]);
		} else {
			jQuery(this).html(localized_text_arr[this_id]);
		}
	});
}

function set_user_language(){
	user['user_language']=jQuery('#settings_user_language').val();
	save_user_setting(jQuery('#settings_user_language'));
	reset_feed();
	get_localized_text();
}


function get_localized_text(){
	my_url='language_' + user['user_language'] + '.txt';
	jQuery.get( my_url, function( data ) {
		localized_text_arr=jQuery.parseJSON( data );
		set_localized_text();
	});
}
function init_ui(){
	jQuery('.expandable_controller').click(function() {
		jQuery(this).toggleClass('expandable_is_collapsed');
		jQuery(this).parent().find('.is_expandable').toggle();
	});
}

function init_public(){
	jQuery( "#ui_panel_public" ).scroll(function() {
		jQuery('.public_windowbox').each(function(){
			var h=jQuery(window).height();
			var eTop = jQuery(this).offset().top;
			var scr=jQuery('#ui_panel_public').scrollTop();
			var y=eTop-scr;
			y=eTop-75;
			if (y>0){y=0;} else if (y<-150){y=-150;}
			jQuery(this).find('.public_windowbox_img').css('top',y+'px');
		});
	});
}
function init_ads(){
	html='';
	my_url='swatchity_lookup.php?mode=get_ad';
	jQuery.get( my_url, function( data ) {
		ad=jQuery.parseJSON( data );
		html+='<a href="'+ad['ad_link_url']+'" target="_blank"><img src="'+ad['ad_img_url']+'"></a>';
		jQuery('#ui_ad_block_header').html(html);
	});
	
}
jQuery( document ).ready(function() {
	check_login_cookies();
	init_ui();
	init_mobile();
	init_public();
	init_ads();
});


jQuery(window).focus(function() {
	window_active=true;
});

jQuery(window).blur(function() {
	window_active=false;
});