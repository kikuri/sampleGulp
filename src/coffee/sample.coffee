$ ->
  $('a').on 'mouseover', ->
    $('a').css('color', 'red')
$ ->
  $('a').on 'mouseout', ->
    $('a').css('color', 'white')
$ ->
  $('.small').on 'mouseover', ->
    $('.small').css('font-family', 'monospace')
$ ->
  $('.small').on 'mouseout', ->
    $('.small').css('font-family', 'cursive')

$ ->
  if $ '#siteID' .length
    $('#siteID').on 'mouseover', ->
    $('#siteID').css('font-family', 'monospace')
  else
    $('#siteID').on 'mouseout', ->
    $('#siteID').css('font-family', 'serif')