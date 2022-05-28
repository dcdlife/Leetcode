//
//  518.swift
//  Leetcode-Swift
//
//  Created by devcz on 2022/5/19.
//

import Foundation

/*
 518. 零钱兑换 II (中等)
 https://leetcode.cn/problems/coin-change-2/
 */

class Solution_518 {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        if amount == 0 {
            return 1
        }
        if coins.isEmpty || amount < 0 {
            return 0
        }

        var dp = [[Int]](repeating: [Int](repeating: 0, count: amount + 1), count: coins.count)
        for i in 0..<coins.count {
            var val = coins[i]
            while val <= amount {
                dp[i][val] = 1
                val += coins[i]
            }
        }

        for i in 1..<coins.count {
            let coinNumber = coins[i]
            for j in 1...amount {
                for k in 0..<i {
                    if dp[k][j] != 0 {
                        var val = j + coinNumber
                        while val <= amount {
                            dp[i][val] += dp[k][j]
                            val += coinNumber
                        }
                    }
                }
            }
        }

        var ans = 0
        for i in 0..<coins.count {
            ans += dp[i][amount]
        }

        return ans
    }
}
