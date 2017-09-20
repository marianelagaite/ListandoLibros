$(document).on('turbolinks:load',function(){
	$('.datepicker').datepicker();
	$('[data-toggle="tooltip"]').tooltip();

	$('.average-review-rating').raty({
		readOnly: true,
		path: '/assets/',
		score: function() {
		  return $(this).attr('data-score')
		}
	});

	$('#star-rating').raty({
	  path: '/assets/',
	  scoreName: 'review[rating]'
	});

	$(".review-rating").raty({
		readOnly: true,
		score: function(){
		  return $(this).attr('data-score');
		},
		path: '/assets/',
	});

})
	