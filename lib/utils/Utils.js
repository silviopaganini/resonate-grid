// Generated by CoffeeScript 1.9.1
(function() {
  var Utils;

  Utils = (function() {
    function Utils() {}

    Utils.shuffle = function(o) {
      for(var j, x, i = o.length; i; j = Math.floor(Math.random() * i), x = o[--i], o[i] = o[j], o[j] = x);;
      return o;
    };

    Utils.randomRange = function(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    };

    return Utils;

  })();

  module.exports = Utils;

}).call(this);