//
//  69.sqrtx.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/4/17.
//

import Foundation

/*
 69. x 的平方根 (简单)
 https://leetcode-cn.com/problems/sqrtx/
 */

/*
 1. 二分查找
 2. 袖珍计算器算法: https://leetcode-cn.com/problems/sqrtx/solution/x-de-ping-fang-gen-by-leetcode-solution/
 3. 牛顿迭代: https://leetcode-cn.com/problems/sqrtx/solution/x-de-ping-fang-gen-by-leetcode-solution/
 */
class Solution69 {
    func mySqrt(_ x: Int) -> Int {
        var left: Int = 1, right: Int = x
        var ans = 0
        while left <= right {
            let mid = left + (right - left) / 2
            if mid * mid <= x {
                ans = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return ans
    }
    
    /*
     测试用例
     1. 1、4、5等能被正好开平方或者不能正好被开平方的
     2. 0
     */
    func test() {
        print(sqrt(1))
        print(sqrt(2))
        print(sqrt(4))
        print(sqrt(5))
        print(sqrt(0))
    }
}
