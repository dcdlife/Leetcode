//
//  01_34_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/8/22.
//

import Foundation

/*
 34. 在排序数组中查找元素的第一个和最后一个位置 (中等)
 https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/
 */

class Solution_01_34_Day20Plan {
    
    // 优化
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.isEmpty {
            return [-1, -1]
        }
        
        var ans = [-1, -1]
        func binarySearch(_ nums: [Int], _ target: Int, _ isFindStart: Bool) -> Int {
            var l = 0
            var r = nums.count - 1
            var ans = nums.count // ans为nums.count（可以代入案例：nums=[1],target=1进行思考）
            while l <= r {
                let m = l + (r - l) >> 1
                let val = nums[m]
                if val > target || (isFindStart && (val >= target)) {
                    ans = m
                    r = m - 1
                } else {
                    l = m + 1
                }
            }
            
            // 判断ans的索引是否有效
            if !isFindStart {
                ans = ans - 1
            }
            if ans < 0 || ans >= nums.count {
                return -1
            }
            
            return nums[ans] == target ? ans : -1
        }
        
        ans[0] = binarySearch(nums, target, true)
        ans[1] = binarySearch(nums, target, false)

        return ans
    }
        
    // 初版
    func searchRange_1(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.isEmpty {
            return [-1, -1]
        }
        
        var ans = [-1, -1]
        func binarySearch(_ nums: [Int], _ target: Int, _ isFindStart: Bool) -> Int {
            var l = 0
            var r = nums.count - 1
            var ans = r
            if isFindStart {
                while l <= r {
                    let m = l + (r - l) >> 1
                    let val = nums[m]
                    if val >= target {
                        ans = m
                        r = m - 1
                    } else {
                        l = m + 1
                    }
                }
            } else {
                while l <= r {
                    let m = l + (r - l) >> 1
                    let val = nums[m]
                    if val <= target {
                        ans = m
                        l = m + 1
                    } else {
                        r = m - 1
                    }
                }
            }
            
            return nums[ans] == target ? ans : -1
        }
        
        ans[0] = binarySearch(nums, target, true)
        ans[1] = binarySearch(nums, target, false)

        return ans
    }
    
    func test() {
        assert(searchRange([1], 0) == [-1, -1])
        assert(searchRange([2,2], 3) == [-1,-1])
        assert(searchRange([5,7,7,8,8,10], 8) == [3, 4])
        assert(searchRange([5,7,7,8,8,10], 6) == [-1, -1])
        assert(searchRange([], 0) == [-1, -1])
        print("success")
    }
}
