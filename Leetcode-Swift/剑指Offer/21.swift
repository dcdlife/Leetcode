//
//  21.diao-zheng-shu-zu-shun-xu-shi-qi-shu-wei-yu-ou-shu-qian-mian-lcof.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/5/7.
//

import Foundation

/*
 剑指 Offer 21. 调整数组顺序使奇数位于偶数前面 (简单)
 https://leetcode-cn.com/problems/diao-zheng-shu-zu-shun-xu-shi-qi-shu-wei-yu-ou-shu-qian-mian-lcof/
 */

/*
 思路：
 法1. O(n^2)，每遇到偶数，将后面的数字前移，当前偶数放入最后
 法2. 双指针
 法3. 对双指针的优化
 */
class Solution_Offer_21 {
    
    // 2021/12/26
    func exchange(_ nums: [Int]) -> [Int] {
        var nums = nums
        var left = 0
        var right = nums.count - 1
        while left < right {
            while left < right && (nums[left] & 1 == 1) {
                left += 1
            }
            while left < right && (nums[right] & 1 == 0) {
                right -= 1
            }
            if left < right {
                let tmp = nums[left]
                nums[left] = nums[right]
                nums[right] = tmp
            }
        }
        return nums
    }
    
    func exchange_1(_ nums: [Int]) -> [Int] {
        return _exchange(nums, conditionFn: isEven(_:))
    }
    
    func _exchange(_ nums: [Int], conditionFn: (Int) -> Bool) -> [Int] {
        if nums.count == 0 {
            return []
        }
        var begin = 0
        var end = nums.count - 1
        var nums = nums
        while begin < end {
            while begin < end && !conditionFn(nums[begin]) {
                begin += 1
            }
            while begin < end && conditionFn(nums[end]) {
                end -= 1
            }
            if begin < end {
                nums.swapAt(begin, end)
            }
        }
        
        return nums
    }
    
    func isEven(_ num: Int) -> Bool {
        return num & 1 == 0
    }
    
    /*
     测试用例：
     1. 功能测试：奇偶交替出现；所有偶数在奇数前面；所有奇数在偶数前面
     2. 特殊输入：空数组；仅1个数字
     */
    func test() {
        print(exchange([1,2,3,4,5,6]))
        print(exchange([2,4,6,1,2,3]))
        print(exchange([1,3,5,2,4,6]))
        print(exchange([]))
        print(exchange([1]))
        print(exchange([2]))
    }
}
