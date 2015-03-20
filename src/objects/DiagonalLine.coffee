Config      = require '../utils/Config'
BasicObject = require './BasicObject'
TweenMax    = require 'gsap'

class DiagonalLine extends BasicObject

    animate : (out = false)=>
        super out

        # @ctx.rotate(15 * Math.PI / 180)
        @ctx.moveTo(@offLine, @offLine)

        a = {w : 0}

        TweenMax.to a, .3, delay: 1 - parseInt(out), w : @size[0] - @lineWidth , onUpdate : =>
            @ctx.lineTo(a.w + @offLine, @offLine)
            @ctx.stroke()
        , onComplete : => if !out then setTimeout(@animate, 2000, true) else @resetShowAnim()
        null

module.exports = DiagonalLine
