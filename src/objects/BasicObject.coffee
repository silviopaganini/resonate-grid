Config = require '../utils/Config'
PIXI   = require('pixi')

class BasicObject

    g         : null
    lineWidth : 16
    stage     : null
    ctx       : null
    gradColor : null
    grad      : null
    offLine   : 0
    showing   : false

    constructor : (array) ->

        @stage     = array[0]
        w          = array[1]
        h          = array[2]
        @changePos = array[3]

        @setSize w, h

        @g = new PIXI.Sprite PIXI.Texture.Draw (canvas) =>
            canvas.width = @size[0]
            canvas.height = @size[1]
            @ctx = canvas.getContext('2d')

        @g.texture.requiresUpdate = true

        @offLine = @lineWidth / 2

        @init()
        null

    init : =>
        @gradColor = Config.GRADIENTS[Math.round(Math.random() * (Config.GRADIENTS.length - 1))]

        @grad = @ctx.createLinearGradient 0, 0, @size[0], 0
        @grad.addColorStop 0, @gradColor[0]
        @grad.addColorStop 1, @gradColor[1]

        null

    callAnimate : () =>
        # console.log @, @showing
        return if @showing
        @animate()
        null

    resetShowAnim : =>
        @clear()
        @changePos?(@)
        setTimeout =>
            @showing = false
        , 2000
        null

    animate : (out = false) =>
        if out
            @ctx.globalCompositeOperation = "destination-out"
        else
            @ctx.globalCompositeOperation = "source-over"
            @showing = true

        @startDraw()
        null

    startDraw : =>
        @ctx.closePath()
        @ctx.rotate(0)
        @ctx.beginPath()
        @ctx.strokeStyle = @grad
        @ctx.lineWidth = @lineWidth
        null

    setSize : (x, y = 0)=>
        @size = [Math.abs(@lineWidth + x), Math.abs((if y is 0 then x else y) + @lineWidth)]
        null

    moveTo : (x, y) =>
        @ctx.moveTo(x + @offLine, y + @offLine)
        null

    clear : =>
        @ctx.clearRect(0, 0, @size[0], @size[1])
        null

    width  : => return @size[0]
    height : => return @size[1]



module.exports = BasicObject
