$(document).ready(function(){
	$("#login_tap").click(function(){
		$(this).removeClass('login_2');
		$(this).addClass('login_1');
		$("#nomember_tap").removeClass('login_1');
		$("#nomember_tap").addClass('login_2');
		$('.login_show').css({
			'display':'inline'
		});
		$('.nomember').css({
			'display':'none'
		});
	});
	$("#nomember_tap").click(function(){
		$(this).removeClass('login_2');
		$(this).addClass('login_1');
		$("#login_tap").removeClass('login_1');
		$("#login_tap").addClass('login_2');
		$('.login_show').css({	
			'display':'none'
		});
		$('.nomember').css({
			'display':'inline'
		});
	});
});