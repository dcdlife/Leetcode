//
//  04_153_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/8/23.
//

import Foundation

/*
 153. 寻找旋转排序数组中的最小值 (中等)
 https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array/
 */

class Solution_04_153_Day20Plan {
    func findMin(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return -1
        }
        
        let len = nums.count
        if nums[0] <= nums[len - 1] {
            return nums[0]
        }
        
        var ans = nums[0]
        var l = 0
        var r = len - 1
        
        while l <= r {
            let m = l + (r - l) >> 1
            let val = nums[m]
            ans = min(ans, val)
            if val < nums[0] { // m在右侧递增区间
                r = m - 1
            } else { // m在左侧递增区间
                l = m + 1
            }
        }

        return ans
    }
    
    func test() {
        print(findMin([1]))
        print(findMin([1,2,3]))
        print(findMin([3,2,1]))
        print(findMin([4,5,1,2,3]))
        print(findMin([4,5,6,1,2,3]))
        print(findMin([3,4,5,1,2]))
        print(findMin([4,5,6,7,0,1,2]))
        print(findMin([11,13,15,17]))
    }
}
