//
//  494.swift
//  Leetcode-Swift
//
//  Created by yefeng on 2022/5/17.
//

import Foundation

/*
 494. 目标和 (中等)
 https://leetcode.cn/problems/target-sum/
 */

class Solution_494 {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty {
            return 0
        }

        let sum = nums.reduce(0) { pre, i in
            return pre + abs(i)
        }
        if sum < target || (-sum) > target {
            return 0
        }

        var dp = [[Int]](repeating: [Int](repeating: 0, count: sum * 2 + 1), count: nums.count)

        /*
        这种写法提交报错，如果nums[0]是0的情况下，在选和不选的情况下都是0，因此应该是2次
        dp[0][sum + nums[0]] = 1
        dp[0][sum + (-nums[0])] = 1
        */
        dp[0][sum + nums[0]] += 1
        dp[0][sum + (-nums[0])] += 1

        for i in 1..<nums.count {
            for j in -sum...sum {
                let colIndex = sum + j
                let upVal = dp[i - 1][colIndex]
                if upVal != 0 {
                    let sum1 = nums[i] + j
                    let sum2 = -nums[i] + j
                    let index1 = sum + sum1
                    let index2 = sum + sum2
                    dp[i][index1] = dp[i][index1] + upVal
                    dp[i][index2] = dp[i][index2] + upVal
                }
            }
        }
print(dp)
        return dp[nums.count - 1][target + sum]
    }
}
