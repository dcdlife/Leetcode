//
//  05_162_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/8/23.
//

import Foundation

/*
 162. 寻找峰值 (中等)
 https://leetcode-cn.com/problems/find-peak-element/
 */

class Solution_05_162_Day20Plan {
    // 迭代二分查找
    func findPeakElement(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return -1
        }
        
        var l = 0
        var r = nums.count - 1
        while l < r {
            let m = l + (r - l) >> 1
            if nums[m] > nums[m + 1] {
                r = m
            } else {
                l = m + 1
            }
        }
        
        return l
    }
    
    func test() {
        print(findPeakElement([1,2,3,1]))
        print(findPeakElement([1,2,1,3,5,6,4]))
    }
}
