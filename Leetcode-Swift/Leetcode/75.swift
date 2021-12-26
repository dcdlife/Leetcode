//
//  75.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/12/26.
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

        var left = 0
        var right = nums.count - 1

        // 先排序蓝色的
        while left < right {
            while left < right && nums[left] != 2 {
                left += 1
            }
            while left < right && nums[right] == 2 {
                right -= 1
            }
            if left < right {
                swap(&nums, left, right)

                left += 1
                right -= 1
            }
        }

        // 寻找新的right
        if left == right {
            if nums[left] == 2 {
                right -= 1
            }
        }

        // 新的left从索引0开始
        left = 0

        // 排序红色和白色
        while left < right {
            while left < right && nums[left] == 0 {
                left += 1
            }
            while left < right && nums[right] == 1 {
                right -= 1
            }
            if left < right {
                swap(&nums, left, right)

                left += 1
                right -= 1
            }
        }
    }
    
    func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
        let tmp = nums[i]
        nums[i] = nums[j]
        nums[j] = tmp
    }
}
