//
//  231.power-of-two.swift
//  Leetcode-Swift
//
//  Created by devcz on 2021/4/18.
//

import Foundation

/*
 231. 2的幂 (简单)
 https://leetcode-cn.com/problems/power-of-two/)
 */

class Solution231 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        return (n > 0) && (n & (n - 1) == 0)
    }
}
