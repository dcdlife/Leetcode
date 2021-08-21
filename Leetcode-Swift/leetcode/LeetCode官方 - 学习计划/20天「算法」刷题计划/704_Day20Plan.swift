//
//  704_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/8/9.
//

import Foundation

/*
 704. 二分查找 (简单)
 https://leetcode-cn.com/problems/binary-search/
 */

class Solution_704_Day20Plan {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) >> 1
            if nums[mid] == target {
                return mid
            } else if (nums[mid] > target) {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return -1
    }
    
    func test() {
        assert(search([-1,0,3,5,9,12], -1) == 0)
        assert(search([-1,0,3,5,9,12], 3) == 2)
        assert(search([-1,0,3,5,9,12], 5) == 3)
        assert(search([-1,0,3,5,9,12], 9) == 4)
        assert(search([-1,0,3,5,9,12], 12) == 5)
        assert(search([-1,0,3,5,9,12], 15) == -1)
        assert(search([-1,0,3,4,5,9,12], -1) == 0)
        assert(search([-1,0,3,4,5,9,12], 4) == 3)
        assert(search([-1,0,3,4,5,9,12], 3) == 2)
        assert(search([-1,0,3,4,5,9,12], 5) == 4)
        assert(search([-1,0,3,4,5,9,12], 9) == 5)
        assert(search([-1,0,3,4,5,9,12], 12) == 6)
        assert(search([-1,0,3,4,5,9,12], 15) == -1)
        print("success")
    }
}
