// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
//= require jasny-bootstrap.min
//= require components/application

(function($, window, document) {
  'use strict';

  $(function() {
    $('select[data-option-dependent=true]').each(function () {
      var _this = $(this);
      var subareaSelectId = _this.attr('id');
      var areaSelectId = _this.data('option-observed');
      var optionsDocumentUrl = _this.data('option-url');
      var optionValue = _this.data('option-key-method');
      var optionText = _this.data('option-value-method');
      var subareaDefaultOption = _this.has('option[value=\'\']').size() ? _this.find('option[value=\'\']') : $('<option value=\'\'>').text('Selecione uma subárea');
      var subareaElement = $('select#' + subareaSelectId);
      var areaElement = $('#' + areaSelectId);

      if (!subareaElement.val() && areaElement.size() > 1) {
        subareaElement.attr('disabled', true);
      }

      areaElement.on('change', function() {
        var regexp = /:[0-9a-zA-Z_]+:/g;
        subareaElement.empty().append(subareaDefaultOption);
        if (areaElement.val()) {
          var url = optionsDocumentUrl.replace(regexp, areaElement.val());
          $.getJSON(url, function(data) {
            subareaElement.append(buildOptions(data, optionValue, optionText));
            subareaElement.attr('disabled', false);
          });
        }
      });
    });

    var buildOptions = function(collection, valueAttr, textAttr) {
      var options = [];
      $.each(collection, function(index, object) {
        options.push($('<option/>').val(object[valueAttr]).text(object[textAttr]));
      });
      return options;
    };

    var loadCitiesForState = function(){
      var stateId = $('#state-selector').find("option:selected").val();
      var citySelector = $('#city-selector');
      if (stateId === '') {
        citySelector.attr('disabled', true);
      } else {
        if (stateId === undefined) return;

        var url = '/state/' + stateId;
        $.getJSON(url, function(data) {
          citySelector.html($('<option/>').val('').text('Selecione uma cidade'));
          citySelector.append(buildOptions(data['cities'], 'id', 'name'));
          citySelector.removeAttr('disabled');
        }).done(function(){
            var cityId = citySelector.data('selected-city');
            if (cityId) {
                citySelector.find('option[value=' + cityId + ']').attr('selected','selected');
            }
        });
      }
    };

    $("#search-form").bind("reset", function() {
      $('#search-description').val('');
      $('#state-selector').val('');
      var citySelector = $('#city-selector');
      citySelector.val('');
      var cityId = citySelector.data('selected-city');
      if(cityId) {
        citySelector.find('option[value=' + cityId + ']').remove('selected');
        citySelector.data('selected-city','','');
      }
      citySelector.attr('disabled', true);
      return false;
    });

    $('#user_phone_number, #service_phone, #service_other_phone').inputmask({
      mask: '(99) 9999?99999'
    });

    if ($('#user_social_name').val() === '') {
      $('#user_name_preference_social').attr('disabled', true);
    }

    if ($('#user_civil_name').val() === '') {
      $('#user_name_preference_civil').attr('disabled', true);
    }

    $('#state-selector').on('change', loadCitiesForState);

    loadCitiesForState();
  });

}(window.jQuery, window, document));
