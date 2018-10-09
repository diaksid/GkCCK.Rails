(function (window, document, jQuery) {
  const PROcanvaGrid = (function () {
    const CANVAS_RATE = 10
    const CANVAS_CORNERS = 5
    const ANIMATE_DELIMITER = 3

    const Default = {
      display: 'block',
      position: 'absolute',
      zIndex: -1,
      top: 0,
      left: 0
    }

    const distance = function (p1, p2) {
      return Math.pow(p1.x - p2.x, 2) + Math.pow(p1.y - p2.y, 2)
    }

    const $win = jQuery(window)

    class PROcanvaGrid {
      constructor (element, options) {
        this.animated = true
        this.canvas = document.createElement('canvas')
        this.obj = jQuery(element).append(
          jQuery(this.canvas).css(jQuery.extend({},
            Default,
            options
          ))
        )
        this.ctx = this.canvas.getContext('2d')
        this._resize()
        this.target = {
          x: this.canvas.width / 2,
          y: this.canvas.height / 2
        }
        this.points = []
        let step = {
          x: this.canvas.width / CANVAS_RATE / 0.5,
          y: this.canvas.height / CANVAS_RATE / 0.5
        }
        if (this.canvas.width >= 1200) {
          step = {
            x: this.canvas.width / CANVAS_RATE,
            y: this.canvas.height / CANVAS_RATE
          }
        } else if (this.canvas.width >= 768) {
          step = {
            x: this.canvas.width / CANVAS_RATE / 0.75,
            y: this.canvas.height / CANVAS_RATE / 0.75
          }
        }
        let x, y, originX, originY
        for (x = 0; x < this.canvas.width; x += step.x) {
          for (y = 0; y < this.canvas.height; y += step.y) {
            originX = Math.random() * step.x + x
            originY = Math.random() * step.y + y
            this.points.push({
              x: x,
              originX: originX,
              y: y,
              originY: originY
            })
          }
        }
        let placed, i
        this.points.forEach(node => {
          node.closest = []
          this.points
            .filter(point => point !== node)
            .forEach(point => {
              placed = false
              for (i = 0; i < CANVAS_CORNERS; i++) {
                if (!node.closest[i]) {
                  node.closest[i] = point;
                  placed = true
                  break
                }
              }
              if (!placed) {
                for (i = 0; i < CANVAS_CORNERS; i++) {
                  if (distance(node, point) < distance(node, node.closest[i])) {
                    node.closest[i] = point
                    break
                  }
                }
              }
            })
        })
        this.points.forEach(point => {
          point.shape = new Circle(point, Math.random() * 2 + 2)
          point.tween = new Tween(point)
        })
        this
          ._listeners()
          ._animate()
      }

      _listeners () {
        $win
          .on('mousemove', this._mouseMove.bind(this))
          .on('scroll', this._scrollCheck.bind(this))
          .on('resize', this._resize.bind(this))
        return this
      }

      _mouseMove (event) {
        this.target = {
          x: this.canvas.width / 2,
          y: this.canvas.height / 2
        }
        if (event.pageX || event.pageY) {
          this.target = {
            x: event.pageX,
            y: event.pageY
          }
        } else if (event.clientX || event.clientY) {
          this.target = {
            x: e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft,
            y: e.clientY + document.body.scrollTop + document.documentElement.scrollTop
          }
        }
      }

      _scrollCheck () {
        this.animated = $win.scrollTop() < this.canvas.height
      }

      _resize () {
        this.canvas.width = this.obj.innerWidth()
        this.canvas.height = this.obj.innerHeight()
      }

      _animate () {
        this._frame()
        for (let point of this.points) {
          this._shift(point)
        }
      }

      _frame () {
        if (this.animated) {
          this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height)
          for (let point of this.points) {
            let dist = Math.abs(distance(this.target, point))
            if (dist < 4000) {
              point.active = 0.4
              point.shape.active = 0.8
            } else if (dist < 10000) {
              point.active = 0.3
              point.shape.active = 0.6
            } else if (dist < 15000) {
              point.active = 0.2
              point.shape.active = 0.4
            } else if (dist < 20000) {
              point.active = 0.1
              point.shape.active = 0.3
            } else if (dist < 40000) {
              point.active = 0.03
              point.shape.active = 0.1
            } else {
              point.active = 0
              point.shape.active = 0
            }
            if (point.active) {
              for (let close of point.closest) {
                this.ctx.beginPath()
                this.ctx.moveTo(point.x, point.y)
                this.ctx.lineTo(close.x, close.y)
                this.ctx.strokeStyle = `rgba(255, 255, 255, ${point.active})`
                this.ctx.stroke()
              }
            }
            point.shape.draw(this.ctx)
          }
        }
        jQuery.tweens.request(this._frame.bind(this))
      }

      _shift (point) {
        point.tween.animate(
          1 + Math.random(),
          Math.random() * 100 + point.originX - 50,
          Math.random() * 100 + point.originY - 50,
          () => this._shift(point)
        )
      }

      static _jQuery () {
        if (window.ontouchstart) {
          return this
        } else {
          return this.each(function () {
            new PROcanvaGrid(this)
          })
        }
      }
    }

    class Circle {
      constructor (pos, rad) {
        this.pos = pos
        this.rad = rad
      }

      draw (ctx) {
        if (this.active) {
          ctx.beginPath()
          ctx.arc(this.pos.x, this.pos.y, this.rad, 0, Math.PI * 2, false)
          ctx.fillStyle = `rgba(255, 255, 255, ${this.active})`
          ctx.fill()
        }
      }
    }

    class Tween {
      constructor (point) {
        this.point = point
      }

      animate (step, x, y, callback) {
        this.count = 0
        this.step = {
          x: this.point.x < x ? step : -step,
          y: this.point.y < y ? step : -step
        }
        this.x = x
        this.y = y
        this.callback = callback
        this._frame()
      }

      _frame () {
        if (++this.count % ANIMATE_DELIMITER === 0) {
          if (this.step.x && Math.abs(this.x - this.point.x) > Math.abs(this.step.x)) {
            this.point.x += this.step.x
          } else {
            this.step.x = false
          }
          if (this.step.y && Math.abs(this.y - this.point.y) > Math.abs(this.step.y)) {
            this.point.y += this.step.y
          } else {
            this.step.y = false
          }
        }
        if (this.step.x || this.step.y) {
          jQuery.tweens.request(this._frame.bind(this))
        } else {
          this.callback()
        }
      }
    }

    return PROcanvaGrid
  })()

  const NAME = 'proCanvaGrid'
  const JQUERY_NO_CONFLICT = jQuery.fn[NAME]

  jQuery.fn[NAME] = PROcanvaGrid._jQuery
  jQuery.fn[NAME].Constructor = PROcanvaGrid
  jQuery.fn[NAME].noConflict = function () {
    jQuery.fn[NAME] = JQUERY_NO_CONFLICT
    return PROcanvaGrid._jQuery
  }
})(window, document, jQuery)
