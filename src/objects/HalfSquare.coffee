Config = require '../utils/Config'
BasicObject   = require './BasicObject'
TweenMax     = require 'gsap'

class HalfSquare extends BasicObject

    animate : (out = false)=>
        super(out)

        @ctx.moveTo(@size[0]-@lineWidth / 2, @lineWidth / 2)

        a = {w : @lineWidth / 2}

        TweenMax.to a, .3, delay: 1 - parseInt(out), ease: "easeInQuart", w : @size[1] - @lineWidth / 2, onUpdate: =>
            @ctx.lineTo(@size[0] - @lineWidth / 2, a.w)
            @ctx.stroke()
        , onComplete: =>
            a = {w : @size[0] - @lineWidth / 2}
            TweenMax.to a, .3, w: @lineWidth / 2, ease: "easeInQuart", onUpdate : =>
                @ctx.lineTo(a.w, @size[1] - @lineWidth / 2)
                @ctx.stroke()
            , onComplete : => if !out then setTimeout(@animate, 2000, true) else @resetShowAnim()

        null

module.exports = HalfSquare
