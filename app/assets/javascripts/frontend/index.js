//= require ./helpers
//= require ./bgswitcher
//= require ./trumbowyg
//= require ./jcarousel
//= require ./events
//= require_self

(function (window, document, $, PRO) {
  var turbo = !!window.Turbolinks
  if (turbo && /Firefox\/(\d+)\./.test(navigator.userAgent)) {
    Turbolinks.supported = false
  }

  $(function () {
    PRO.onready()
    $('.pro-preload').fadeOut('slow', function () {
      turbo && document.documentElement.classList.add('is-turbolinks')
    })
    $(window).on('load', PRO.onload)
  })

  if (turbo) {
    $(document)
      .on('turbolinks:visit', function () {
        turbo = 'visit'
      })
      .on('turbolinks:load', function () {
        if (turbo === 'visit') {
          PRO
            .onready()
            .onload()
        }
      })
  }
})(window, document, $, PRO)
