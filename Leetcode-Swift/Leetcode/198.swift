//
//  198.swift
//  Leetcode-Swift
//
//  Created by devcz on 2022/5/22.
//

import Foundation

/*
 198. 打家劫舍 (中等)
 https://leetcode.cn/problems/house-robber/
 */

class Solution_198 {
    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }

        var first = nums[0]
        var second = max(first, nums[1])

        for i in 2..<nums.count {
            let newSecond = max(first + nums[i], second)
            first = second
            second = newSecond
        }

        return second
    }
}
