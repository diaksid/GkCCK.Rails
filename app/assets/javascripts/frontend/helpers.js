(function ($) {
  var SCROLL_TOP_MARGIN = 96

  window.PRO = {
    submit: function () {
      $('[data-submit]').on('change', function () {
        if (this.dataset.submit) {
          document.querySelector(this.dataset.submit).submit()
        } else {
          this.parentNode.submit()
        }
      })
      return this
    },

    scroll: function () {
      if (screen.width > 767) {
        var $navbar = $('.pro-navbar')
        var cls = 'pro-navbar--fixed'
        var fix = $navbar.find('.collapse')
        fix = fix.hasClass('collapsing') || fix.hasClass('in')
        if ($(window).scrollTop() > SCROLL_TOP_MARGIN) {
          if (!$navbar.hasClass(cls)) {
            if (fix) {
              $navbar.addClass(cls)
            } else {
              $navbar.hide(function () {
                $navbar
                  .addClass(cls)
                  .slideDown(200)
              })
            }
          }
        } else {
          if ($navbar.hasClass(cls)) {
            $navbar.removeClass(cls)
          } else {
            $navbar.slideUp(200, function () {
              $navbar
                .removeClass(cls)
                .fadeIn(500)
            })
          }
        }
      }
      return this
    }
  }
})($)
