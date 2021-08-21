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

class Solution322 {
    
    /// dfs+剪枝
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        if amount <= 0 {
            return -1
        }
        
        func inner(_ coins: [Int], _ remain: Int, _ count: inout [Int]) -> Int {
            if remain < 0 {
                return -1
            }
            if remain == 0 {
                return 0
            }
            if count[remain - 1] != 0 {
                return count[remain - 1]
            }
            var min = Int.max
            for coin in coins {
                let res = inner(coins, remain - coin, &count)
                if res >= 0 && res < min {
                    min = res + 1
                }
            }
            count[remain - 1] = min != Int.max ? min : -1
            return count[remain - 1]
        }
        
        var count = [Int](repeating: 0, count: amount)
        let _ = inner(coins, amount, &count)
        return count[amount - 1]
    }

    /// 动态规划
    func coinChange_dp(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        if amount <= 0 {
            return -1
        }
        
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        var i = 1
        while i <= amount {
            for coin in coins {
                if coin <= i {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
            i += 1
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
