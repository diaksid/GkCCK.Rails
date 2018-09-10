#  require autosize
#= require_self


$ ->

  $('#utils > a').html '&hellip;'

  $('.has-attachment').each ->
    obj = $ @
    obj.find('.handle').show() unless (obj.find '[type="file"]').length

  # autosize document.querySelectorAll 'textarea.h-autosize'
