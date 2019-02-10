(function($, window, document) {

  var ready = function(){
    if ($('#infinite-scrolling').size() > 0) {
        $(window).scroll(function(){
          var more_posts_url = $('.pagination a[rel=next]').attr('href');
          if (more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 350){
              $('.pagination').html("");
              var elem = $('<div class="text-center">Carregando...</div>');
              $("#posts").append(elem);
              $.ajax(more_posts_url, {
                  method: 'GET',
                  success: function(data) {
                    elem.remove();
                    $("#posts").append(data);
                    var pageNumber = $('.pagination .active').text();
                    configureLikeDislike($('#posts-'+pageNumber))
                  }
              });
          } else if (!more_posts_url) {
              $('.pagination').remove();
          }
        return;
      });
      }
  }

  $(document).ready(ready);
}(window.jQuery, window, document));
