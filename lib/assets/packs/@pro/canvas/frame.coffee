((window, document, ProJ) ->
    'use strict'


    ratio = (value) ->
        value * window.devicePixelRatio

# ----------------------------------------------------------------------------------------------------

    class Canvas

        constructor: (this.frame) ->
            this.frame.owner = document.getElementById this.frame.owner if typeof this.frame.owner === 'string'
            el = document.createElement 'canvas'
            el.style.display = 'block'
            el.style.position = 'absolute'
            el.style.zIndex = 0
            el.style.top = 0
            el.style.left = 0
            el.style.width = '100%'
            el.style.height = '100%'
            this.el = this.frame.owner.appendChild el
            this.ctx= this.el.getContext '2d'


        size: =>
            this.el.width = this.width = this.el.offsetWidth * this.frame.retina
            this.el.height = this.height = this.el.offsetHeight * this.frame.retina


        paint: => this.ctx.fillRect 0, 0, this.width, this.height


        remove: => this.ctx.clearRect 0, 0, this.width, this.height


        line: (color, opacity, width, p1, p2) ->
            this.ctx.beginPath()
            this.ctx.strokeStyle = "rgba(#{ color.r },#{ color.g },#{ color.b },#{ opacity })"
            this.ctx.lineWidth = width
            this.ctx.moveTo p1.x, p1.y
            this.ctx.lineTo p2.x, p2.y
            this.ctx.stroke()
            this.ctx.closePath()


        circle: (color, opacity, x, y, radius) ->
            this.ctx.fillStyle = "rgba(#{ color.r },#{ color.g },#{ color.b },#{ opacity })"
            this.ctx.beginPath()
            this.ctx.arc x, y, radius, 0, Math.PI * 2, false
            this.ctx.fill()


        edge: (color, opacity, x, y, radius) ->
            this.ctx.fillStyle = "rgba(#{ color.r },#{ color.g },#{ color.b },#{ opacity })"
            this.ctx.beginPath()
            this.ctx.rect x, y, radius * 2, radius * 2
            this.ctx.fill()


        triangle: (color, opacity, x, y, radius) ->
            this.ctx.fillStyle = "rgba(#{ color.r },#{ color.g },#{ color.b },#{ opacity })"
            this.ctx.beginPath()
            this.ctx.moveTo x, y - radius
            this.ctx.lineTo x + radius, y + radius
            this.ctx.lineTo x - radius, y + radius
            this.ctx.closePath()
            this.ctx.fill()

# -------------------------

    class Particle

        constructor: (this.frame, this.color, opacity, position) ->
            this.x = if position then position.x else Math.random() * this.frame.canvas.width
            this.y = if position then position.y else Math.random() * this.frame.canvas.height
            this.radius = (if this.frame.particles.size.random then Math.random() else 1) * this.frame.particles.size.val* this.frame.retina
            if this.frame.particles.color.random
                this.color =
                    r: Math.floor Math.random()*255
                    g: Math.floor Math.random()*255
                    b: Math.floor Math.random()*255
            this.opacity = val: opacity
            if this.frame.particles.opacity.anim.enable
                this.opacity.status = false
                this.vo = this.frame.particles.opacity.anim.speed / 100
            if not this.frame.particles.opacity.anim.sync
                this.vo = this.vo * Math.random()
            this.vx = -.5 + Math.random()
            this.vy = -.5 + Math.random()


        draw: (shape) -> this.frame.canvas[shape] this.color, this.opacity.val, this.x, this.y, this.radius

# -------------------------

    class Particles

        constructor: (this.frame, options={}) ->
            ProJ.extend this., options.particles
            this.color.rgb = ProJ.hexRgb this.color.val
            this.linked.color.rgb = ProJ.hexRgb this.linked.color.val
            this.anim.speed *= this.frame.retina
            this.linked.distance *= this.frame.retina
            this.linked.width *= this.frame.retina


      {
        shape: 'circle',
        color: {
          val: '#fff',
          random: false
        }
        opacity: {
          val: 1,
          anim: {
            enable: true,
            speed: 2,
            transparent: 0,
            sync: false
          }
        }
        size: {
          val: 4,
          random: true
        }
        linked: {
          auto: true,
          distance: 120,
          color: {
            val: '#fff'
          }
          opacity: 0.8
          width: 1
          condensed: {
            enable: false,
            rotateX: 600,
            rotateY: 600
          }
        }
        anim: {
          enable: true,
          speed: 1
        }
      }
        array: []


        create: ->
            this.nb = switch
                when this.frame.canvas.width > 1600 then 160;
                when this.frame.canvas.width > 1200 then 140;
                when this.frame.canvas.width > 992 then 120
                when this.frame.canvas.width >768 then 80
                when this.frame.canvas.width >480 then 40
                else 20
            this.array = for i in [0...this.nb]
                new Particle(this.frame, this.color.rgb, this.opacity.val)


        push: (nb, pos) ->
            for i in [0...nb]
                this.array.push new Particle this.frame, this.color.rgb, this.opacity.val,
                    x: if pos then pos.x else Math.random() * this.frame.canvas.width
                    y: if pos then pos.y else Math.random() * this.frame.canvas.height


        remove: ->
            delete this.array[i] for i in [0...this.array.length]
            this.array = []


        delete: (nb) ->
            delete this.array[i] for i in [0...nb]
            this.array.splice 0, nb


        draw: ->
            this.frame.canvas.remove()
            this.animate()
            p.draw this.shape for p in this.array


        animate: ->
            for p in this.array
                p.x += p.vx * this.anim.speed / 4
                p.y += p.vy * this.anim.speed / 4
                if this.opacity.anim.enable
                    if p.opacity.status
                        if p.opacity.val >= this.opacity.val
                            p.opacity.status = false
                        p.opacity.val += p.vo
                    else
                        if p.opacity.val <= this.opacity.anim.transparent
                            p.opacity.status = true
                        p.opacity.val -= p.vo
                switch this.frame.events.onresize.mode
                    when 'bounce'
                        if p.x - p.radius > this.frame.canvas.width
                            p.vx = -p.vx
                        else
                            if p.x + p.radius < 0
                                p.vx = -p.vx
                            if p.y - p.radius > this.frame.canvas.height
                                p.vy = -p.vy
                            else if p.y + p.radius < 0
                                p.vy = -p.vy
                    when 'out'
                        if p.x - p.radius > this.frame.canvas.width
                            p.x = p.radius
                        else if p.x + p.radius < 0
                            p.x = this.frame.canvas.width + p.radius
                        if p.y - p.radius > this.frame.canvas.height
                            p.y = p.radius
                        else if p.y + p.radius < 0
                            p.y = this.frame.canvas.height + p.radius
                for _p in this.array
                    if this.linked.auto
                        this.distance p, _p
                    if this.frame.interactiv
                        switch this.frame.mode
                            when 'grab'
                                this.grab p, _p


        distance: (p1, p2) ->
            dx = p1.x - p2.x
            dy = p1.y - p2.y
            dist = Math.sqrt (dx * dx) + (dy * dy)
            if dist <= this.linked.distance
                opacity = this.linked.opacity - dist / this.linked.distance
                this.frame.canvas.line this.linked.color.rgb, opacity, this.linked.width, p1, p2
                if this.linked.condensed.enable
                    dx = p1.x - p2.x
                    dy = p1.y - p2.y
                    ax = dx / (this.linked.condensed.rotateX * 1000)
                    ay = dy / (this.linked.condensed.rotateY * 1000)
                    p2.vx += ax
                    p2.vy += ay


        grab: (p1, p2) ->
            dx = p1.x - p2.x
            dy = p1.y - p2.y
            dist = Math.sqrt (dx * dx) + (dy * dy)
            if this.frame.status === 'mousemove'
                dx_mouse = p1.x - this.frame.mouse.pos.x
                dy_mouse = p1.y - this.frame.mouse.pos.y
                dist_mouse = Math.sqrt (dx_mouse * dx_mouse) + (dy_mouse * dy_mouse)
                if dist <= this.linked.distance && dist_mouse <= this.frame.mouse.distance
                    opacity = this.frame.linked.opacity - dist_mouse / this.frame.mouse.distance
                    this.frame.canvas.line this.linked.color.rgb, opacity, this.linked.width, p1, this.frame.mouse.pos

# -------------------------

    class Frame

        constructor: (this.owner, options={}) ->
            ProJ.extend this., options.interactive
            this.retina = if this.retina && window.devicePixelRatio > 1 then window.devicePixelRatio else 1
            this.mouse.distance *= this.retina

            this.canvas = new Canvas this.
            this.particles = new Particles this., options

            this.launch()
            this.animation() if this.particles.anim.enable
            this.listeners() if this.interactiv

            if this.events.onresize.enable
                window.addEventListener 'resize', =>
                    this.canvas.size()
                    this.canvas.paint()
                    if not this.particles.anim.enable
                        this.particles.remove()
                        this.canvas.remove()
                        this.launch()
                    this.density()


        {
            interactiv: true,
            mouse: { distance: 200 },
            detector: 'canvas',
            mode: 'grab',
            linked: { opacity: 0.4 },
            events: {
                onclick: {
                    enable: true,
                    mode: 'push',
                    nb: 4
                }
                onresize: {
                    enable: true,
                    mode: 'bounce',
                    density: {
                        auto: true,
                        area: 800
                    }
                }
            }
            retina: false
        }


        launch: ->
            this.canvas.size()
            this.canvas.paint()
            this.particles.create()
            this.particles.draw()
            this.density()


        density: ->
            if this.events.onresize.density.auto
                area = this.canvas.el.width * this.canvas.el.height / 1000
                if this.retina
                    area /= this.retina * 2
                nb = Math.round area * this.particles.nb / this.events.onresize.density.area
                missing = this.particles.array.length - nb
                if missing < 0
                    this.particles.push Math.abs missing
                else if missing > 0
                    this.particles.delete missing


        animation: =>
            this.particles.draw()
            this.request = ProJ.animation.request this.animation


        listeners: ->
            scope = if this.detector === 'window' then window else this.canvas.el
            scope.onmousemove = (event) =>
                if scope === window
                    this.mouse.pos =
                        x: event.clientX
                        y: event.clientY
                else
                    this.mouse.pos =
                        x: event.offsetX || event.clientX
                        y: event.offsetY || event.clientY
                this.mouse.pos.x *= this.retina
                this.mouse.pos.y *= this.retina
                this.status = 'mousemove'

            scope.onmouseleave = (event) =>
                this.mouse.pos.x = 0
                this.mouse.pos.y = 0
                this.status = 'mouseleave'

            if this.events.onclick.enable
                switch this.events.onclick.mode
                    when 'push'
                        scope.onclick = (event) => this.particles.push this.events.onclick.nb, this.mouse.pos
                    when 'remove'
                        scope.onclick = (event) => this.particles.delete this.events.onclick.nb


        destroy: ->
            ProJ.animation.cancel this.request
            this.particles.remove()
            this.canvas.remove()
            delete this.

# --------------------------------------------------

    ProJ.Frame = ProJ::Frame = Frame


# ----------------------------------------------------------------------------------------------------

)(window, document, ProJ)
