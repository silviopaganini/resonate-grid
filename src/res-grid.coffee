StrokeCircle = require './objects/StrokeCircle'
OpenSquare   = require './objects/OpenSquare'
Comma        = require './objects/Comma'
HalfSquare   = require './objects/HalfSquare'
SemiCircle   = require './objects/SemiCircle'
DiagonalLine = require './objects/DiagonalLine'
Cross        = require './objects/Cross'
CrossX       = require './objects/CrossX'
Grid         = require './grid/Grid'
Utils        = require './utils/Utils'
PIXI         = require 'pixi'
TweenMax     = require 'gsap'
raf          = require 'raf'

class ResGrid

    # public
    view          : null

    # private
    grid          : null
    renderer      : null
    stage         : null
    current       : -1
    currentObject : -1
    shapes        : null
    objs          : null

    # protected
    gridSize      : 5
    maxHeight     : 2500
    showGrid      : true

    constructor : (@showGrid, optimalSize = true, @gridSize = 5, @maxHeight = 2500) ->

        ###
        hack pixi to draw gradient on sprites
        ###
        PIXI.Texture.Draw = (cb) =>
            canvas = document.createElement('canvas')
            cb(canvas) if (typeof cb == 'function')
            return PIXI.Texture.fromCanvas(canvas)
        ###
        end hack
        ###

        @getOptimalMaxSize() if optimalSize

        @init()

        null

    getOptimalMaxSize : =>
        if window.devicePixelRatio > 1
            @maxHeight = 2500
            @gridSize  = 5
        else
            @maxHeight = 4500
            @gridSize  = 7
        null


    init: =>

        PIXI.dontSayHello = true

        ref = if window.innerWidth > window.innerHeight then window.innerWidth else window.innerHeight
        full = ref
        boxes = Math.floor(full / @gridSize) - 2
        full = boxes * @gridSize

        w = ref
        h = Math.max @maxHeight, ref
        # @h = if full >= @maxHeight then @maxHeight else full

        @stage = new PIXI.Stage()
        @renderer = new PIXI.CanvasRenderer w, h, null,
            transparent : true
            antialias   : true

        @view = @renderer.view

        @draw()

        null

    togglePlay : =>
        @playing = !@playing
        @grid.playing = @playing
        null

    draw : =>
        @grid = new Grid @gridSize, @gridSize * 2, @showGrid
        @stage.addChild @grid.grid

        @addShapes()
        @update()
        null

    toggleGrid : =>
        @showGrid = !@showGrid
        @grid.showGrid = @showGrid
        null

    addShapes : =>

        @shapes = []
        @positions = []
        @positions.push i for i in [0...Math.pow(@gridSize, 2)]
        @shapes.push 0 for i in [0...Math.pow(@gridSize, 2)]
        @positions = Utils.shuffle @positions

        ref = if window.innerWidth > window.innerHeight then window.innerWidth else window.innerHeight
        ref /= @gridSize
        ref /= 1.5

        @objs = [
            {clazz : StrokeCircle  , params : [@renderer, ref, ref, @changeGridPos]},
            {clazz : OpenSquare    , params : [@renderer, 125, 192, @changeGridPos]},
            {clazz : Comma         , params : [@renderer, 158, 54, @changeGridPos]},
            {clazz : HalfSquare    , params : [@renderer, ref, ref, @changeGridPos]},
            {clazz : SemiCircle    , params : [@renderer, ref, ref, @changeGridPos]},
            {clazz : DiagonalLine  , params : [@renderer, 95, 16, @changeGridPos]},
            {clazz : Cross         , params : [@renderer, ref, ref, @changeGridPos]},
            {clazz : CrossX        , params : [@renderer, ref, ref, @changeGridPos]},
        ]

        @objs = Utils.shuffle @objs

        maxObjects = Math.round(@positions.length / (@gridSize - 2))
        # maxObjects = 6

        for i in [0...maxObjects]
            @getNextCurrentObject()
            a = new @objs[@currentObject].clazz(@objs[@currentObject].params)
            @randomAdd a

        # diag.g.rotation = 15 * Math.PI /180

        null

    getGridPosition : =>
        modX = @positions[@current] % @gridSize
        modY = Math.floor(@positions[@current] / @gridSize)

        ref = if window.innerWidth > window.innerHeight then window.innerWidth else window.innerHeight
        gridW = ref / @gridSize
        gridH = ref / @gridSize

        return x : (modX * gridW) + gridW / 2, y: (modY * gridH) + gridH / 2

    getNextCurrent : =>
        @current++
        @current = 0 if(@current > @positions.length - 1)
        null

    getNextCurrentObject : =>
        @currentObject++
        @currentObject = 0 if(@currentObject > @objs.length - 1)
        null

    randomAdd : (obj) =>
        @changeGridPos obj
        @stage.addChild obj.g
        null

    changeGridPos : (obj) =>
        @getNextCurrent()
        cc = @positions[@current]

        if(@shapes[cc] is 0)
            @shapes[obj.id] = 0 if obj.id
            pos = @getGridPosition()
            obj.g.position = new PIXI.Point(pos.x - obj.width() / 2, pos.y - obj.height() / 2)
            obj.g.x = pos.x - obj.width() / 2
            obj.g.y = pos.y - obj.height() / 2
            obj.id = cc
            @shapes[cc] = obj

        else
            @changeGridPos obj
        null

    update : =>
        @updateShape @grid.update()
        @render()
        # using pixi shim for RaF
        raf @update
        null

    updateShape : (array = []) =>
        for i in array
            if @shapes[i]? and @shapes[i] isnt 0
                @shapes[i].callAnimate()
        null

    render : =>
        @renderer.render @stage
        null

    resize : =>

        ref = if window.innerWidth > window.innerHeight then window.innerWidth else window.innerHeight

        full = ref
        boxes = Math.floor(full / @gridSize) - 2
        full = boxes * @gridSize

        w = ref
        h = Math.max(@maxHeight, ref)
        h = if full >= @maxHeight then @maxHeight else full

        @renderer.resize w, h
        @grid.resize()

        null

module.exports = ResGrid
