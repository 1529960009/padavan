<!DOCTYPE html>
<html>
<head>
<title><#Web_Title#> - ShadowSocks SSR Server</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">

<link rel="shortcut icon" href="images/favicon.ico">
<link rel="icon" href="images/favicon.png">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/main.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/engage.itoggle.css">

<script type="text/javascript" src="/jquery.js"></script>
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/bootstrap/js/engage.itoggle.min.js"></script>
<script type="text/javascript" src="/state.js"></script>
<script type="text/javascript" src="/general.js"></script>
<script type="text/javascript" src="/itoggle.js"></script>
<script type="text/javascript" src="/popup.js"></script>
<script type="text/javascript" src="/help.js"></script>
<script>
var $j = jQuery.noConflict();

$j(document).ready(function() {

	init_itoggle('ssrserver_enable');

});

</script>
<script>

<% login_state_hook(); %>

function initial(){
	show_banner(1);
	 show_menu(8,<% nvram_get_x("", "ssrserver_L2"); %>,<% nvram_get_x("", "ssrserver_L3"); %>);
	show_footer();
	//change_ssrserver_enable();
	if (!login_safe())
		textarea_scripts_enabled(0);

}

function textarea_scripts_enabled(v){
	inputCtrl(document.form['scripts.SSRconfig_script.sh'], v);
}

function applyRule(){
//	if(validForm()){
		showLoading();
		
		document.form.action_mode.value = " Apply ";
		document.form.current_page.value = "/Advanced_Extensions_SSR_Server.asp";
		document.form.next_page.value = "";
		
		document.form.submit();
//	}
}

function done_validating(action){
	refreshpage();
}


</script>
</head>

<body onload="initial();" onunLoad="return unload_body();">

<div class="wrapper">
	<div class="container-fluid" style="padding-right: 0px">
		<div class="row-fluid">
			<div class="span3"><center><div id="logo"></div></center></div>
			<div class="span9" >
				<div id="TopBanner"></div>
			</div>
		</div>
	</div>

	<div id="Loading" class="popup_bg"></div>

	<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>

	<form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">

	<input type="hidden" name="current_page" value="Advanced_Extensions_SSR_Server.asp">
	<input type="hidden" name="next_page" value="">
	<input type="hidden" name="next_host" value="">
	<input type="hidden" name="sid_list" value="LANHostConfig;General;">
	<input type="hidden" name="group_id" value="">
	<input type="hidden" name="action_mode" value="">
	<input type="hidden" name="action_script" value="">
	<input type="hidden" name="wan_ipaddr" value="<% nvram_get_x("", "wan0_ipaddr"); %>" readonly="1">
	<input type="hidden" name="wan_netmask" value="<% nvram_get_x("", "wan0_netmask"); %>" readonly="1">
	<input type="hidden" name="dhcp_start" value="<% nvram_get_x("", "dhcp_start"); %>">
	<input type="hidden" name="dhcp_end" value="<% nvram_get_x("", "dhcp_end"); %>">

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3">
				<!--Sidebar content-->
				<!--=====Beginning of Main Menu=====-->
				<div class="well sidebar-nav side_nav" style="padding: 0px;">
					<ul id="mainMenu" class="clearfix"></ul>
					<ul class="clearfix">
						<li>
							<div id="subMenu" class="accordion"></div>
						</li>
					</ul>
				</div>
			</div>

			<div class="span9">
				<!--Body content-->
				<div class="row-fluid">
					<div class="span12">
						<div class="box well grad_colour_dark_blue">
							<h2 class="box_head round_top">ShadowSocks - SSR Server</h2>
							<div class="round_bottom">
								<div class="row-fluid">
									<div id="tabMenu" class="submenuBlock"></div>
									<div class="alert alert-info" style="margin: 10px;">利用路由器搭建 SSR 服务端，将你的网络共享到公网，让你的小伙伴远程连接。<div>注意：需要U盘安装opt环境！！！  </div><div><a href="https://github.com/shadowsocksr-rm/shadowsocksr/" target="blank">项目地址: https://github.com/shadowsocksr-rm/shadowsocksr/</a> </div> <div><a href="https://github.com/shadowsocksr-rm/shadowsocks-rss/wiki/config.json" target="blank">配置文件各项说明:https://github.com/shadowsocksr-rm/shadowsocks-rss/wiki/config.json</a> </div><span style="color:#FF0000;" class=""><div>请手动配置【外部网络 - 端口转发 - 启用手动端口映射】来开启WAN访问</div><div>配置方法：源IP地址留空、端口范围=SSR服务端口、内网IP=路由IP，若SSR开多端口则添加多个映射。</div></span></div>

									<table width="100%" align="center" cellpadding="4" cellspacing="0" class="table">
										<tr>
											<th colspan="2" style="background-color: #E3E3E3;">开关</th>
										</tr>
										<tr>
											<th width="30%">ssr-server 开关</th>
											<td>
													<div class="main_itoggle">
													<div id="ssrserver_enable_on_of">
														<input type="checkbox" id="ssrserver_enable_fake" <% nvram_match_x("", "ssrserver_enable", "1", "value=1 checked"); %><% nvram_match_x("", "ssrserver_enable", "0", "value=0"); %>  />
													</div>
												</div>
												<div style="position: absolute; margin-left: -10000px;">
													<input type="radio" value="1" name="ssrserver_enable" id="ssrserver_enable_1" class="input" value="1" <% nvram_match_x("", "ssrserver_enable", "1", "checked"); %> /><#checkbox_Yes#>
													<input type="radio" value="0" name="ssrserver_enable" id="ssrserver_enable_0" class="input" value="0" <% nvram_match_x("", "ssrserver_enable", "0", "checked"); %> /><#checkbox_No#>
												</div>
											</td>
										</tr>
										<tr >
											<th style="border: 0 none;" width="30%">程序选择、更新地址:</th>
											<td style="border-top: 0 none;">
												<select name="ssrserver_update" class="input">
													<option value="0" <% nvram_match_x("","ssrserver_update", "0","selected"); %>>【SSR】 关闭同步更新</option>
													<option value="1" <% nvram_match_x("","ssrserver_update", "1","selected"); %>>【SSR】 开启同步更新 github.com</option>
													<option value="2" <% nvram_match_x("","ssrserver_update", "2","selected"); %>>【SSR】 开启同步更新 code</option>
													<option value="3" <% nvram_match_x("","ssrserver_update", "3","selected"); %>>【SSRR】开启同步更新github.com</option>
												  </select>
											</td>
										</tr>
										<tr>
											<th colspan="2" style="background-color: #E3E3E3;" >配置文件</th>
										</tr>
										<tr id="SSRconfig_script" colspan="3">
											<td colspan="2" style="border-top: 0 none;">
												<i class="icon-hand-right"></i> <a href="javascript:spoiler_toggle('script12')"><span>SSRconfig_script</span><div>&nbsp;<span style="color:#888;">查看以下文件修改 SSR 服务端启用配置参数。</span></div></a>
												<div id="script12">
													<textarea rows="24" wrap="off" spellcheck="false" maxlength="2097152" class="span12" name="scripts.SSRconfig_script.sh" style="font-family:'Courier New'; font-size:12px;"><% nvram_dump("scripts.SSRconfig_script.sh",""); %></textarea>
												</div>
											</td>
										</tr>
										
										<tr>
											<td colspan="2" style="border-top: 0 none;">
												<br />
												<center><input class="btn btn-primary" style="width: 219px" type="button" value="<#CTL_apply#>" onclick="applyRule()" /></center>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	</form>

	<div id="footer"></div>
</div>
</body>
</html>

