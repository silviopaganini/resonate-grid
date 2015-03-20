// Generated by CoffeeScript 1.9.1
(function() {
  var BasicObject, Comma, TweenMax,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  BasicObject = require('./BasicObject');

  TweenMax = require('gsap');

  Comma = (function(superClass) {
    extend(Comma, superClass);

    function Comma() {
      this.animate = bind(this.animate, this);
      return Comma.__super__.constructor.apply(this, arguments);
    }

    Comma.prototype.animate = function(out) {
      var a;
      if (out == null) {
        out = false;
      }
      Comma.__super__.animate.call(this, out);
      a = {
        w: 0
      };
      this.moveTo(0, 0);
      this.ctx.beginPath();
      this.ctx.strokeStyle = this.grad;
      this.ctx.lineWidth = this.lineWidth;
      TweenMax.to(a, .4, {
        w: 54,
        ease: "easeInQuart",
        delay: 1 - parseInt(out),
        onUpdate: (function(_this) {
          return function() {
            _this.ctx.lineTo(_this.lineWidth / 2, a.w - _this.offLine);
            return _this.ctx.stroke();
          };
        })(this),
        onComplete: (function(_this) {
          return function() {
            a = {
              w: 0
            };
            return TweenMax.to(a, .6, {
              w: 158,
              ease: "easeOutQuart",
              onUpdate: function() {
                _this.ctx.lineTo(a.w + _this.offLine, 54 - _this.offLine);
                return _this.ctx.stroke();
              },
              onComplete: function() {
                if (!out) {
                  return setTimeout(_this.animate, 2000, true);
                } else {
                  return _this.resetShowAnim();
                }
              }
            });
          };
        })(this)
      });
      return null;
    };

    return Comma;

  })(BasicObject);

  module.exports = Comma;

}).call(this);