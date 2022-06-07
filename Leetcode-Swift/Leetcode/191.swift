//
//  191.number-of-1-bits.swift
//  Leetcode-Swift
//
//  Created by devcz on 2021/4/18.
//

import Foundation

/*
 191. 位1的个数 (简单)
 https://leetcode-cn.com/problems/number-of-1-bits/
 */

class Solution191 {
    /// x & (x - 1)可以去掉最右侧的1
    func hammingWeight(_ n: Int) -> Int {
        var ans = 0
        var n = n
        
        while n != 0 {
            n &= (n - 1)
            ans += 1
        }
        
        return ans
    }
}
