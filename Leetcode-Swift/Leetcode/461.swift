//
//  461.swift
//  Leetcode-Swift
//
//  Created by devcz on 2022/6/8.
//

import Foundation

/*
 461. 汉明距离 (简单)
 https://leetcode.cn/problems/hamming-distance/
 */

class Solution_461 {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var xorVal = x ^ y
        var ans = 0

        while xorVal != 0 {
            xorVal &= (xorVal - 1)
            ans += 1
        }

        return ans
    }
}
