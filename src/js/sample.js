(function() {
  $(function() {
    return $('a').on('mouseover', function() {
      return $('a').css('color', 'red');
    });
  });

  $(function() {
    return $('a').on('mouseout', function() {
      return $('a').css('color', 'white');
    });
  });

}).call(this);
