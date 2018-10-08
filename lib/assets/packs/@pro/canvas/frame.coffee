((window, document, ProJ) ->
    'use strict'


    ratio = (value) ->
        value * window.devicePixelRatio

# ----------------------------------------------------------------------------------------------------

    class Canvas

        constructor: (@frame) ->
            @frame.owner = document.getElementById @frame.owner if typeof @frame.owner is 'string'
            el = document.createElement 'canvas'
            el.style.display = 'block'
            el.style.position = 'absolute'
            el.style.zIndex = 0
            el.style.top = 0
            el.style.left = 0
            el.style.width = '100%'
            el.style.height = '100%'
            @el = @frame.owner.appendChild el
            @ctx= @el.getContext '2d'


        size: =>
            @el.width = @width = @el.offsetWidth * @frame.retina
            @el.height = @height = @el.offsetHeight * @frame.retina


        paint: => @ctx.fillRect 0, 0, @width, @height


        remove: => @ctx.clearRect 0, 0, @width, @height


        line: (color, opacity, width, p1, p2) ->
            @ctx.beginPath()
            @ctx.strokeStyle = "rgba(#{ color.r },#{ color.g },#{ color.b },#{ opacity })"
            @ctx.lineWidth = width
            @ctx.moveTo p1.x, p1.y
            @ctx.lineTo p2.x, p2.y
            @ctx.stroke()
            @ctx.closePath()


        circle: (color, opacity, x, y, radius) ->
            @ctx.fillStyle = "rgba(#{ color.r },#{ color.g },#{ color.b },#{ opacity })"
            @ctx.beginPath()
            @ctx.arc x, y, radius, 0, Math.PI * 2, no
            @ctx.fill()


        edge: (color, opacity, x, y, radius) ->
            @ctx.fillStyle = "rgba(#{ color.r },#{ color.g },#{ color.b },#{ opacity })"
            @ctx.beginPath()
            @ctx.rect x, y, radius * 2, radius * 2
            @ctx.fill()


        triangle: (color, opacity, x, y, radius) ->
            @ctx.fillStyle = "rgba(#{ color.r },#{ color.g },#{ color.b },#{ opacity })"
            @ctx.beginPath()
            @ctx.moveTo x, y - radius
            @ctx.lineTo x + radius, y + radius
            @ctx.lineTo x - radius, y + radius
            @ctx.closePath()
            @ctx.fill()

# -------------------------

    class Particle

        constructor: (@frame, @color, opacity, position) ->
            @x = if position then position.x else Math.random() * @frame.canvas.width
            @y = if position then position.y else Math.random() * @frame.canvas.height
            @radius = (if @frame.particles.size.random then Math.random() else 1) * @frame.particles.size.val* @frame.retina
            if @frame.particles.color.random
                @color =
                    r: Math.floor Math.random()*255
                    g: Math.floor Math.random()*255
                    b: Math.floor Math.random()*255
            @opacity = val: opacity
            if @frame.particles.opacity.anim.enable
                @opacity.status = no
                @vo = @frame.particles.opacity.anim.speed / 100
            if not @frame.particles.opacity.anim.sync
                @vo = @vo * Math.random()
            @vx = -.5 + Math.random()
            @vy = -.5 + Math.random()


        draw: (shape) -> @frame.canvas[shape] @color, @opacity.val, @x, @y, @radius

# -------------------------

    class Particles

        constructor: (@frame, options={}) ->
            ProJ.extend @, options.particles
            @color.rgb = ProJ.hexRgb @color.val
            @linked.color.rgb = ProJ.hexRgb @linked.color.val
            @anim.speed *= @frame.retina
            @linked.distance *= @frame.retina
            @linked.width *= @frame.retina


        shape: 'circle'
        color:
            val: '#fff'
            random: no
        opacity:
            val: 1
            anim:
                enable: yes,
                speed: 2
                transparent: 0
                sync: no
        size:
            val: 4
            random: yes
        linked:
            auto: yes
            distance: 120
            color:
                val: '#fff'
            opacity: .8
            width: 1
            condensed:
                enable: no
                rotateX: 600
                rotateY: 600
        anim:
            enable: yes
            speed: 1
        array: []


        create: ->
            @nb = switch
                when @frame.canvas.width > 1600 then 160;
                when @frame.canvas.width > 1200 then 140;
                when @frame.canvas.width > 992 then 120
                when @frame.canvas.width >768 then 80
                when @frame.canvas.width >480 then 40
                else 20
            @array = for i in [0...@nb]
                new Particle @frame, @color.rgb, @opacity.val


        push: (nb, pos) ->
            for i in [0...nb]
                @array.push new Particle @frame, @color.rgb, @opacity.val,
                    x: if pos then pos.x else Math.random() * @frame.canvas.width
                    y: if pos then pos.y else Math.random() * @frame.canvas.height


        remove: ->
            delete @array[i] for i in [0...@array.length]
            @array = []


        delete: (nb) ->
            delete @array[i] for i in [0...nb]
            @array.splice 0, nb


        draw: ->
            @frame.canvas.remove()
            @animate()
            p.draw @shape for p in @array


        animate: ->
            for p in @array
                p.x += p.vx * @anim.speed / 4
                p.y += p.vy * @anim.speed / 4
                if @opacity.anim.enable
                    if p.opacity.status
                        if p.opacity.val >= @opacity.val
                            p.opacity.status = no
                        p.opacity.val += p.vo
                    else
                        if p.opacity.val <= @opacity.anim.transparent
                            p.opacity.status = yes
                        p.opacity.val -= p.vo
                switch @frame.events.onresize.mode
                    when 'bounce'
                        if p.x - p.radius > @frame.canvas.width
                            p.vx = -p.vx
                        else
                            if p.x + p.radius < 0
                                p.vx = -p.vx
                            if p.y - p.radius > @frame.canvas.height
                                p.vy = -p.vy
                            else if p.y + p.radius < 0
                                p.vy = -p.vy
                    when 'out'
                        if p.x - p.radius > @frame.canvas.width
                            p.x = p.radius
                        else if p.x + p.radius < 0
                            p.x = @frame.canvas.width + p.radius
                        if p.y - p.radius > @frame.canvas.height
                            p.y = p.radius
                        else if p.y + p.radius < 0
                            p.y = @frame.canvas.height + p.radius
                for _p in @array
                    if @linked.auto
                        @distance p, _p
                    if @frame.interactiv
                        switch @frame.mode
                            when 'grab'
                                @grab p, _p


        distance: (p1, p2) ->
            dx = p1.x - p2.x
            dy = p1.y - p2.y
            dist = Math.sqrt (dx * dx) + (dy * dy)
            if dist <= @linked.distance
                opacity = @linked.opacity - dist / @linked.distance
                @frame.canvas.line @linked.color.rgb, opacity, @linked.width, p1, p2
                if @linked.condensed.enable
                    dx = p1.x - p2.x
                    dy = p1.y - p2.y
                    ax = dx / (@linked.condensed.rotateX * 1000)
                    ay = dy / (@linked.condensed.rotateY * 1000)
                    p2.vx += ax
                    p2.vy += ay


        grab: (p1, p2) ->
            dx = p1.x - p2.x
            dy = p1.y - p2.y
            dist = Math.sqrt (dx * dx) + (dy * dy)
            if @frame.status is 'mousemove'
                dx_mouse = p1.x - @frame.mouse.pos.x
                dy_mouse = p1.y - @frame.mouse.pos.y
                dist_mouse = Math.sqrt (dx_mouse * dx_mouse) + (dy_mouse * dy_mouse)
                if dist <= @linked.distance and dist_mouse <= @frame.mouse.distance
                    opacity = @frame.linked.opacity - dist_mouse / @frame.mouse.distance
                    @frame.canvas.line @linked.color.rgb, opacity, @linked.width, p1, @frame.mouse.pos

# -------------------------

    class Frame

        constructor: (@owner, options={}) ->
            ProJ.extend @, options.interactive
            @retina = if @retina and window.devicePixelRatio > 1 then window.devicePixelRatio else 1
            @mouse.distance *= @retina

            @canvas = new Canvas @
            @particles = new Particles @, options

            @launch()
            @animation() if @particles.anim.enable
            @listeners() if @interactiv

            if @events.onresize.enable
                window.addEventListener 'resize', =>
                    @canvas.size()
                    @canvas.paint()
                    if not @particles.anim.enable
                        @particles.remove()
                        @canvas.remove()
                        @launch()
                    @density()


        interactiv: yes
        mouse:
            distance: 200
        detector: 'canvas'
        mode: 'grab'
        linked:
            opacity: .4
        events:
            onclick:
                enable: yes
                mode: 'push'
                nb: 4
            onresize:
                enable: yes
                mode: 'bounce'
                density:
                    auto: yes
                    area: 800
        retina: no


        launch: ->
            @canvas.size()
            @canvas.paint()
            @particles.create()
            @particles.draw()
            @density()


        density: ->
            if @events.onresize.density.auto
                area = @canvas.el.width * @canvas.el.height / 1000
                if @retina
                    area /= @retina * 2
                nb = Math.round area * @particles.nb / @events.onresize.density.area
                missing = @particles.array.length - nb
                if missing < 0
                    @particles.push Math.abs missing
                else if missing > 0
                    @particles.delete missing


        animation: =>
            @particles.draw()
            @request = ProJ.animation.request @animation


        listeners: ->
            el = if @detector is 'window' then window else @canvas.el
            el.onmousemove = (event) =>
                if el is window
                    @mouse.pos =
                        x: event.clientX
                        y: event.clientY
                else
                    @mouse.pos =
                        x: event.offsetX or event.clientX
                        y: event.offsetY or event.clientY
                @mouse.pos.x *= @retina
                @mouse.pos.y *= @retina
                @status = 'mousemove'

            el.onmouseleave = (event) =>
                @mouse.pos.x = 0
                @mouse.pos.y = 0
                @status = 'mouseleave'

            if @events.onclick.enable
                switch @events.onclick.mode
                    when 'push'
                        el.onclick = (event) => @particles.push @events.onclick.nb, @mouse.pos
                    when 'remove'
                        el.onclick = (event) => @particles.delete @events.onclick.nb


        destroy: ->
            ProJ.animation.cancel @request
            @particles.remove()
            @canvas.remove()
            delete @

# --------------------------------------------------

    ProJ.Frame = ProJ::Frame = Frame


# ----------------------------------------------------------------------------------------------------

)(window, document, ProJ)
