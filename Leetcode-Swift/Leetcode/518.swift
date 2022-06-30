//
//  518.swift
//  Leetcode-Swift
//
//  Created by 95cc on 2022/5/19.
//

import Foundation

/*
 518. 零钱兑换 II (中等)
 https://leetcode.cn/problems/coin-change-2/
 */

class Solution_518 {
    // MARK: - 完全背包问题 -> 计数问题（填满有多少种方法）
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        if amount == 0 {
            return 1
        }
        if amount < 0 || coins.isEmpty {
            return 0
        }

        let count = coins.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: amount + 1), count: count)

        var k = amount / coins[0]
        for i in 0...k {
            dp[0][i * coins[0]] = 1
        }

        for i in 1..<count {
            let coin = coins[i]
            for j in 0...amount {
                var k = j / coin
                for c in 0...k {
                    dp[i][j] += dp[i - 1][j - c * coin]
                }
            }
        }

        return dp[count - 1][amount]
    }
}
