(function (window, document, $, WOW, PRO) {
  PRO.onload = function () {
    $('[data-click]').each(function () {
      this.on('click', this.dataset.click)
    })
    $
      .lazyload()
      .lightbox()
      .yandexMap('.c-yandex-map')
    PRO
      .bgswitcher()
      .carousel()
    $('.pro-header--home').canvaSnow()
    $('.pro-header--grid').canvaGrid()
    $('[data-tooltip]').tooltip({
      placement: function (i, element) {
        return element.dataset.tooltip || 'auto'
      }
    })
    $('.pro-navbar').addClass('h-gradient--top')
    return this
  }

  PRO.onready = function () {
    (new WOW({offset: 0})).init()
    $('a.is-active, .is-active > a, a.active, .active > a').deactive()
    $
      .base64()
      .mailto()
      .w3c()
      .scrollTo()
      .yandexMap()
    PRO
      .submit()
      .redactor()
    $(window).scroll(PRO.scroll)
    return this
  }
})(window, document, $, WOW, PRO)
