//
//  05.06.swift
//  Leetcode-Swift
//
//  Created by devcz on 2022/6/8.
//

import Foundation

/*
 面试题 05.06. 整数转换 (简单)
 https://leetcode.cn/problems/convert-integer-lcci/
 */

class Solution_05_06 {
    func convertInteger(_ A: Int, _ B: Int) -> Int {
        if A == B {
            return 0
        }

        var xorVal = A ^ B
        var ans = 0

        while xorVal != 0 {
            if xorVal == Int32.min {
                ans += 1
                break
            }

            xorVal &= (xorVal - 1)
            ans += 1
        }

        return ans
    }
}
