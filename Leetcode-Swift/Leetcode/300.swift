//
//  300.longest-increasing-subsequence.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/4/21.
//

import Foundation

/*
 300. 最长递增子序列 (中等)
 https://leetcode-cn.com/problems/longest-increasing-subsequence/
 */

class Solution300 {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var counts = [Int](repeating: 1, count: nums.count)
        for i in 1..<nums.count {
            var ascendCount = 1
            var left = 0, right = i - 1
            while left <= right {
                let mid = left + (right - left) / 2
                if nums[mid] < nums[i] {
                    ascendCount = max(counts[mid] + 1, ascendCount)
                    left = mid + 1
                } else {
                    left += 1
                }
            }
            counts[i] = ascendCount
        }
        return counts.max()!
    }
    
    /// DP：两次遍历  O(n^2)
    func lengthOfLIS_2iteration(_ nums: [Int]) -> Int {
            if nums.count == 0 {
                return 0
            }
            var counts = [Int](repeating: 1, count: nums.count)
            for i in 1..<nums.count {
                var ascendCount = 1
                for j in 0...i-1 {
                    if nums[j] < nums[i] {
                        ascendCount = max(counts[j] + 1, ascendCount)
                    }
                }
                counts[i] = ascendCount
            }
            return counts.max()!
        }
    
    func test() {
        print(lengthOfLIS([10,9,2,5,3,7,101,18]))
        print(lengthOfLIS([0,1,0,3,2,3]))
        print(lengthOfLIS([7,7,7]))
    }
}
