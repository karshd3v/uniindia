// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require modernizr
//= require dd
//= require angular
//= require masonry
//= require_tree 


$(function(){
	var link 	=	$("#userLink");
	var links 	=	$("#userLinks");
	links.width(link.innerWidth());
	link.click(function(e){
		e.preventDefault();
		link.toggleClass("active");
		links.slideToggle();
	});
});

$(function(){
	var voteTrigger 	=	$("#vote");
	var requestId 		=	voteTrigger.data("post-id");
	var message;
	voteTrigger.click(function(e){
		e.preventDefault();
		var $this = $(this);
		$.ajax({
			url: "/request/" + requestId + "/vote",
			type: "post",
			success: function(data){
				console.log(data);
				$("#errorMessageHook").html(data.toString());
				$("#flashMessage").slideDown();
				$this.html("Voted");
				$this.removeClass("button-idle");
				$this.addClass("button-done");
				$this.attr("disabled","disabled");
			}
		});
	});
	$("#close").click(function(){$("#flashMessage").slideUp()});
});

$(function(){
	var voteTrigger 	=	$("#interest");
	var requestId 		=	voteTrigger.data("post-id");
	var message;
	voteTrigger.click(function(e){
		e.preventDefault();
		var $this = $(this);
		$.ajax({
			url: "/request/" + requestId + "/interest",
			type: "post",
			success: function(data){
				console.log(data);
				$("#errorMessageHook").html(data.toString());
				$("#flashMessage").slideDown();
				$this.html("Added to interest");
				$this.removeClass("button-idle");
				$this.addClass("button-done");
				$this.attr("disabled","disabled");
			}
		});
	});
	$("#close").click(function(){$("#flashMessage").slideUp()});
});

$(function(){
	var voteTrigger 	=	$("#archive");
	var requestId 		=	voteTrigger.data("post-id");
	var message;
	voteTrigger.click(function(e){
		e.preventDefault();
		var $this = $(this);
		$.ajax({
			url: "/request/" + requestId + "/archive",
			type: "post",
			success: function(data){
				console.log(data);
				$("#errorMessageHook").html(data[0].message);
				$("#flashMessage").slideDown();
				$this.html("Archived");
				$this.removeClass("button-idle");
				$this.addClass("button-done");
				$this.attr("disabled","disabled");
				setTimeout(function(){window.location.href = data[0].redirect},2000);
			}
		});
	});
	$("#close").click(function(){$("#flashMessage").slideUp()});
});

$(function(){
	var voteTrigger 	=	$("#unarchive");
	var requestId 		=	voteTrigger.data("post-id");
	var message;
	voteTrigger.click(function(e){
		e.preventDefault();
		var $this = $(this);
		$.ajax({
			url: "/request/" + requestId + "/unarchive",
			type: "post",
			success: function(data){
				console.log(data);
				$("#errorMessageHook").html(data[0].message);
				$("#flashMessage").slideDown();
				$this.html("Unarchived");
				$this.removeClass("button-idle");
				$this.addClass("button-done");
				$this.attr("disabled","disabled");
				setTimeout(function(){window.location.href = data[0].redirect},2000);
			}
		});
	});
	$("#close").click(function(){$("#flashMessage").slideUp()});
});