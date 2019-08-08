$(document).ready(function(){

	$('#btn-menu').click(function(){

		if( $('.btn-menu span').attr('class') == 'fa fa-bars' ){

			$('.btn-menu span').removeClass('fa fa-bars').addClass('fa fa-close').css({'color':'#fff'});
			$('.full-menu').css({'left':'0'});

		}else{
			$('.btn-menu span').removeClass('fa fa-close').addClass('fa fa-bars').css({'color':'#000'});
			$('.full-menu').css({'left':'-100%'});
		}

	});

});





