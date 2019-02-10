(function($, window, document) {
  'use strict';

  $(function() {

    var updateOwnerData = function() {
      if ($('#owner-check input:checked').val() == 'recomendacao') {
        $('#dados-recomendacao').show();
        $('#service_owner_name').prop('required',true);
      }
      else {
        $('#dados-recomendacao').hide();
        $('#service_owner_name').prop('required',false);
      }
    }

    var ready = function(){
      if( $('#owner-check').data('is-owner') == true ) {
        $('#prestador2').prop('checked', true);
      } else {
        $('#prestador1').prop('checked', true);
      }

      $('[name="prestador"]').on('change', updateOwnerData);

      updateOwnerData();
    };

    $(document).ready(ready);
  });

}(window.jQuery, window, document));

