BasicObject = require './BasicObject'
TweenMax    = require 'gsap'

class Comma extends BasicObject

    animate : (out = false)=>
        super(out)

        a = {w : 0}
        @moveTo(0, 0)

        @ctx.beginPath()
        @ctx.strokeStyle = @grad
        @ctx.lineWidth = @lineWidth

        TweenMax.to a, .4, w : 54, ease: "easeInQuart", delay: 1 - parseInt(out), onUpdate : =>
            @ctx.lineTo(@lineWidth / 2, a.w - @offLine)
            @ctx.stroke()
        , onComplete: =>
            a = {w : 0}
            TweenMax.to a, .6, w : 158, ease: "easeOutQuart", onUpdate : =>
                @ctx.lineTo(a.w + @offLine,54 - @offLine)
                @ctx.stroke()
            , onComplete : => if !out then setTimeout(@animate, 2000, true) else @resetShowAnim()
                

        null

module.exports = Comma