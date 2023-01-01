/*
  29. 两数相除
  https://leetcode.cn/problems/divide-two-integers/
*/


/**
 * @param {number} dividend
 * @param {number} divisor
 * @return {number}
 */
 var divide = function(dividend, divisor) {
  if (dividend == 0 || divisor == 0) {
      return 0
  }

  let isPositiveResult = ((dividend > 0) && (divisor > 0)) || ((dividend < 0) && (divisor < 0))
  dividend = dividend > 0 ? dividend : -dividend
  divisor = divisor > 0 ? divisor : -divisor

  let result = 0
  if (divisor == 1) {
    result = dividend
  } else {
    function _divide(a, b) {
      if (a < b) return 0

      let count = 1
      let add = b
      while ((add + add) <= a) {
        count += count
        add += add
      }

      return count + _divide(a - add, b)
    }
    
    result = _divide(dividend, divisor)
  }

  result = isPositiveResult ? result : -result
  if (result > (Math.pow(2, 31) - 1)) {
      result = Math.pow(2, 31) - 1
  }

  return result
};


/**
 * @param {number} dividend
 * @param {number} divisor
 * @return {number}
 */
 var divide_v1 = function(dividend, divisor) {
  if (dividend == 0 || divisor == 0) {
      return 0
  }

  let isPositiveResult = ((dividend > 0) && (divisor > 0)) || ((dividend < 0) && (divisor < 0))
  dividend = Math.abs(dividend)
  divisor = Math.abs(divisor)

  let result = 0
  if (divisor != 1) {
      const maxLoops = dividend
      for (let i = 0; i < maxLoops; i++) {
          if (dividend < divisor) {
              break
          }
          dividend -= divisor
          result += 1
      }
  } else {
      result = dividend
  }

  result = isPositiveResult ? result : -result
  if (result > (Math.pow(2, 31) - 1)) {
      result = Math.pow(2, 31) - 1
  }

  return result
};