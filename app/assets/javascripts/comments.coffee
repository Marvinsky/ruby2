# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "ajax:success", "form#comments-form", (ev, data)->
	$(this).find("textarea").val("");
	console.log data
	article = "<article>"+
					"<header class='text-right be-small'>"+
						"<span id='timeago'> time ago</span> - "+
						"<span id='removeComment' class='red'>Remove</span>"+
					"</header>"+
					"<div class='row'>"+
						"<div class='col-xs-1 col-md-1'>"+
							"<div class='box'>"+
								"<span id='img_tag'></span>"+
							"</div>"+
						"</div>"+
						"<div class='col-xs-11 col-md-10'>"+
							"<div class='box'>"+
								"#{data.body} - #{data.user.email}"+
							"</div>"+
						"</div>"+
					"</div>"+
				"</article>";
	$(article).appendTo($( "#container"));


