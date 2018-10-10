(function (window, document, $, WOW, PRO) {
  PRO.onready = function () {
    (new WOW({offset: 0})).init()
    $('a.is-active, .is-active > a, a.active, .active > a').deactive()
    $
      .proBase64()
      .proMailTo()
      .proW3C()
      .proYandexMetrika()
      .proScrollTo()
    PRO
      .submit()
      .redactor()
    $(window).scroll(PRO.scroll)
    return this
  }

  PRO.onload = function () {
    $('[data-click]').each(function () {
      this.on('click', this.dataset.click)
    })
    $
      .proLazyLoad()
      .proLightBox()
      .proYandexMap()
    PRO
      .bgswitcher()
      .carousel()
    // $('.pro-header--home').proCanvaSnow()
    $('.pro-header--grid').proCanvaGrid()
    $('[data-tooltip]').tooltip({
      placement: function (i, element) {
        return element.dataset.tooltip || 'auto'
      }
    })
    var objs = $('.navbar-toggler, .navbar-collapse')
    var scrollbarWidth = `${window.innerWidth - $(document.body).width()}px`
    $.PROlightBox
      .on('open', () => objs.css({marginRight: scrollbarWidth}))
      .on('close', () => objs.css({marginRight: ''}))
    $('.pro-navbar').addClass('h-gradient--top')
    return this
  }
})(window, document, $, WOW, PRO)
