(function (window, document, jQuery) {
  const PROcanvaFrame = (function () {
    const ratio = value => {
      return value * window.devicePixelRatio
    }

    const Default = {
      retina: false,
      canvas: {
        display: 'block',
        position: 'absolute',
        zIndex: 0,
        top: 0,
        left: 0,
        width: '100%',
        height: '100%'
      },
      tweens: {
        interactiv: true,
        scope: 'canvas',
        mode: 'grab',
        shape: 'circle',
        color: {
          val: '#fff',
          random: false
        },
        opacity: {
          val: 1,
          anim: {
            enable: true,
            speed: 2,
            transparent: 0,
            sync: false
          }
        },
        size: {
          val: 4,
          random: true
        },
        linked: {
          auto: true,
          distance: 120,
          color: {
            val: '#fff'
          },
          opacity: 0.8,
          width: 1,
          condensed: {
            enable: false,
            rotateX: 600,
            rotateY: 600
          }
        },
        anim: {
          enable: true,
          speed: 1
        },
        mouse: {
          distance: 200
        },
        events: {
          onclick: {
            enable: true,
            mode: 'push',
            numb: 4
          },
          onresize: {
            enable: true,
            mode: 'bounce',
            density: {
              auto: true,
              area: 800
            }
          }
        }
      }
    }

    class PROcanvaFrame {
      constructor (element, options) {
        this._options = jQuery.extend({},
          Default,
          options
        )
        this._retina = this._options.retina && window.devicePixelRatio > 1
          ? window.devicePixelRatio
          : 1
        this._options.mouse.distance *= this._retina
        this._canvas = new Canvas(element, this._options.canvas, this._retina)
        this._tweens = new Tweens(this._canvas, this._options.tweens, this._retina)
      }

      _launch () {
        this.canvas
          .resize()
          .paint()
        this.tweens
          .create()
          .draw()
          .density()
      }

      _animation () {
        this.tweens.draw()
        this._request = jQuery.tweens.request(this._animation.bind(this))
      }

      _destroy () {
        jQuery.tweens.cancel(this._request)
        this.tweens.remove()
        this.canvas.remove()
        delete this
      }

      static _jQuery () {
        if (window.ontouchstart) {
          return this
        } else {
          return this.each(function () {
            new PROcanvaFrame(this)
          })
        }
      }
    }

    class Canvas {
      constructor (element, options, retina) {
        this.element = document.createElement('canvas')
        jQuery(element).append(
          jQuery(this.element).css(options)
        )
        this._retina = retina
        this.resize()
      }

      resize () {
        this.width = this.element.offsetWidth * this._retina
        this.height = this.element.offsetHeight * this._retina
        return this
      }

      paint () {
        this.ctx.fillRect(0, 0, this.width, this.height)
        return this
      }

      remove () {
        this.ctx.clearRect(0, 0, this.width, this.height)
        return this
      }

      line (color, opacity, width, p1, p2) {
        this.ctx.beginPath()
        this.ctx.strokeStyle = `rgba(${color.r},${color.g},${color.b},${opacity})`
        this.ctx.lineWidth = width
        this.ctx.moveTo(p1.x, p1.y)
        this.ctx.lineTo(p2.x, p2.y)
        this.ctx.stroke()
        this.ctx.closePath()
      }

      circle (color, opacity, x, y, radius) {
        this.ctx.fillStyle = `rgba(${color.r},${color.g},${color.b},${opacity})`
        this.ctx.beginPath()
        this.ctx.arc(x, y, radius, 0, Math.PI * 2, false)
        this.ctx.fill()
      }

      edge (color, opacity, x, y, radius) {
        this.ctx.fillStyle = `rgba(${color.r},${color.g},${color.b},${opacity})`
        this.ctx.beginPath()
        this.ctx.rect(x, y, radius * 2, radius * 2)
        this.ctx.fill()
      }

      triangle (color, opacity, x, y, radius) {
        this.ctx.fillStyle = `rgba(${color.r},${color.g},${color.b},${opacity})`
        this.ctx.beginPath()
        this.ctx.moveTo(x, y - radius)
        this.ctx.lineTo(x + radius, y + radius)
        this.ctx.lineTo(x - radius, y + radius)
        this.ctx.closePath()
        this.ctx.fill()
      }
    }

    class Tweens {
      constructor (canvas, options, retina) {
        this._canvas = canvas
        this._options = options
        this._options.color.rgb = $.hexRgb(options.color.val)
        this._options.linked.color.rgb = $.hexRgb(options.linked.color.val)
        this._options.anim.speed *= retina
        this._options.linked.distance *= retina
        this._options.linked.width *= retina
        this._options.retina = retina
        this._particles = []
      }

      create () {
        for (let i = 0; i < this.numb; i++) {
          this._particles.push(new Particle(this._canvas, this._options))
        }
        return this
      }

      draw () {
        this._canvas.remove()
        this._animate()
        for (let p of this._particles) {
          p.draw(this._options.shape)

        }
        return this
      }

      remove () {
        for (let i = 0; i < this.length; i++) {
          delete this._particles[i]
        }
        this._particles = []
        return this
      }

      density () {
        if (this._options.events.onresize.density.auto) {
          const area = this._canvas.width * this._canvas.height / 1000
          if (this._retina) {
            area /= this._retina * 2
          }
          const numb = Math.round(area * this._numb / this._options.events.onresize.density.area)
          const missing = this._length - numb
          if (missing < 0) {
            this._push(Math.abs(missing))
          } else {
            this._delete(missing)
          }
        }
      }

      get _length () {
        return this._particles.length
      }

      get _numb () {
        let numb = 20
        if (this.frame.canvas.width > 1600) {
          numb = 160
        } else if (this.frame.canvas.width > 1200) {
          numb = 140
        } else if (this.frame.canvas.width > 992) {
          numb = 120
        } else if (this.frame.canvas.width > 768) {
          numb = 80
        } else if (this.frame.canvas.width > 480) {
          numb = 40
        }
        return numb
      }

      _listeners () {
        this.status = null
        this.mouse = {}
        const scope = this._options.scope ? this.canvas.element : window
        scope.onmousemove = event => {
          this.mouse = scope === window ? {
            x: event.clientX,
            y: event.clientY
          } : {
            x: event.offsetX || event.clientX,
            y: event.offsetY || event.clientY
          }
          this.mouse.x *= this._retina
          this.mouse.y *= this._retina
          this.status = 'mousemove'
        }
        scope.onmouseleave = event => {
          this.mouse.x = 0
          this.mouse.y = 0
          this.status = 'mouseleave'
        }
        if (this._options.events.onclick.enable) {
          switch (this.events.onclick.mode) {
            case 'push':
              scope.onclick = event => this._push(this._options.events.onclick.numb, this.mouse)
              break
            case 'remove':
              scope.onclick = event => this._delete(this._options.events.onclick.numb)
          }
        }
        if (this._options.events.onresize.enable) {
          window.addEventListener('resize', () => {
            this._canvas
              .resize()
              .paint()
            if (!this._options.anim.enable) {
              this.canvas.remove()
              this
                ._remove()
                ._launch()
            }
            this._density()
          })
        }
      }

      _push (numb, position) {
        for (let i = 0; i < numb; i++) {
          this._particles.push(new Particle(this._canvas, this._options, {
            x: position ? position.x : Math.random() * this._canvas.width,
            y: position ? position.y : Math.random() * this._canvas.height
          }))
        }
      }

      _delete (numb) {
        for (let i = 0; i < numb; i++) {
          delete this._particles[i]
        }
        this._particles.splice(0, numb)
      }

      _animate (){
        this._particles.forEach(p => {
          p.x += p.vx * this._options.anim.speed / 4
          p.y += p.vy * this._options.anim.speed / 4
          if (this._options.opacity.anim.enable) {
            if (p.opacity.status) {
              p.opacity.status = false
            }
            p.opacity.val += p.vo
          } else {
            if (p.opacity.val <= this._options.opacity.anim.transparent) {
              p.opacity.status = true
            }
            p.opacity.val -= p.vo
          }
          switch (this.frame.events.onresize.mode) {
            case 'bounce':
              if (p.x - p.radius > this._canvas.width) {
                p.vx = -p.vx
              } else {
                if (p.x + p.radius < 0) {
                  p.vx = -p.vx
                }
                if (p.y - p.radius > this._canvas.height) {
                  p.vy = -p.vy
                } else if (p.y + p.radius < 0) {
                  p.vy = -p.vy
                }
              }
              break
            case 'out':
              if (p.x - p.radius > this._canvas.width) {
                p.x = p.radius
              } else if (p.x + p.radius < 0) {
                p.x = this._canvas.width + p.radius
              }
              if (p.y - p.radius > this.frame.canvas.height) {
                p.y = p.radius
              } else if (p.y + p.radius < 0) {
                p.y = this._canvas.height + p.radius
              }
          }
          this._particles.forEach(_p => {
            if (this._options.linked.auto) {
              this._distance(p, _p)
            }
            if (this.frame.interactiv) {
              switch (this.frame.mode) {
                case 'grab':
                  this._grab(p, _p)
              }
            }
          })
        })
      }

      _distance (p1, p2) {
        dx = p1.x - p2.x
        dy = p1.y - p2.y
        dist = Math.sqrt(dx * dx + dy * dy)
        if (dist <= this._options.linked.distance) {
          this.frame.canvas.line(this._options.linked.color.rgb, opacity, this._options.linked.width, p1, p2)
          if (this.linked.condensed.enable) {
            dx = p1.x - p2.x
            dy = p1.y - p2.y
            ax = dx / (this.linked.condensed.rotateX * 1000)
            ay = dy / (this.linked.condensed.rotateY * 1000)
            p2.vx += ax
            p2.vy += ay
          }
        }
      }

      _grab (p1, p2) {
        const dx = p1.x - p2.x
        const dy = p1.y - p2.y
        const dist = Math.sqrt(dx * dx + dy * dy)
        if (this.frame.status === 'mousemove') {
          dx_mouse = p1.x - this.frame.mouse.pos.x
          dy_mouse = p1.y - this.frame.mouse.pos.y
          dist_mouse = Math.sqrt(dx_mouse * dx_mouse + dy_mouse * dy_mouse)
          if (dist <= this._options.linked.distance && dist_mouse <= this._options.mouse.distance) {
            const opacity = this._options.linked.opacity - dist_mouse / this._options.mouse.distance
            this._canvas.line(this._options.linked.color.rgb, opacity, this._options.linked.width, p1, this.frame.mouse.pos)
          }
        }
      }
    }

    class Particle {
      constructor (canvas, options, position) {
        this._canvas = canvas
        this.x = position ? position.x : Math.random() * canvas.width
        this.y = position ? position.y : Math.random() * canvas.height
        this.radius = (options.size.random ? Math.random() : 1) * options.size.val * options.retina
        this._color = options.color.random ? {
          r: Math.floor(Math.random() * 255),
          g: Math.floor(Math.random() * 255),
          b: Math.floor(Math.random() * 255)
        } : options.color.rgb
        this.opacity = { val: options.opacity.val }
        if (options.opacity.anim.enable) {
          this.opacity.status = false
          this.vo = options.opacity.anim.speed / 100
        }
        if (!options.opacity.anim.sync) {
          this.vo *= Math.random()
        }
        this.vx = -.5 + Math.random()
        this.vy = -.5 + Math.random()
      }

      draw (shape) {
        this._canvas[shape](this._color, this.opacity.val, this.x, this.y, this._radius)
      }
    }

    return PROcanvaFrame
  })()

  const NAME = 'proCanvaFrame'
  const JQUERY_NO_CONFLICT = jQuery.fn[NAME]

  jQuery.fn[NAME] = PROcanvaFrame._jQuery
  jQuery.fn[NAME].Constructor = PROcanvaFrame
  jQuery.fn[NAME].noConflict = function () {
    jQuery.fn[NAME] = JQUERY_NO_CONFLICT
    return PROcanvaFrame._jQuery
  }
})(window, document, jQuery)
