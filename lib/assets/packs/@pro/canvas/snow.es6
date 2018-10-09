(function (window, jQuery) {
  const PROcanvaSnow = (function () {
    const CANVAS_RATE = 4
    const ANIMATE_DELIMITER = 3

    const Default = {
      display: 'block',
      position: 'absolute',
      zIndex: -1,
      top: 0,
      left: 0
    }

    const $win = jQuery(window)

    class PROcanvaSnow {
      constructor (element, options) {
        this.animated = true
        this.count = this.angle = 0
        this.canvas = document.createElement('canvas')
        this.obj = jQuery(element).append(
          jQuery(this.canvas).css(jQuery.extend({},
            Default,
            options
          ))
        )
        this.ctx = this.canvas.getContext('2d')
        this._resize()
        const maxp = Math.round(this.canvas.width / CANVAS_RATE)
        this.points = []
        for (let i = 0; i < maxp; i++) {
          this.points.push({
            x: Math.random() * this.canvas.width,
            y: Math.random() * this.canvas.height,
            opacity: Math.random() * 4 + 1,
            radius: Math.random() + 1,
            d: Math.random() * maxp
          })
        }
        this
          ._listeners()
          ._animate()
      }

      _listeners () {
        $win
          .on('scroll', this._scrollCheck.bind(this))
          .on('resize', this._resize.bind(this))
        return this
      }

      _scrollCheck () {
        this.animated = $win.scrollTop() < this.canvas.height
      }

      _resize () {
        this.canvas.width = this.obj.innerWidth()
        this.canvas.height = this.obj.innerHeight()
      }

      _animate () {
        if (this.animated && ++this.count % ANIMATE_DELIMITER === 0) {
          this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height)
          this.points.forEach(point => {
            this.ctx.beginPath()
            this.ctx.fillStyle = `rgba(240, 255, 255, ${point.opacity / 10})`
            this.ctx.moveTo(point.x, point.y)
            this.ctx.arc(point.x, point.y, point.radius, 0, Math.PI * 2, true)
            this.ctx.fill()
          })
          this._update()
        }
        jQuery.tweens.request(this._animate.bind(this))
      }

      _update () {
        this.angle += 0.01
        this.points.forEach((point, idx) => {
          point.y += Math.cos(this.angle + point.d) + 1 + point.radius / 2
          point.x += Math.sin(this.angle) * 2
          if (point.x > this.canvas.width + 5 || point.x < -5 || point.y > this.canvas.height) {
            if (idx % 3 > 0) {
              point.x = Math.random() * this.canvas.width
              point.y = -10
            } else {
              point.x = Math.sin(this.angle) > 0 ? -5 : this.canvas.width + 5
              point.y = Math.random() * this.canvas.height
            }
          }
          if (this.count % 9 === 0) {
            point.opacity = Math.random() * 4 + 1
          }
        })
      }

      static _jQuery () {
        return this.each(function () {
          new PROcanvaSnow(this)
        })
      }
    }

    return PROcanvaSnow
  })()

  const NAME = 'proCanvaSnow'
  const JQUERY_NO_CONFLICT = jQuery.fn[NAME]

  jQuery.fn[NAME] = PROcanvaSnow._jQuery
  jQuery.fn[NAME].Constructor = PROcanvaSnow
  jQuery.fn[NAME].noConflict = function () {
    jQuery.fn[NAME] = JQUERY_NO_CONFLICT
    return PROcanvaSnow._jQuery
  }
})(window, jQuery)
