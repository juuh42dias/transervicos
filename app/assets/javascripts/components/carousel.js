$(document).ready(function () {
  $('.carousel .control i').on('click', function () {
    var m = $(this).data('m'), $container = $(this).closest('.carousel').find('.carousel-container');

    $container.children('.carousel-element').hide().filter('[data-m="'+m+'"]').show();
    $(this).parent().children('i').removeClass('active');
    $(this).addClass('active');
  });
});
