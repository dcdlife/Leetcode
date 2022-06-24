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
    // MARK: - x & (x - 1)可以去掉最右侧的1（无法针对负数做处理）
    func hammingWeight(_ n: Int) -> Int {
        var ans = 0
        var n = n
        
        while n != 0 {
            n &= (n - 1)
            ans += 1
        }
        
        return ans
    }
    
    // MARK: - 考虑负数
    func hammingWeight_v2(_ n: Int) -> Int {
        var ans = 0
        var mask = 1
        
        for _ in 0..<32 {
            if n & mask != 0 {
                ans += 1
            }
            
            mask <<= 1
        }
        
        return ans
    }
}
