$(document).ready(function(){
	showComments();
	hideComments();
})

var showComments = function(){ 
	$('.show-comments,.comment-count').on('click',function(){
		$('.show-comments').addClass('hide');
		$('.hide-comments').removeClass('hide');
		$('#link-comments').show('slow',function(){
			//animation complete
		})
	});
};

var hideComments = function(){
	$('.hide-comments').on('click',function(){
		$('.hide-comments').addClass('hide');
		$('.show-comments').removeClass('hide');
		$('#link-comments').hide('slow',function(){
			//animation complete
		});
	});
};