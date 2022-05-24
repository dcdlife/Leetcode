//
//  322.coin-change.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/4/21.
//

import Foundation

/*
 322. 零钱兑换 (中等)
 https://leetcode-cn.com/problems/coin-change/
 */

class Solution_322 {
    /// 动态规划
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        if coins.isEmpty || amount < 0 {
            return -1
        }
        
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        
        for i in 1...amount {
            for coin in coins {
                if i >= coin {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }

        return dp[amount] > amount ? -1 : dp[amount]
    }
    
    func test() {
        print(coinChange([1,2,5], 11))
        print(coinChange([2], 3))
        print(coinChange([1], 0))
        print(coinChange([1], 1))
        print(coinChange([1], 2))
    }
}
