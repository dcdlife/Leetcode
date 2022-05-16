//
//  416.swift
//  Leetcode-Swift
//
//  Created by yefeng on 2022/5/16.
//

import Foundation

/*
 416. 分割等和子集 (中等)
 https://leetcode.cn/problems/partition-equal-subset-sum/
 */

class Solution_416 {
    func canPartition(_ nums: [Int]) -> Bool {
        if nums.isEmpty || nums.count < 2 {
            return false
        }

        var maxNum = 0
        let sum = nums.reduce(0) {pre, i in
            maxNum = max(i, maxNum)
            return pre + i
        }
        if sum & 1 == 1 {
            return false
        }

        let target = sum / 2
        if maxNum > target {
            return false
        }

        var dp = [[Bool]](repeating: [Bool](repeating: false, count: target + 1), count: nums.count)

        for i in 0..<nums.count {
            dp[i][0] = true
        }
        dp[0][nums[0]] = true

        for i in 1..<nums.count {
            let num = nums[i]
            for j in 1...target {
                if j < num {
                    dp[i][j] = dp[i - 1][j]
                } else {
                    dp[i][j] = dp[i - 1][j] || dp[i - 1][j - num]
                }
            }
        }

        return dp[nums.count - 1][target]
    }
}
