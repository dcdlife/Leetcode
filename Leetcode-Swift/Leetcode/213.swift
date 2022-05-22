//
//  213.swift
//  Leetcode-Swift
//
//  Created by yefeng on 2022/5/22.
//

import Foundation

/*
 213. 打家劫舍 II (中等)
 https://leetcode.cn/problems/house-robber-ii/
 */

class Solution_213 {
    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }

        let count = nums.count
        let ans1 = robRange(nums, 0, count - 1)
        let ans2 = robRange(nums, 1, count)

        return max(ans1, ans2)
    }

    func robRange(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
        var first = nums[start]
        var second = max(first, nums[start + 1])

        for i in (start + 2)..<end {
            let newSecond = max(first + nums[i], second)
            first = second
            second = newSecond
        }

        return second
    }
}
