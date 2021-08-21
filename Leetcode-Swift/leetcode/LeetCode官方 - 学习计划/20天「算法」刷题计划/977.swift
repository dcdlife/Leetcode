//
//  977.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/8/10.
//

import Foundation

/*
 977. 有序数组的平方 (简单)
 https://leetcode-cn.com/problems/squares-of-a-sorted-array/
 */

class Solution_977 {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        if nums.isEmpty {
            return []
        }
        
        let len = nums.count
        var ans = [Int](repeating: 0, count: len)
        
        var left = 0
        var right = len - 1
        var index = right
        while left <= right {
            let leftVal = nums[left] * nums[left]
            let rightVal = nums[right] * nums[right]
            if leftVal >= rightVal {
                ans[index] = leftVal
                left += 1
            } else {
                ans[index] = rightVal
                right -= 1
            }
            index -= 1
        }
        
        return ans
    }
    
    func test() {
        print(sortedSquares([-4,-1,0,3,10]))
        print(sortedSquares([-7,-3,2,3,11]))
        
        print(sortedSquares([0,1,2,3]))
        print(sortedSquares([-5,-3,-2,-1]))
        print(sortedSquares([-5,-3,-2,0]))
    }
}
