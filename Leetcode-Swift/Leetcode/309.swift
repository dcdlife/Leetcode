//
//  309.best-time-to-buy-and-sell-stock-with-cooldown.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/4/21.
//

import Foundation

/*
 309. 最佳买卖股票时机含冷冻期 (中等)
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
 */

class Solution_309 {
    /*
     f0: 持有股票的最大收益
     f1: 不持有股票，处于冷冻期
     f2: 不持有股票，不处于冷冻期
     */
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count == 0 {
            return 0
        }
        var f0 = -prices[0]
        var f1 = 0
        var f2 = 0
        
        for i in 1..<prices.count {
            let newf0 = max(f0, f2 - prices[i])
            let newf1 = f0 + prices[i]
            let newf2 = max(f1, f2)
            f0 = newf0
            f1 = newf1
            f2 = newf2
        }
        return max(f1, f2)
    }
    
    func maxProfit_v1(_ prices: [Int]) -> Int {
        if prices.isEmpty {
            return 0
        }
        if prices.count == 1 {
            return 0
        }
        if prices.count == 2 {
            return prices[1] > prices[0] ? prices[1] - prices[0] : 0
        }

        // 元组代表
        // 0: 手上持有股票的最大收益
        // 1: 手上不持有股票，并且处于冷冻期中的累计最大收益
        // 2: 手上不持有股票，并且不在冷冻期中的累计最大收益
        var dp = Array<(Int, Int, Int)>.init(repeating: (0, 0, 0), count: prices.count)
        dp[0] = (-prices[0], 0, 0)

        for i in 1..<prices.count {
            let ele0 = max(dp[i - 1].0, dp[i - 1].2 - prices[i])
            let ele1 = dp[i - 1].0 + prices[i]
            let ele2 = max(dp[i - 1].1, dp[i - 1].2)
            dp[i] = (ele0, ele1, ele2)
        }

        return max(dp[prices.count - 1].1, dp[prices.count - 1].2)
    }
    
    /*
     测试用例：
     1. 全跌、全涨、全平、跌宕起伏
     2. 空
     */
    func test() {
        
        print(maxProfit([1,2,3,0,2]))
        print(maxProfit([5,3,1]))
        print(maxProfit([1,3,5,9]))
        print(maxProfit([3,3,3,3]))
        print(maxProfit([9,3,0,1,3,5,3,1]))
    }
}
