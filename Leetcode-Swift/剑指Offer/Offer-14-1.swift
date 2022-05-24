//
//  14.jian-sheng-zi-lcof.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/4/28.
//

import Foundation

/*
 剑指 Offer 14- I. 剪绳子 (中等)
 https://leetcode-cn.com/problems/jian-sheng-zi-lcof/
 */

class Solution_Offer_14_1 {
    func cuttingRope(_ n: Int) -> Int {
        if n < 2 {
            return 0
        }
        if n == 2 {
            return 1
        }
        if n == 3 {
            return 2
        }
        
        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 0
        dp[1] = 1
        dp[2] = 2
        dp[3] = 3
        for i in 4...n {
            var maxProduct = 0
            for j in 1...(i / 2) {
                maxProduct = max(maxProduct, dp[j] * dp[i - j])
                dp[i] = maxProduct
            }
        }
        return dp[n]
    }
    
    func test() {
        print(cuttingRope(2))
        print(cuttingRope(10))
    }
}
