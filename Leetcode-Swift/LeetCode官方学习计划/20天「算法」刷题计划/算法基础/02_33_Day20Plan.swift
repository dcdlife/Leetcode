//
//  02_33_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/8/22.
//

import Foundation

/*
 33. 搜索旋转排序数组 (中等)
 https://leetcode-cn.com/problems/search-in-rotated-sorted-array/
 */

class Solution_02_33_Day20Plan {
    func search(_ nums: [Int], _ target: Int) -> Int {
        let len = nums.count
        var l = 0
        var r = nums.count - 1
        while l <= r {
            let m = l + (r - l) >> 1
            let val = nums[m]
            if val == target {
                return m
            }
            if nums[0] > val { // m在右侧递增区间
                if target > val && target <= nums[len - 1] {
                    l = m + 1
                } else {
                    r = m - 1
                }
            } else { // m在左侧递增区间
                if target < val && target >= nums[0] {
                    r = m - 1
                } else {
                    l = m + 1
                }
            }
        }
        
        return -1
    }
    
    func test() {
        assert(search([4,5,6,7,0,1,2], 0) == 4)
        assert(search([4,5,6,7,0,1,2], 3) == -1)
        assert(search([1], 0) == -1)
        print("success")
    }
}
