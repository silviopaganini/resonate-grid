Config = require '../utils/Config'
BasicObject   = require './BasicObject'
TweenMax     = require 'gsap'

class SemiCircle extends BasicObject

    animate : (out = false)=>
        super(out)

        @radius = @size[0] / 2

        a = {w : 0}
        TweenMax.to a, .5, w : 1, delay: 1 - parseInt(out), ease: "easeInQuart", onUpdate : =>
            if(!out)
                @ctx.clearRect 0, 0, @size[0], @size[1]

            @ctx.beginPath()
            @ctx.strokeStyle = @grad
            @ctx.lineWidth = @lineWidth
            @ctx.arc @radius, @radius, @radius - @lineWidth, Math.PI, a.w * Math.PI - Math.PI
            @ctx.stroke()
        , onComplete : => if !out then setTimeout(@animate, 2000, true) else @resetShowAnim()

        null

module.exports = SemiCircle
