Config  = require '../utils/Config'
noisejs = require '../utils/noise'
Vec2    = require '../utils/Vec2'
Rect2   = require '../utils/Rect2'
PIXI    = require('pixi')

class Grid
    w        : null
    h        : null
    graphs   : null
    grid     : null
    r        : null
    speed    : 1.5
    mult     : .0001
    alpha    : 0
    showGrid : false
    playing  : true

    constructor : (@size, @rows = 0, @showGrid = false) ->
        @grid = new PIXI.DisplayObjectContainer()
        @noise = new noisejs.SimplexNoise

        ref = if window.innerWidth > window.innerHeight then window.innerWidth else window.innerHeight

        @rows = if @rows is 0 then @size else @rows

        @graphs = []
        @w = ref / @size
        @h = ref / @size

        c = 0

        @alpha = if @showGrid then .5 else 0

        for i in [0...@rows]
            for a in [0...@size]
                g = new PIXI.Graphics()
                g.line = i
                g.lineStyle 1, 0xCCCCCC, @alpha
                g.beginFill(0xFFFFFF, @alpha)
                g.drawRect(0, 0, @w, @h)
                g.position = new PIXI.Point(a * @w, i * @h)
                g.x = a * @w
                g.y = i * @h
                g.id = c
                g.change = false
                g.rect = new Rect2(g.x, g.y, @w, @h)
                @graphs.push g
                @grid.addChild g
                c++
        null

    update : =>
        @alpha = if @showGrid then .5 else 0
        @hittest()

    hittest : () =>
        return if @playing isnt true
        changed = []
        for g in @graphs
            n = @noise.noise3(g.x, g.y, @speed * Date.now() * @mult)
            b = n > 0
            g.clear()
            g.lineStyle 1, 0xCCCCCC, @alpha
            g.beginFill( (if b then 0xCCCCCC else 0xFFFFFF), @alpha)
            g.drawRect(0, 0, @w, @h)
            changed.push g.id if b

        return changed

    resize : =>
        ref = if window.innerWidth > window.innerHeight then window.innerWidth else window.innerHeight

        @w = ref / @size
        @h = ref / @size

        i = 0

        for g in @graphs
            g.clear()
            g.lineStyle 1, 0xCCCCCC, @alpha
            g.beginFill(0xFFFFFF, @alpha)
            g.drawRect(0, 0, @w, @h)
            g.position = new PIXI.Point((i % @size) * @w, g.line * @h)
            g.x = (i % @size) * @w
            g.y = g.line * @h
            g.rect = new Rect2(g.x, g.y, @w, @h)
            i++

        null

module.exports = Grid


