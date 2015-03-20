Config = require '../utils/Config'
BasicObject   = require './BasicObject'
TweenMax     = require 'gsap'

class OpenSquare extends BasicObject

    out : false

    animate : (out = false)=>
        super(out)

        @out = out

        @clear() if !out
        @startDraw()
        @ctx.moveTo(@lineWidth / 2, @size[0] - @lineWidth)

        a = {w : 0}
        TweenMax.to a, .3, w : @size[0] - @lineWidth, delay: 1 - parseInt(out), ease: "easeInQuart", onUpdate : =>
            @ctx.lineTo(@lineWidth / 2,(@size[0] - a.w))
            @ctx.stroke()
        , onComplete : =>
            a = {w : 0}
            TweenMax.to a, .3, w : @size[0], ease: "easeOutQuart", onUpdate : =>
                @ctx.lineTo(@lineWidth / 2 + a.w, @lineWidth)
                @ctx.stroke()
            , onComplete: @animateLine2

        null

    animateLine2 : =>

        @gradColor = Config.GRADIENTS[Math.round(Math.random() * (Config.GRADIENTS.length - 1))]

        @grad = @ctx.createLinearGradient(0, 0, @size[0], 0)
        @grad.addColorStop(0, @gradColor[0])
        @grad.addColorStop(1, @gradColor[1])

        h = @size[1] - @lineWidth

        @ctx.beginPath()
        @ctx.strokeStyle = @grad
        @ctx.moveTo(0,h)


        # @ctx.lineTo(125 - @lineWidth / 2,h)
        # @ctx.lineTo(125 - @lineWidth / 2,65)

        a = {w : 0}
        TweenMax.to a, .3, w : @size[0], ease: "easeInQuart", onUpdate : =>
            @ctx.lineTo(a.w - @lineWidth / 2,h)
            @ctx.stroke()
        , onComplete : =>
            a = {w : h}
            TweenMax.to a, .3, w : 65, ease: "easeOutQuart", onUpdate : =>
                @ctx.lineTo(@size[0] - @lineWidth / 2,a.w)
                @ctx.stroke()
            , onComplete : => if !@out then setTimeout(@animate, 2000, true) else @resetShowAnim()


module.exports = OpenSquare
