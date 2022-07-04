//
//  198.swift
//  Leetcode-Swift
//
//  Created by 95cc on 2022/5/22.
//

import Foundation

/*
 198. 打家劫舍 (中等)
 https://leetcode.cn/problems/house-robber/
 */

class Solution_198 {
    // MARK: - 动态规划
    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }

        var dp = [Int](repeating: 0, count: nums.count)
        dp[0] = nums[0]
        dp[1] = max(dp[0], nums[1])

        for i in 2..<nums.count {
            dp[i] = max(nums[i] + dp[i - 2], dp[i - 1])
        }

        return dp[nums.count - 1]
    }

    // MARK: - 动态规划 (优化) (滚动数组思路)
    func rob_v2(_ nums: [Int]) -> Int {
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
