//
//  17.04.swift
//  Leetcode-Swift
//
//  Created by devcz on 2022/6/10.
//

import Foundation

/*
 面试题 17.04. 消失的数字 (简单)
 https://leetcode.cn/problems/missing-number-lcci/
 */

class Solution_17_04 {
    func missingNumber(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var xorVal = 0
        for i in 1...nums.count {
            xorVal ^= i
            xorVal ^= nums[i - 1]
        }

        return xorVal
    }
}
