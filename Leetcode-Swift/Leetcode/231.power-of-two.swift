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
    
    /*
     测试用例：
     1. 1；2；4；6
     2. 小于等于0
     */
    func test() {
        print(isPowerOfTwo(1))
        print(isPowerOfTwo(2))
        print(isPowerOfTwo(3))
        print(isPowerOfTwo(4))
        print(isPowerOfTwo(6))
        print(isPowerOfTwo(8))
        print(isPowerOfTwo(15))
        print(isPowerOfTwo(16))
        print(isPowerOfTwo(0))
        print(isPowerOfTwo(-1))
    }
}
