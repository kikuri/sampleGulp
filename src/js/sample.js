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

  $(function() {
    return $('.small').on('mouseover', function() {
      return $('.small').css('font-family', 'monospace');
    });
  });

  $(function() {
    return $('.small').on('mouseout', function() {
      return $('.small').css('font-family', 'cursive');
    });
  });

  $(function() {
    if ($('#siteID'.length)) {
      $('#siteID').on('mouseover', function() {});
      return $('#siteID').css('font-family', 'monospace');
    } else {
      $('#siteID').on('mouseout', function() {});
      return $('#siteID').css('font-family', 'serif');
    }
  });

}).call(this);
