BasicObject = require './BasicObject'
TweenMax     = require 'gsap'

class StrokeCircle extends BasicObject

    circ  : Math.PI * 2
    quart : Math.PI / 2

    animate : (out = false)=>
        super(out)

        @radius = @size[0] / 2
        a = {w : 0}
        TweenMax.to a, 2.7, w : 1, delay: 1 - parseInt(out), ease: "easeInOutQuart", onUpdate : =>
            if(!out)
                @ctx.clearRect 0, 0, @size[0], @size[1]

            @ctx.beginPath()
            @ctx.strokeStyle = @grad
            @ctx.lineWidth = @lineWidth
                
            @ctx.arc @radius, @radius, @radius - @lineWidth, 0, a.w * @circ, false
            @ctx.stroke()
        , onComplete : => if !out then setTimeout(@animate, 2000, true) else @resetShowAnim()
        null

module.exports = StrokeCircle