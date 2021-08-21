//
//  367.valid-perfect-square.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/4/17.
//

import Foundation

/*
 367. 有效的完全平方数 (简单)
 https://leetcode-cn.com/problems/valid-perfect-square/
 */

class Solution367 {
    func isPerfectSquare(_ num: Int) -> Bool {
        if num < 0 {
            return false
        }
        var left = 0, right = num
        while left <= right {
            let mid = left + (right - left) / 2
            let square = mid * mid
            if square == num {
                return true
            } else if square < num {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return false
    }
    
    /*
     测试用例：
     1. 1；可被完全平方；不可被完全平方
     2. 0；小数
     */
    func test() {
        print(isPerfectSquare(1))
        print(isPerfectSquare(4))
        print(isPerfectSquare(9))
        print(isPerfectSquare(16))
        print(isPerfectSquare(2))
        print(isPerfectSquare(7))
        print(isPerfectSquare(15))
        print(isPerfectSquare(-4))
        print(isPerfectSquare(-5))
    }
}
