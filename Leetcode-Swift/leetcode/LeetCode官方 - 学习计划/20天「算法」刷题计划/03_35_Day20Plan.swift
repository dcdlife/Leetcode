//
//  35_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/8/9.
//

import Foundation

/*
 35. 搜索插入位置 (简单)
 https://leetcode-cn.com/problems/search-insert-position/
 */

class Solution_35_Day20Plan {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var left = 0
        var right = nums.count - 1
        
//        while left <= right {
//            let mid = left + (right - left) >> 1
//            let val = nums[mid]
//            if val == target {
//                return mid
//            } else if val > target {
//                right = mid - 1
//            } else {
//                left = mid + 1
//            }
//        }
//        return left
        
        var ans = nums.count
        while left <= right {
            let mid = left + (right - left) >> 1
            let val = nums[mid]
            if val >= target {
                ans = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return ans
    }
    
    func test() {
        print(searchInsert([1,3,5,6], 3))
        print(searchInsert([1,3,5,6], 0))
        print(searchInsert([1,3,5,6], 4))
        print(searchInsert([1,3,5,6], 7))
        print(searchInsert([1,3,5,6], 6))
    }
}
