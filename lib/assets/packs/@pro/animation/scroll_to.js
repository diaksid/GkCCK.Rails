import jQuery from 'jquery'
import '../helpers/dataset'

const PROscrollTo = (function (jQuery) {
  const NAME = 'scrollTo'
  const VERSION = '0.0.1'

  const DATA_KEY = 'scroll.to'
  // const EVENT_KEY = `${DATA_KEY}.`
  const JQUERY_NO_CONFLICT = jQuery.fn[NAME]

  const Default = {
    offset: 0,
    duration: 1000
  }

  class PROscrollTo {
    constructor (options, callback) {
      [this._options, this._callback] = arguments
    }

    _load (element) {
      const selector = jQuery.data.getSet(element, DATA_KEY) || element.getAttribute('href')
      if (selector) {
        const options = jQuery.extend({},
          this._options,
          jQuery.data.getSet(element, DATA_KEY, ...Object.keys(Default))
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

    static _config (options, callback) {
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

  // jQuery.ScrollTo = PROscrollTo

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

  return PROscrollTo
})(jQuery)

export default PROscrollTo
