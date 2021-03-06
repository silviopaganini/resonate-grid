// Generated by CoffeeScript 1.9.1
(function() {
  var Vec2, Vec3;

  Vec2 = (function() {
    Vec2.prototype.x = 0;

    Vec2.prototype.y = 0;

    function Vec2(x1, y1) {
      this.x = x1 != null ? x1 : 0;
      this.y = y1 != null ? y1 : 0;
    }

    Vec2.prototype.set = function(v) {
      this.x = v.x;
      this.y = v.y;
      return this;
    };

    Vec2.prototype.set2 = function(x, y) {
      this.x = x;
      this.y = y;
      return this;
    };

    Vec2.prototype.zero = function() {
      this.x = this.y = 0;
      return this;
    };

    Vec2.prototype.add = function(v) {
      this.x += v.x;
      this.y += v.y;
      return this;
    };

    Vec2.prototype.add_ = function(v) {
      return new Vec2(this.x + v.x, this.y + v.y);
    };

    Vec2.prototype.sub = function(v) {
      this.x -= v.x;
      this.y -= v.y;
      return this;
    };

    Vec2.prototype.sub_ = function(v) {
      return new Vec2(this.x - v.x, this.y - v.y);
    };

    Vec2.prototype.mul = function(v) {
      this.x *= v.x;
      this.y *= v.y;
      return this;
    };

    Vec2.prototype.mul_ = function(v) {
      return new Vec2(this.x * v.x, this.y * v.y);
    };

    Vec2.prototype.div = function(v) {
      this.x /= v.x;
      this.y /= v.y;
      return this;
    };

    Vec2.prototype.div_ = function(v) {
      return new Vec2(this.x / v.x, this.y / v.y);
    };

    Vec2.prototype.scale = function(value) {
      this.x *= value;
      this.y *= value;
      return this;
    };

    Vec2.prototype.scale_ = function(value) {
      return new Vec2(this.x * value, this.y * value);
    };

    Vec2.prototype.length = function() {
      return Math.sqrt(this.x * this.x + this.y * this.y);
    };

    Vec2.prototype.lengthSquared = function() {
      return this.x * this.x + this.y * this.y;
    };

    Vec2.prototype.normalize = function() {
      var l;
      l = this.length();
      if (l !== 0) {
        this.x /= l;
        this.y /= l;
      }
      return this;
    };

    Vec2.prototype.normalize_ = function() {
      return this.clone().normalize();
    };

    Vec2.prototype.normalizeTo = function(length) {
      var magnitude;
      magnitude = Math.sqrt(this.x * this.x + this.y * this.y);
      if (magnitude > 0) {
        magnitude = length / magnitude;
        this.x *= magnitude;
        this.y *= magnitude;
      }
      return this;
    };

    Vec2.prototype.normalizeTo_ = function(length) {
      return this.clone().normalizeTo_(length);
    };

    Vec2.prototype.distance = function(v) {
      return Math.sqrt(this.distanceSquared2(v.x, v.y));
    };

    Vec2.prototype.distanceSquared = function(v) {
      return this.distanceSquared2(v.x, v.y);
    };

    Vec2.prototype.distanceSquared2 = function(x, y) {
      var dx, dy;
      dx = this.x - x;
      dy = this.y - y;
      return dx * dx + dy * dy;
    };

    Vec2.prototype.dot = function(v) {
      return this.x * v.x + this.y * v.y;
    };

    Vec2.prototype.rotate = function(angle) {
      var cosa, rx, ry, sina;
      sina = Math.sin(angle);
      cosa = Math.cos(angle);
      rx = this.x * cosa - this.y * sina;
      ry = this.x * sina + this.y * cosa;
      this.x = rx;
      return this.y = ry;
    };

    Vec2.prototype.jitter = function(amount) {
      this.x += (Math.random() * 2 - 1) * amount;
      this.y += (Math.random() * 2 - 1) * amount;
      return this;
    };

    Vec2.prototype.jitter_ = function(amount) {
      return (new Vec2(this.x, this.y)).jitter(amount);
    };

    Vec2.prototype.lerp = function(target, delta) {
      this.x = this.x * (1 - delta) + target.x * delta;
      this.y = this.y * (1 - delta) + target.y * delta;
      return this;
    };

    Vec2.prototype.lerp_ = function(target, delta) {
      return (new Vec2(this.x, this.y)).lerp(target, delta);
    };

    Vec2.prototype.equals = function(v) {
      return this.x === v.x && this.y === v.y;
    };

    Vec2.prototype.clone = function() {
      return new Vec2(this.x, this.y);
    };

    Vec2.prototype.toString = function() {
      return "Vec2(" + this.x + ", " + this.y + ")";
    };

    return Vec2;

  })();

  Vec3 = (function() {
    Vec3.prototype.x = 0;

    Vec3.prototype.y = 0;

    Vec3.prototype.z = 0;

    function Vec3(x1, y1, z1) {
      this.x = x1 != null ? x1 : 0;
      this.y = y1 != null ? y1 : 0;
      this.z = z1 != null ? z1 : 0;
    }

    Vec3.prototype.set = function(v) {
      this.x = v.x;
      this.y = v.y;
      this.z = v.z;
      return this;
    };

    Vec3.prototype.set3 = function(x, y, z) {
      this.x = x;
      this.y = y;
      this.z = z;
      return this;
    };

    Vec3.prototype.zero = function() {
      this.x = this.y = this.z = 0;
      return this;
    };

    Vec3.prototype.add = function(v) {
      this.x += v.x;
      this.y += v.y;
      this.z += v.z;
      return this;
    };

    Vec3.prototype.add_ = function(v) {
      return new Vec3(this.x + v.x, this.y + v.y, this.z + v.z);
    };

    Vec3.prototype.sub = function(v) {
      this.x -= v.x;
      this.y -= v.y;
      this.z -= v.z;
      return this;
    };

    Vec3.prototype.sub_ = function(v) {
      return new Vec3(this.x - v.x, this.y - v.y, this.z - v.z);
    };

    Vec3.prototype.mul = function(v) {
      this.x *= v.x;
      this.y *= v.y;
      return this;
    };

    Vec3.prototype.mul_ = function(v) {
      return new Vec3(this.x * v.x, this.y * v.y, this.z * v.z);
    };

    Vec3.prototype.div = function(v) {
      this.x /= v.x;
      this.y /= v.y;
      this.z /= v.z;
      return this;
    };

    Vec3.prototype.div_ = function(v) {
      return new Vec3(this.x / v.x, this.y / v.y, this.z = v.z);
    };

    Vec3.prototype.scale = function(value) {
      this.x *= value;
      this.y *= value;
      this.z *= value;
      return this;
    };

    Vec3.prototype.scale_ = function(value) {
      return new Vec3(this.x * value, this.y * value, this.z * value);
    };

    Vec3.prototype.length = function() {
      return Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
    };

    Vec3.prototype.lengthSquared = function() {
      return this.x * this.x + this.y * this.y + this.z * this.z;
    };

    Vec3.prototype.normalize = function() {
      var l;
      l = this.length();
      if (l !== 0) {
        this.x /= l;
        this.y /= l;
        this.z /= l;
      }
      return this;
    };

    Vec3.prototype.normalize_ = function() {
      return this.clone().normalize();
    };

    Vec3.prototype.normalizeTo = function(length) {
      var magnitude;
      magnitude = Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
      if (magnitude > 0) {
        magnitude = length / magnitude;
        this.x *= magnitude;
        this.y *= magnitude;
      }
      return this;
    };

    Vec3.prototype.normalizeTo_ = function(length) {
      return this.clone().normalizeTo_(length);
    };

    Vec3.prototype.distance = function(v) {
      return Math.sqrt(this.distanceSquared3(v.x, v.y, v.z));
    };

    Vec3.prototype.distanceSquared = function(v) {
      return this.distanceSquared3(v.x, v.y, v.z);
    };

    Vec3.prototype.distanceSquared3 = function(x, y, z) {
      var dx, dy, dz;
      dx = this.x - x;
      dy = this.y - y;
      dz = this.z - z;
      return dx * dx + dy * dy + dz * dz;
    };

    Vec3.prototype.dot = function(v) {
      return this.x * v.x + this.y * v.y + this.z * v.z;
    };

    Vec3.prototype.jitter = function(amount) {
      this.x += (Math.random() * 2 - 1) * amount;
      this.y += (Math.random() * 2 - 1) * amount;
      this.z += (Math.random() * 2 - 1) * amount;
      return this;
    };

    Vec3.prototype.jitter_ = function(amount) {
      return (new Vec3(this.x, this.y, this.z)).jitter(amount);
    };

    Vec3.prototype.lerp = function(target, delta) {
      this.x = this.x * (1 - delta) + target.x * delta;
      this.y = this.y * (1 - delta) + target.y * delta;
      this.z = this.z * (1 - delta) + target.z * delta;
      return this;
    };

    Vec3.prototype.lerp_ = function(target, delta) {
      return (new Vec3(this.x, this.y, this.z)).lerp(target, delta);
    };

    Vec3.prototype.equals = function(v) {
      return this.x === v.x && this.y === v.y && this.z === v.z;
    };

    Vec3.prototype.clone = function() {
      return new Vec3(this.x, this.y, this.z);
    };

    Vec3.prototype.toString = function() {
      return "Vec3(" + this.x + ", " + this.y + ", " + this.z + ")";
    };

    return Vec3;

  })();

  module.exports = {
    Vec2: Vec2,
    Vec3: Vec3
  };

}).call(this);
