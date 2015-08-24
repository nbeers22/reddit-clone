$(document).ready(function(){
	showComments();
	hideComments();
})

var showComments = function(){ 
	$('.show-comments,.comment-count').on('click',function(){
		$(this).parent().find('.show-comments').addClass('hide');
		$(this).parent().find('.hide-comments').removeClass('hide');
		$(this).parent().find('#link-comments').show('slow',function(){
			//animation complete
		})
	});
};

var hideComments = function(){
	$('.hide-comments').on('click',function(){
		$(this).addClass('hide');
		$(this).parent().find('.show-comments').removeClass('hide');
		$(this).parent().find('#link-comments').hide('slow',function(){
			//animation complete
		});
	});
};