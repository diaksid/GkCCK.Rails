(function (jQuery) {
  const PROjCarousel = (function () {
    const VERSION = '0.0.1'

    const DATA_KEY = 'pro.jcarousel'

    const Default = {
      selector: `[data-${jQuery.data.toKey(DATA_KEY)}]`,
      lazy: 'src',
      wrap: 'circular',
      center: false,
      duration: 700,
      easing: 'easeOutSine',
      autoscroll: 5000,
      autostart: true,
      control: true,
      pagination: true,
      margin: 0,
      numbs: {
        0: 2,
        576: 3,
        768: 4,
        992: 5,
        1280: 6,
        1440: 7
      }
    }

    class PROjCarousel {
      constructor (selector, options) {
        if (jQuery.isPlainObject(selector)) {
          options = selector
          selector = null
        }
        this._options = jQuery.extend({},
          Default,
          options
        )
        jQuery(selector || this._options.selector).each((i, element) => this._load(element))
      }

      _load (element) {
        this._scope = jQuery(element)
        const options = this._options
        const outer = this._scope.find('.outer')
          .on('jcarousel:reload jcarousel:create', function () {
            var obj = jQuery(this)
            var width = obj.innerWidth()
            var numb = 1
            for (var max in options.numbs) {
              if (max < width) {
                numb = options.numbs[max]
              } else {
                break
              }
            }
            obj.jcarousel('items').css({ width: `${Math.ceil(width / numb - options.margin)}px` })
            obj.css({ visibility: 'visible' })
          })
          .jcarousel({
            wrap: options.wrap,
            center: options.center,
            animation: {
              duration: options.duration,
              easing: options.easing
            }
          })
        if (options.autoscroll) {
          outer.jcarouselAutoscroll({
            interval: options.autoscroll,
            autostart: options.autostart,
            target: '+=1'
          })
        }
        this._lazyload()
        this._control()
      }

      _lazyload () {
        jQuery.proLazyLoad(this._scope.find(`[data-${this._options.lazy}]`), {
          scope: this._scope,
          attribute: this._options.lazy,
          event: 'jcarousel:animateend'
        })
        return this
      }

      _control () {
        const ctrl = this._scope.find('.control')
        if (ctrl.length) {
          let obj = jQuery('<div>').addClass('prev icon')
          ctrl.append(obj)
          obj.jcarouselControl({ target: '-=1' })
          obj = jQuery('<div>').addClass('next icon')
          ctrl.append(obj)
          obj.jcarouselControl({ target: '+=1' })
          ctrl.find('.pagination')
            .jcarouselPagination({
              item: function (page) {
                return jQuery('<div>').addClass(`icon${page === '1' ? ' active' : ''}`)
              }
            })
            .on('jcarouselpagination:active', '.icon', function () {
              jQuery(this).addClass('active')
            })
            .on('jcarouselpagination:inactive', '.icon', function () {
              jQuery(this).removeClass('active')
            })
        }
        return this
      }

      static get version () {
        return VERSION
      }

      static get default () {
        return Default
      }

      static _jQuery () {
        (() => new PROjCarousel(this, ...arguments))()
        return this
      }
    }

    return PROjCarousel
  })()

  jQuery.PROjCarousel = PROjCarousel

  const NAME = 'proJcarousel'
  const JQUERY_NO_CONFLICT = jQuery.fn[NAME]

  jQuery.fn[NAME] = PROjCarousel._jQuery
  jQuery.fn[NAME].Constructor = PROjCarousel
  jQuery.fn[NAME].noConflict = function () {
    jQuery.fn[NAME] = JQUERY_NO_CONFLICT
    return PROjCarousel._jQuery
  }

  jQuery[NAME] = function () {
    (() => new PROjCarousel(...arguments))()
    return this
  }
})(jQuery)
