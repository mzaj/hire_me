(function($) {

  $('#step').on('click', '.answer', function(e) {
    $('#step .answer').removeClass('chosen').addClass('inactive');
    $(this).removeClass('inactive').addClass('chosen');
  });

})(jQuery);
