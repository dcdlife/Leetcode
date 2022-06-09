//
//  05.07.swift
//  Leetcode-Swift
//
//  Created by devcz on 2022/6/9.
//

import Foundation

/*
 面试题 05.07. 配对交换 (简单)
 https://leetcode.cn/problems/exchange-lcci/
 */

class Solution_05_07 {
    func exchangeBits(_ num: Int) -> Int {
        var num = num
        var count = 0
        var odd = 1
        var even = 1 << 1

        while count < 16 {
            let oddVal = num & odd
            let evenVal = num & even

            if oddVal == 0 {
                num &= (~even)
            } else {
                num |= (even)
            }

            if evenVal == 0 {
                num &= (~odd)
            } else {
                num |= (odd)
            }

            count += 1
            odd <<= 2
            even <<= 2
        }

        return num
    }
}
