(function (jQuery) {
  const PROcanvaTube = (function () {
    const LINE_COUNT = 50
    const ANIMATE_DELIMITER = 3

    const Default = {
      display: 'block',
      position: 'absolute',
      zIndex: -1,
      top: 0,
      left: 0
    }

    class PROcanvaTube {
      constructor (element, options) {
        this.animated = true
        this.count = 0
        this.canvas = document.createElement('canvas')
        this.obj = jQuery(element).append(
          jQuery(this.canvas).css(jQuery.extend({},
            Default,
            options
          ))
        )
        this.ctx = this.canvas.getContext('2d')
        this._init()
      }

      _init() {
        this.width = this.canvas.width = this.obj.innerWidth()
        this.height = this.canvas.height = this.obj.innerHeight()
        this._resize()
        this.lines = []
        for (let i = 0; i < LINE_COUNT; i++) {
          this.lines.push(new Line(this.width, this.height))
        }
        this
          ._listeners()
          ._animate()
      }

      _listeners () {
        window.addEventListener('resize', this._resize.bind(this));
        return this
      }

      _resize() {
        this.width = this.canvas.width = this.obj.innerWidth()
        this.height = this.canvas.height = this.obj.innerHeight()
        // this.ctx.fillStyle = 'rgba(50, 50, 50, 1)'
        // this.ctx.fillRect(0, 0, this.width, this.height)
        return this
      }

      _animate() {
        if (this.animated && ++this.count % ANIMATE_DELIMITER === 0) {
          this._draw()
        }
        jQuery.tweens.request(this._animate.bind(this))
      }

      _draw() {
        // this.ctx.fillStyle = 'rgba(50, 50, 50, 0.025)';
        // this.ctx.fillRect(0, 0, this.width, this.height);
        for (let i = 0; i < this.lines.length; i++) {
          let l = this.lines[i]
          let a = ~~(Math.random() * 4) * 90
          let lL = Math.random() * 15 + 5
          this.ctx.lineWidth = l.width
          this.ctx.strokeStyle = l.color
          this.ctx.beginPath()
          this.ctx.moveTo(l.location.x, l.location.y)
          switch(a) {
            case 0:
              l.location.y -= lL;
              break
            case 90:
              l.location.x += lL;
              break
            case 180:
              l.location.y += lL;
              break
            case 270:
              l.location.x -= lL;
              break
            default:
              break
          }
          this.ctx.lineTo(l.location.x, l.location.y)
          if (l.location.x < 0 || l.location.x > this.width) {
            l.location.x = Math.random() * this.width
          }
          if (l.location.y < 0 || l.location.y > this.height) {
            l.location.y = Math.random() * this.height
          }
          this.ctx.stroke()
        }
      }

      static _jQuery () {
        return this.each(function () {
          new PROcanvaTube(this)
        })
      }
    }

    class Line {
      constructor (width, height) {
        this.location = {
          x: Math.random() * width,
          y: Math.random() * height
        }
        this.width = Math.random() + 0.25
        this.color = 'hsla('+~~(Math.random() * 360)+', 100%, 75%, 0.90)'
      }
    }

    return PROcanvaTube
  })()

  const NAME = 'proCanvaTube'
  const JQUERY_NO_CONFLICT = jQuery.fn[NAME]

  jQuery.fn[NAME] = PROcanvaTube._jQuery
  jQuery.fn[NAME].Constructor = PROcanvaTube
  jQuery.fn[NAME].noConflict = function () {
    jQuery.fn[NAME] = JQUERY_NO_CONFLICT
    return PROcanvaTube._jQuery
  }
})(jQuery)
