//
//  75.swift
//  Leetcode-Swift
//
//  Created by devcz on 2021/12/26.
//

import Foundation

/*
 75. 颜色分类 (中等)
 https://leetcode-cn.com/problems/sort-colors/
 */

class Solution_75 {
    func sortColors(_ nums: inout [Int]) {
        if nums.isEmpty {
            return
        }

        var partition = sortColorsCore(&nums, 0, nums.count - 1) { $0 == 0 }
        if nums[partition] == 0 {
            partition += 1
        }
        let _ = sortColorsCore(&nums, partition, nums.count - 1) { $0 == 1 }
    }

    func sortColorsCore(_ nums: inout [Int], _ left: Int, _ right: Int, _ conditionFn: (Int) -> Bool) -> Int {
        var left = left
        var right = right

        while left < right {
            if conditionFn(nums[left]) {
                left += 1
                continue
            }
            if !conditionFn(nums[right]) {
                right -= 1
                continue
            }
            
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }

        return left
    }
}
