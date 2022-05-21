//
//  198.swift
//  Leetcode-Swift
//
//  Created by yefeng on 2022/5/22.
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

        var dp = [Int](repeating: 0, count: nums.count)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])

        for i in 2..<nums.count {
            dp[i] = max(dp[i - 1], nums[i] + dp[i - 2])
        }

        return dp.last!
    }
}
