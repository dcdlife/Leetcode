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
        let digits = getDigits(num)
        let count = digits.count

        if count <= 0 {
            return 0
        }
        if count == 1 {
            return 1
        }

        // 元组表示：(与前一个数组合，不与前一个数组合)
        var dp = Array<(Int, Int)>.init(repeating: (0, 0), count: count + 1)
        dp[1] = (0, 1)

        for i in 2...count {
            let curDigit = digits[i - 1]
            let lastDigit = digits[i - 2]

            if lastDigit == 0 || lastDigit * 10 + curDigit > 25 {
                dp[i] = (0, dp[i - 1].0 + dp[i - 1].1)
            } else {
                dp[i] = (dp[i - 1].1, dp[i - 1].0 + dp[i - 1].1)
            }
        }

        return dp.last!.0 + dp.last!.1
    }

    func getDigits(_ num: Int) -> [Int] {
        if num < 0 {
            return []
        }
        if num == 0 {
            return [0]
        }

        var num = num
        var nums = [Int]()
        while num > 0 {
            nums.insert(num % 10, at: 0)
            num /= 10
        }

        return nums
    }
    
    /*
     测试用例：
     1. 功能测试：只有1个数字；多个数字
     2. 特殊输入测试：0、包含25、26的数
     */
    func test() {
        print(translateNum(99999999999))
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
