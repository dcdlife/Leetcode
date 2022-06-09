//
//  05.01.swift
//  Leetcode-Swift
//
//  Created by devcz on 2022/6/9.
//

import Foundation

/*
 面试题 05.01. 插入 (简单)
 https://leetcode.cn/problems/insert-into-bits-lcci/
 */

class Solution_05_01 {
    func insertBits(_ N: Int, _ M: Int, _ i: Int, _ j: Int) -> Int {
        var N = N
        for k in i...j {
            let cur = M & (1 << (k - i))
            if cur == 0 {
                N &= ~(1 << k)
            } else {
                N |= (1 << k)
            }
        }

        return N
    }
}
