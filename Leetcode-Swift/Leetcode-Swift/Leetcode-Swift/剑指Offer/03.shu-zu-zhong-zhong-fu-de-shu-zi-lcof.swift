//
//  03.shu-zu-zhong-zhong-fu-de-shu-zi-lcof.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/4/25.
//

import Foundation

/*
 剑指 Offer 03. 数组中重复的数字 (简单)
 https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof/
 */

class Solution_Offer_03 {
    func findRepeatNumber(_ nums: [Int]) -> Int {
        // 判断无效输入
//        if nums.count == 0 {
//            return -1
//        }
//        let count = nums.count
//        for i in nums {
//            if i < 0 || i > count - 1 {
//                return -1
//            }
//        }
        var nums = nums
        
        for i in 0..<nums.count {
            if nums[i] == i {
                continue
            }
            if nums[i] == nums[nums[i]] {
                return nums[i]
            }
            nums.swapAt(i, nums[i])
        }
        
        return -1
    }
    
    /*
     测试用例：
     1. 重复数字仅1个；多个；无重复
     2. 数组元素空；数组中包含0~n-1之外的数字
     */
    func test() {
        print(findRepeatNumber([1,1,2,3,4,5]))
        print(findRepeatNumber([1,2,3,1,2,3]))
        print(findRepeatNumber([1,2,3,4,10]))
        print(findRepeatNumber([]))
    }
}
