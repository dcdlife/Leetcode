//
//  189.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/8/10.
//

import Foundation

/*
 189. 旋转数组 (中等)
 https://leetcode-cn.com/problems/rotate-array/
 
 方法：
 法一：遍历数组，将每个元素重新放到 (i + k) % 数组长度（需要使用额外的数组）
 法二：三次翻转数组
    1. 翻转 0 - n-1
    2. 翻转 0 - ((k % n)-1)
    3. 翻转 k - n-1
 */

class Solution_189 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let len = nums.count
        let k = k % len
        
        if len > 0 && k > 0 {
            func reverse(_ start: Int, _ end: Int) {
                var start = start
                var end = end
                while start < end {
                    nums.swapAt(start, end)
                    start += 1
                    end -= 1
                }
            }
            
            reverse(0, len - 1)
            reverse(0, k - 1)
            reverse(k, len - 1)
        }
    }
    
    func rotate_1(_ nums: inout [Int], _ k: Int) {
        let len = nums.count
        if len > 0 && k > 0 {
            var ans = nums
            for i in 0..<len {
                ans[(i + k) % len] = nums[i]
            }
            nums = ans
        }
    }
    
    func test() {
        var nums = [1,2,3,4,5,6,7]
        
        rotate(&nums, 1)
        print(nums)
    }
}
