//
//  309.best-time-to-buy-and-sell-stock-with-cooldown.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/4/21.
//

import Foundation

/*
 309. 最佳买卖股票时机含冷冻期 (中等)
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
 */

class Solution309 {
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
