$(document).ready(function() {
	var top_html = '';
	var bottom_html = '';

	$('.smartbar_template').each(function(index, element) {
		var position = $(element).attr('data-position');

		switch (position) {
			case 'top' :
				top_html += $(element).html();
				break;
			case 'bottom' :				
				bottom_html += $(element).html();
				break;
			case 'both' :
				top_html += $(element).html();
				bottom_html += $(element).html();
				break;
		}
 	});
	
	$('body').prepend(top_html);
	$('body').append(bottom_html);

	$('.smartbar_template').each(function(index, element) {
		var effect = $(element).attr('data-effect');
		var this_class = ".smartbar_" + $(element).find('.smartbar_wrapper').first().attr('id');

		switch (effect) {
			case 'appear' :
				$(this_class).show();
				break;
			case 'slide_down' :
				$(this_class).slideDown('slow');
				break;
			case 'fade_in' :
				$(this_class).fadeIn('slow');
				break;
		}
 	});
});