#= require ./_helpers
#= require ./_bgswitcher
#= require ./_jcarousel
#= require ./_trumbowyg
#= require ./_events
#= require_self


((window, document, $, ProJ) ->
  turbo = window.Turbolinks?
  Turbolinks.supported = no if turbo and navigator.userAgent.match /Firefox\/(\d+)\./

  $ ->
    ProJ.fn.onready()
    $('.pro-preload').fadeOut 'slow', -> turbo && document.documentElement.classList.add 'is-turbolinks'
  $(window).on 'load', ProJ.fn.onload

  if turbo
    $ document
      .on 'turbolinks:visit', ->
        turbo = 'visit'
      .on 'turbolinks:load', ->
        if turbo is 'visit'
          ProJ.fn
            .onready()
            .onload()
) window, document, jQuery, ProJ
