$(document).ready(function() {
	$('#user_interests')
	  .focus(function() { $(this).css("background", "none") })
	  .blur(function() { if ($(this)[0].value == '') { $(this).css("background", "url(images/benice.png) center center no-repeat") } })
	});