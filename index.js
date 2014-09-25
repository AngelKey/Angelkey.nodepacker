// Generated by IcedCoffeeScript 1.7.1-g
(function() {
  var assert, bufferify, compress, pack, unbufferify, uncompress, unpack, _ref;

  assert = require('assert');

  _ref = require('purepack'), pack = _ref.pack, unpack = _ref.unpack;

  bufferify = function(o) {
    var d2, e, k, typ, v, _i, _len, _results;
    typ = typeof o;
    switch (typ) {
      case 'string':
        if ((o.length % 2 === 0) && o.match(/^[A-Fa-f0-9]+$/)) {
          return new Buffer(o, 'hex');
        } else {
          return o;
        }
        break;
      case 'object':
        if (Array.isArray(o)) {
          _results = [];
          for (_i = 0, _len = o.length; _i < _len; _i++) {
            e = o[_i];
            _results.push(bufferify(e));
          }
          return _results;
        } else if (o === null) {
          return null;
        } else {
          d2 = {};
          for (k in o) {
            v = o[k];
            d2[k] = bufferify(v);
          }
          return d2;
        }
        break;
      default:
        return o;
    }
  };

  unbufferify = function(o) {
    var d2, e, k, v, _i, _len, _results;
    if (typeof o !== 'object') {
      return o;
    } else if (Array.isArray(o)) {
      _results = [];
      for (_i = 0, _len = o.length; _i < _len; _i++) {
        e = o[_i];
        _results.push(unbufferify(e));
      }
      return _results;
    } else if (o === null) {
      return null;
    } else if (Buffer.isBuffer(o)) {
      return o.toString('hex');
    } else {
      d2 = {};
      for (k in o) {
        v = o[k];
        d2[k] = unbufferify(v);
      }
      return d2;
    }
  };

  compress = function(o) {
    return pack(bufferify(o));
  };

  uncompress = function(o) {
    return unbufferify(unpack(o));
  };

  module.exports = {
    bufferify: bufferify,
    unbufferify: unbufferify,
    compress: compress,
    uncompress: uncompress
  };

}).call(this);
