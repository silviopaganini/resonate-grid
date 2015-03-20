BasicObject = require './BasicObject'
TweenMax    = require 'gsap'

class CrossX extends BasicObject

    animate : (out = false)=>
        super(out)

        a = {w : @size[0] / 4 - @lineWidth / 2}
        if(!out)
            @ctx.translate @size[0] / 2, @size[1] / 2
            @ctx.rotate 45 * Math.PI / 180
            @ctx.translate -@size[0] / 2, -@size[1] / 2
        else 
            @ctx.lineWidth = 17

        @ctx.moveTo(@size[0] / 4 - @lineWidth / 2, @size[1] / 2 - @lineWidth / 2)

        TweenMax.to a, .2, w : (@size[0] / 2 + @size[0] / 4) - @lineWidth / 2, ease: "easeInSine", delay: 1 - parseInt(out), onUpdate : =>
            @ctx.lineTo(a.w, @size[1] / 2 - @lineWidth / 2)
            @ctx.stroke()
        , onComplete: =>
            a = {w : @size[1] / 2 - @lineWidth / 2}
            @ctx.moveTo(@size[0] / 2 - @lineWidth / 2, @size[1] / 4 - @lineWidth / 2)
            TweenMax.to a, .2, w : (@size[1] / 2 + @size[1] / 4) - @lineWidth / 2, ease: "easeInSine", onUpdate : =>
                @ctx.lineTo(@size[0] / 2 - @lineWidth / 2, a.w)
                @ctx.stroke()
            , onComplete : => if !out then setTimeout(@animate, 2000, true) else @resetShowAnim()
                

        null

module.exports = CrossX