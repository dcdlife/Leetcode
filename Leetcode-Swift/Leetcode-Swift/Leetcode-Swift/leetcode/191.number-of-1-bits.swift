//
//  191.number-of-1-bits.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/4/18.
//

import Foundation

/*
 191. 位1的个数 (简单)
 https://leetcode-cn.com/problems/number-of-1-bits/
 */

/*
 思路：
 1. 取模2，循环32次，判断取模是否为1，然后对数字进行右移
 2. 位运算方法：
    x & (x - 1)可以去掉最右侧的1
 */
class Solution191 {
    func hammingWeight(_ n: Int) -> Int {
        var ans = 0
        var n = n
        while n != 0 {
            n = n & (n - 1)
            ans += 1
        }
        return ans
    }
    
    /*
     测试用例：
     1. 0b0；0b1；0b1111；
     2. 特殊：32位1
     */
    func test() {
        print(hammingWeight(0b0))
        print(hammingWeight(0b1))
        print(hammingWeight(0b11))
        print(hammingWeight(0b101001))
        print(hammingWeight(0b11111111111111111111111111111111))
    }
}
