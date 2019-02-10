var setMessageAndClass = function(element, message, clazz) {
  element.html(message);
  var actualClazz = element.attr("class");
  element.removeClass(actualClazz);
  element.addClass(clazz);
};
