//
//  852.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/12/30.
//

import Foundation

/*
 852. 山脉数组的峰顶索引 (简单)
 https://leetcode-cn.com/problems/peak-index-in-a-mountain-array/
 */

class Solution_852 {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        // 参数校验
        if arr.count < 3 {
            return -1
        }

        var low = 0
        var high = arr.count - 1
        // 提前定义答案索引
        var ans = 0

        while low <= high {
            let mid = low + (high - low) / 2
            if arr[mid] > arr[mid + 1] {
                ans = mid
                high = mid - 1
            } else {
                low = mid + 1
            }
        }

        return ans
    }
}
