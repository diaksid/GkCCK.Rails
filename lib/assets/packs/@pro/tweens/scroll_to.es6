(function (jQuery) {
  const PROscrollTo = (function () {
    const VERSION = '0.0.1'

    const DATA_KEY = 'scroll.to'

    const Default = {
      selector: `[data-${jQuery.data.toKey(DATA_KEY)}]`,
      offset: 0,
      duration: 1000
    }

    class PROscrollTo {
      constructor (selector, options, callback) {
        if (typeof selector === 'function') {
          callback = selector
          selector = null
        } else if (jQuery.isPlainObject(selector) || typeof selector === 'number') {
          options = selector
          selector = null
        }
        [this._options, this._callback] = PROscrollTo._config(options, callback)
        jQuery(selector || Default.selector).each((i, element) => this._load(element))
      }

      _load (element) {
        const selector = jQuery.data.getSet(element, DATA_KEY) || element.getAttribute('href')
        if (selector) {
          const options = jQuery.extend({},
            this._options,
            jQuery.data.getSet(element, DATA_KEY, 'offset', 'duration')
          )
          const obj = jQuery(element).click(event => {
            event.preventDefault()
            event.stopPropagation()
            if (!obj.hasClass('active') && !obj.parent().hasClass('active')) {
              selector === '#'
                ? PROscrollTo.top(options, this._callback)
                : PROscrollTo.obj(selector, options, this._callback)
            }
          })
        } else {
          delete element.dataset[DATA_KEY]
        }
      }

      static top () {
        const [options, callback] = this._config(...arguments)
        this._scrolled.animate({
          scrollTop: parseInt(options.offset)
        }, parseInt(options.duration), callback)
        return this
      }

      static obj (selector, ...args) {
        const [options, callback] = this._config(...args)
        const obj = selector instanceof jQuery ? selector : jQuery(selector)
        this._scrolled.animate({
          scrollTop: obj.offset().top - parseInt(options.offset)
        }, parseInt(options.duration), callback)
        return this
      }

      static _config (options = {}, callback = null) {
        if (typeof options === 'function') {
          callback = options
          options = {}
        }
        if (typeof options === 'number') {
          options = { offset: options }
        }
        return [
          jQuery.extend({}, Default, options),
          typeof callback === 'function' ? callback : null
        ]
      }

      static get _scrolled () {
        return jQuery('html:not(:animated), body:not(:animated)')
      }

      static get version () {
        return VERSION
      }

      static get default () {
        return Default
      }

      static _jQuery () {
        const instance = new PROscrollTo(...arguments)
        return this.each(function () {
          instance._load(this)
        })
      }
    }

    return PROscrollTo
  })()

  const NAME = 'proScrollTo'
  const JQUERY_NO_CONFLICT = jQuery.fn[NAME]

  jQuery.fn[NAME] = PROscrollTo._jQuery
  jQuery.fn[NAME].Constructor = PROscrollTo
  jQuery.fn[NAME].noConflict = function () {
    jQuery.fn[NAME] = JQUERY_NO_CONFLICT
    return PROscrollTo._jQuery
  }

  jQuery[NAME] = function () {
    (() => new PROscrollTo(...arguments))()
    return this
  }
})(jQuery)
