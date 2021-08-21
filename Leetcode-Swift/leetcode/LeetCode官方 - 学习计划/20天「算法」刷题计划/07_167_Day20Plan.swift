//
//  167_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/8/11.
//

import Foundation

/*
 167. 两数之和 II - 输入有序数组 (简单)
 https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted/
 */

class Solution_167_Day20Plan {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0, right = numbers.count - 1
        var sum = numbers[left] + numbers[right]
        
        while left < right {
            if sum == target {
                return [left + 1, right + 1]
            } else if (sum > target) {
                sum -= numbers[right]
                right -= 1
                sum += numbers[right]
            } else {
                sum -= numbers[left]
                left += 1
                sum -= numbers[left]
            }
        }
        return []
    }
    
    func test() {
        print(twoSum([2,7,11,15], 9))
        print(twoSum([2,3,4], 6))
        print(twoSum([-1,0], -1))
    }
}
