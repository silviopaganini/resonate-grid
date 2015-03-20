BasicObject = require './BasicObject'
TweenMax    = require 'gsap'

class Cross extends BasicObject

    animate : (out = false)=>
        super(out)

        a = {w : @size[0] / 4 - @lineWidth / 2, h : @size[1] / 2 - @lineWidth / 2}
        @ctx.moveTo(@size[0] / 4 - @lineWidth / 2, @size[1] / 2 - @lineWidth / 2)

        @ctx.lineWidth = 17 if(out)

        TweenMax.to a, .3, h : (@size[1] / 2 + @size[1] / 4) - @lineWidth / 2, w : (@size[0] / 2 + @size[0] / 4) - @lineWidth / 2, ease:(if out then "easeOutQuart" else "easeInExpo"), delay: 1 - parseInt(out), onUpdate : =>
            @ctx.moveTo(@size[0] / 4 - @lineWidth / 2, @size[1] / 2 - @lineWidth / 2)
            @ctx.lineTo(a.w, @size[1] / 2 - @lineWidth / 2)
            @ctx.stroke()

            @ctx.moveTo(@size[0] / 2 - @lineWidth / 2, @size[1] / 4 - @lineWidth / 2)
            @ctx.lineTo(@size[0] / 2 - @lineWidth / 2, a.h)
            @ctx.stroke()
        , onComplete : => if !out then setTimeout(@animate, 2000, true) else @resetShowAnim()

        null

module.exports = Cross