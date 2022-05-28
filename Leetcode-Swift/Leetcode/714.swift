//
//  714.best-time-to-buy-and-sell-stock-with-transaction-fee.swift
//  Leetcode-Swift
//
//  Created by devcz on 2021/4/21.
//

import Foundation

/*
 714. 买卖股票的最佳时机含手续费 (中等)
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/
 */

class Solution_714 {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        if prices.count == 0 {
            return 0
        }
        
        // 持有股票的最大收益
        var stock = -prices[0]
        // 不持有股票的最大收益
        var noStock = 0
        
        for i in 1..<prices.count {
            let newStock = max(stock, noStock - prices[i])
            let newNoStock = max(noStock, stock + prices[i] - fee)
            stock = newStock
            noStock = newNoStock
        }
        return noStock
    }
    
    func maxProfit_v1(_ prices: [Int], _ fee: Int) -> Int {
            if prices.isEmpty {
                return 0
            }

            // 元组代表 (无股票, 有股票)
            var dp = Array<(Int, Int)>.init(repeating: (0, 0), count: prices.count)
            dp[0] = (0, -prices[0])

            for i in 1..<prices.count {
                let noStock = max(dp[i - 1].0, dp[i - 1].1 + prices[i] - fee)
                let stock = max(dp[i - 1].1, dp[i - 1].0 - prices[i])
                dp[i] = (noStock, stock)
            }

            return dp[prices.count - 1].0
        }
    
    /*
     测试用例：
     1. 全跌、全涨、全平、跌宕起伏
     2. 空
     */
    func test() {
        print(maxProfit([1, 3, 2, 8, 4, 9], 2))
        
        print(maxProfit([5,4,3,2,1], 2))
        print(maxProfit([1,2,3,4,5], 3))
        print(maxProfit([1,1,1,1], 1))
        print(maxProfit([1,2,3,2,1,4,5,7,3,1], 3))
    }
}
