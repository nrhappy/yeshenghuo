$(document).ready(function() {
	
	$(function(){
		$("#current-time").text(new Date().toLocaleString());
		setInterval(function(){
			$("#current-time").text(new Date().toLocaleString());   
        },1000);   
    }); 
	
	$("#accordion li").click(function() {
		$("#accordion li").each(function() {
			$(this).removeClass("active");
		});
		$(this).addClass("active");
	});
	
	
	
	$("#accordion").on("show.bs.collapse", function(e) {
		/*currentGlyphicon = e.find("span");
			if (currentGlyphicon.hasClass("glyphicon-chevron-left")) {
				currentGlyphicon.removeClass("glyphicon-chevron-left");
				currentGlyphicon.addClass("glyphicon-chevron-down");
			} else {
				currentGlyphicon.removeClass("glyphicon-chevron-down");
				currentGlyphicon.addClass("glyphicon-chevron-left");
			}*/
	});
	
/*	$("#accordion .panel-title a").click(function() {
		var currentGlyphicon = $(this).find("span");
		var currentGlyphiconAll = $("#accordion .panel-title a span");
			if (currentGlyphicon.hasClass("glyphicon-chevron-left")) {
				currentGlyphicon.removeClass("glyphicon-chevron-left");
				currentGlyphicon.addClass("glyphicon-chevron-down");
			} else {
				currentGlyphicon.removeClass("glyphicon-chevron-down");
				currentGlyphicon.addClass("glyphicon-chevron-left");
			}
	});*/
	
})