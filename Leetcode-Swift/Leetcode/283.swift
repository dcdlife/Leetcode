//
//  283.swift
//  Leetcode-Swift
//
//  Created by devcz on 2022/6/1.
//

import Foundation

/*
 283. 移动零 (简单)
 https://leetcode.cn/problems/move-zeroes/
 */

class Solution_283 {
    func moveZeroes(_ nums: inout [Int]) {
        let count = nums.count
        var left = 0
        
        for right in 0..<count {
            if nums[right] != 0 {
                nums.swapAt(left, right)
                left += 1
            }
        }
    }
    
    func moveZeroes_v1(_ nums: inout [Int]) {
        if nums.isEmpty {
            return
        }

        let count = nums.count
        var left = 0
        var right = 0

        while left < count || right < count {
            while (left < count) && (nums[left] != 0) {
                left += 1
                right = left
            }
            while (right < count) && (nums[right] == 0) {
                right += 1
            }

            if left == count || right == count {
                break
            }

            nums.swapAt(left, right)
            left += 1
            right += 1
        }
    }
}
