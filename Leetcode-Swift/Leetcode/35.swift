//
//  35.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/12/28.
//

import Foundation

/*
 35. 搜索插入位置 (简单)
 https://leetcode-cn.com/problems/search-insert-position/
 
 推荐题解：
 1. https://leetcode-cn.com/problems/search-insert-position/solution/sou-suo-cha-ru-wei-zhi-by-leetcode-solution/
 */

class Solution_35 {
    
    // 代码多，但是更好理解
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count - 1

        while low <= high {
            let mid = low + (high - low) / 2

            if nums[mid] == target {
                return mid
            } else if (nums[mid] > target) {
                if mid == 0 || (nums[mid - 1] < target) {
                    return mid
                } else {
                    high = mid - 1
                }
            } else {
                if mid == (nums.count - 1) {
                    return nums.count
                } else {
                    low = mid + 1
                }
            }
        }

        return -1
    }

    // 代码简洁
    func searchInsert_1(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        var ans = nums.count // 默认插入的索引为最后
        while left <= right {
            let mid = left + (right - left) >> 1
            let val = nums[mid]
            if val >= target {
                // 题目给了一个前提：数组中没有重复元素，这很重要，因此我们只需要找到第一个大于等于target的值的索引即可。
                // 如果val=target，那么mid刚好就是目标值的索引；如果数组中没有target，那么寻找第一个大于target的值所在的索引，即这个数要插入的索引
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
