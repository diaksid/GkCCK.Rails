(function (window, jQuery) {
  const PROyandexMap = (function () {
    const VERSION = '0.0.1'

    const DATA_KEY = 'pro.yandex.map'

    const Default = {
      selector: `.${jQuery.data.toKey(DATA_KEY)}`,
      zoom: 14,
      type: 'yandex#map',
      behaviors: ['default'],
      controls: ['default'],
      preset: 'islands#redDotIcon'
    }

    class PROyandexMap {
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
        if (!jQuery.data.getSet(element, DATA_KEY)) {
          const fn = () => ymaps.ready(() => this._ymap(element))
          if (window.ymaps) {
            fn()
          } else {
            jQuery.script(`//api-maps.yandex.ru/2.1/?lang=${this._options.locale || 'ru_RU'}`, fn)
          }
          jQuery.data.setSet(element, DATA_KEY, 'loaded')
        }
        return this
      }

      _ymap (el) {
        const fn = (name, separator = ' ') => {
          const data = el.dataset[name]
          if (data === '') {
            return []
          } else if (data && separator) {
            return data.split(separator)
          } else {
            return data || this._options[name]
          }
        }
        const fz = () => {
          let value = parseInt(el.dataset.zoom || this._options.zoom)
          switch (true) {
            case window.innerWidth >= 768:
              value += 2
              break
            case window.innerWidth >= 480:
              value += 1
          }
          return value
        }
        if (!el.querySelector('ymaps')) {
          const map = new ymaps.Map(el, {
            type: fn('type'),
            center: fn('center'),
            zoom: fz(),
            behaviors: fn('behaviors'),
            controls: fn('controls')
          })
          map.geoObjects.add(new ymaps.Placemark(fn('placemark'), {
            iconContent: null,
            balloonContent: `<h6>${fn('name', null)}</h6><div>${fn('info', null)}</div>`
          }, {
            preset: fn('preset'),
            draggable: false,
            hideIconOnBalloonOpen: false
          }))
          el.addEventListener('resize', () => {
            if (map.container) {
              map.container.fitToViewport()
            }
          })
        }
      }

      static get name () {
        return NAME
      }

      static get version () {
        return VERSION
      }

      static get default () {
        return Default
      }

      static _jQuery () {
        (() => new PROyandexMap(this, ...arguments))()
        return this
      }
    }

    return PROyandexMap
  })()

  const NAME = 'proYandexMap'
  const JQUERY_NO_CONFLICT = jQuery.fn[NAME]

  jQuery.fn[NAME] = PROyandexMap._jQuery
  jQuery.fn[NAME].Constructor = PROyandexMap
  jQuery.fn[NAME].noConflict = function () {
    jQuery.fn[NAME] = JQUERY_NO_CONFLICT
    return PROyandexMap._jQuery
  }

  jQuery[NAME] = function () {
    (() => new PROyandexMap(...arguments))()
    return this
  }
})(window, jQuery)
