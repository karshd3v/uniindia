$( function() {
			
	$( '#cd-dropdown' ).dropdown( {
		gutter : 5
	} );
	$( '#cd-dropdown2' ).dropdown( {
		gutter : 5
	} );
	$( '#cd-dropdown3' ).dropdown( {
		gutter : 5
	} );
	$( '#cd-dropdown4' ).dropdown( {
		gutter : 5
	} );

});


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