<?php

	function ingest_var_safe($varname,$postorget){
		global $db; // assuming that this script is ONLY called after DB connection established
		if (strtolower($postorget)=="post"){
			return (mysqli_real_escape_string($db,$_POST[$varname]));
		} else {
			return (mysqli_real_escape_string($db,$_GET[$varname]));
		}
	}
	
	
	function cryptStr($str=""){
		global $swatchity_config;
		$salt=md5($str.$swatchity_config['the_salt']); 
		$str=md5("$salt$str$salt");
		return $str;
	}

	function encode_reset_token($id){
		global $swatchity_config; 
		$add=$swatchity_config['token_salt_adder'];
		$mult=$swatchity_config['token_salt_multiplier'];
		$token=($id+$add)*$mult;
		return($token);
	}
	function decode_reset_token($token){
		global $swatchity_config; 
		$add=$swatchity_config['token_salt_adder'];
		$mult=$swatchity_config['token_salt_multiplier'];
		$id=($token-$add*$mult)*(1/$mult);
		return($id);
	}
	
	function makePW(){
		$pw_length=10;
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$new_pw ="";
		for ($p = 0; $p < $pw_length; $p++) {
			$new_pw .= $characters[mt_rand(0, strlen($characters))];
		}
		return($new_pw);
	}
	
	function make_bitly_url($url,$login,$appkey,$format = 'xml',$version = '2.0.1') {
		$bitly = 'http://api.bit.ly/shorten?version='.$version.'&longUrl='.urlencode($url).'&login='.$login.'&apiKey='.$appkey.'&format='.$format;
		$curl_handle=curl_init();
		curl_setopt($curl_handle,CURLOPT_URL,$bitly);
		curl_setopt($curl_handle,CURLOPT_RETURNTRANSFER,true);
		$response = curl_exec($curl_handle);
		curl_close($curl_handle);
		  //$response = file_get_contents($bitly);
		if(strtolower($format) == 'json') {
			$json = @json_decode($response,true);
			return $json['results'][$url]['shortUrl'];
  		} else {
			$xml = simplexml_load_string($response);
			return 'http://bit.ly/'.$xml->results->nodeKeyVal->hash;
	  }
	}



?>