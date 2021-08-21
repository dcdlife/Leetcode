//
//  46.ba-shu-zi-fan-yi-cheng-zi-fu-chuan-lcof.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/5/21.
//

import Foundation

/*
 剑指 Offer 46. 把数字翻译成字符串 (中等)
 https://leetcode-cn.com/problems/ba-shu-zi-fan-yi-cheng-zi-fu-chuan-lcof/
 */

class Solution_Offer_46 {
    func translateNum(_ num: Int) -> Int {
        if num <= 0 {
            return num == 0 ? 1 : 0
        }
        
        var nums = [Int]()
        var num = num
        while num > 0 {
            nums.insert(num % 10, at: 0)
            num /= 10
        }
        
        let total = nums.count
        var counts = [Int](repeating: 0, count: total)
        
        // 12258
        for i in stride(from: total - 1, to: -1, by: -1) {
            var count = 0
            if i < total - 1 {
                count = counts[i + 1]
            } else {
                count = 1
            }
            
            if i < total - 1 {
                if nums[i] != 0 && nums[i] * 10 + nums[i + 1] <= 25 { // 不要忘记num[i] == 0的情况
                    if i == total - 2 {
                        count += 1
                    } else {
                        count += counts[i + 2]
                    }
                }
            }
            counts[i] = count
        }
    
        return counts[0]
    }
    
    /*
     测试用例：
     1. 功能测试：只有1个数字；多个数字
     2. 特殊输入测试：0、包含25、26的数
     */
    func test() {
        print(translateNum(9))
        print(translateNum(12258))
        print(translateNum(122581224))
        print(translateNum(0)) // 结果应该是1
        print(translateNum(25))
        print(translateNum(26))
        
        // LeetCode未过用例
        print(translateNum(506))
    }
}
