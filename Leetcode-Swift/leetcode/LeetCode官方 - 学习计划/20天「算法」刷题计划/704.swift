//
//  704.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/8/9.
//

import Foundation

/*
 704. 二分查找 (简单)
 https://leetcode-cn.com/problems/binary-search/
 */

class Solution_704 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty {
            return -1
        }
        
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) >> 1
            let val = nums[mid]
            if val == target {
                return mid
            } else if (val > target) {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return -1
    }
    
    func test() {
        print(search([-1,0,3,5,9,12], -1))
        print(search([-1,0,3,5,9,12], 3))
        print(search([-1,0,3,5,9,12], 5))
        print(search([-1,0,3,5,9,12], 9))
        print(search([-1,0,3,5,9,12], 12))
        print(search([-1,0,3,5,9,12], 15))
        print(search([-1,0,3,4,5,9,12], -1))
        print(search([-1,0,3,4,5,9,12], 4))
        print(search([-1,0,3,4,5,9,12], 3))
        print(search([-1,0,3,4,5,9,12], 5))
        print(search([-1,0,3,4,5,9,12], 9))
        print(search([-1,0,3,4,5,9,12], 12))
        print(search([-1,0,3,4,5,9,12], 15))
    }
}
