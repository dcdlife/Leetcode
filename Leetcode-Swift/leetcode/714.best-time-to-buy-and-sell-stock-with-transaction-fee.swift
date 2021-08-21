//
//  714.best-time-to-buy-and-sell-stock-with-transaction-fee.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/4/21.
//

import Foundation

/*
 714. 买卖股票的最佳时机含手续费 (中等)
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/
 */

class Solution714 {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        if prices.count == 0 {
            return 0
        }
        var buy = -prices[0] - fee
        var sell = 0
        for i in 1..<prices.count {
            let newBuy = max(buy, sell - prices[i] - fee)
            let newSell = max(sell, buy + prices[i])
            buy = newBuy
            sell = newSell
        }
        return sell
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
