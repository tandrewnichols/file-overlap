(function() {
  var isNode = typeof module !== 'undefined' && this.module !== module;

  var iterator = function(a, b, func) {
    var aParts = a.split('/');
    var bParts = b.split('/');
    var res = [];
    for (var i = 0; i < aParts.length; i++) {
      var message = func(res, aParts, bParts, i);
      if (message === 'break') {
        break;
      }
    }
    return res.join('/');
  };

  var overlap = function(a, b) {
    if (!a || !b) return '';
    return iterator(a, b, function(memo, aParts, bParts, i) {
      if (bParts.indexOf(aParts[i]) > -1) {
        memo.push(aParts[i]);
      }
    });
  };

  var difference = function(a, b) {
    if (!a && !b) return '';
    if (!a) return b;
    if (!b) return a;
    return iterator(a, b, function(memo, aParts, bParts, i) {
      if (bParts.indexOf(aParts[i]) === -1) {
        memo.push(aParts[i]);
      } else if (memo.length) {
        return 'break';
      }
    });
  };

  var differenceRight = function(path1, path2) {
    return difference(path2, path1);
  };

  var obj = {
    overlap: overlap,
    difference: difference,
    differenceRight: differenceRight
  };

  /* istanbul ignore else */
  if (isNode) {
    module.exports = obj;
  } else {
    window.fileOverlap = obj;
  }
})();
