// Generated by CoffeeScript 1.9.1
(function() {
  var BasicObject, CrossX, TweenMax,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  BasicObject = require('./BasicObject');

  TweenMax = require('gsap');

  CrossX = (function(superClass) {
    extend(CrossX, superClass);

    function CrossX() {
      this.animate = bind(this.animate, this);
      return CrossX.__super__.constructor.apply(this, arguments);
    }

    CrossX.prototype.animate = function(out) {
      var a;
      if (out == null) {
        out = false;
      }
      CrossX.__super__.animate.call(this, out);
      a = {
        w: this.size[0] / 4 - this.lineWidth / 2
      };
      if (!out) {
        this.ctx.translate(this.size[0] / 2, this.size[1] / 2);
        this.ctx.rotate(45 * Math.PI / 180);
        this.ctx.translate(-this.size[0] / 2, -this.size[1] / 2);
      } else {
        this.ctx.lineWidth = 17;
      }
      this.ctx.moveTo(this.size[0] / 4 - this.lineWidth / 2, this.size[1] / 2 - this.lineWidth / 2);
      TweenMax.to(a, .2, {
        w: (this.size[0] / 2 + this.size[0] / 4) - this.lineWidth / 2,
        ease: "easeInSine",
        delay: 1 - parseInt(out),
        onUpdate: (function(_this) {
          return function() {
            _this.ctx.lineTo(a.w, _this.size[1] / 2 - _this.lineWidth / 2);
            return _this.ctx.stroke();
          };
        })(this),
        onComplete: (function(_this) {
          return function() {
            a = {
              w: _this.size[1] / 2 - _this.lineWidth / 2
            };
            _this.ctx.moveTo(_this.size[0] / 2 - _this.lineWidth / 2, _this.size[1] / 4 - _this.lineWidth / 2);
            return TweenMax.to(a, .2, {
              w: (_this.size[1] / 2 + _this.size[1] / 4) - _this.lineWidth / 2,
              ease: "easeInSine",
              onUpdate: function() {
                _this.ctx.lineTo(_this.size[0] / 2 - _this.lineWidth / 2, a.w);
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

    return CrossX;

  })(BasicObject);

  module.exports = CrossX;

}).call(this);