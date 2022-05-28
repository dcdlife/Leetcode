//
//  121.best-time-to-buy-and-sell-stock.swift
//  Leetcode-Swift
//
//  Created by devcz on 2021/4/14.
//

import Foundation
/*
 121. 买卖股票的最佳时机 (简单)
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/
 */

/*
 思路：
 1. 暴力，两重循环找最大差
 2. 一次遍历
 */
class Solution121 {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count == 0 {
            return 0
        }
        var minPrice = prices[0]
        var maxProfit = 0
        for i in 1..<prices.count {
            maxProfit = max(maxProfit, prices[i] - minPrice)
            minPrice = min(minPrice, prices[i])
        }
        return maxProfit
    }
    
    /*
     测试用例：
     1. 最大差在第二个元素，中间、最后
     2. 元素均降序
     3. 空
     */
    func test() {
        print(maxProfit([1,5]))
        print(maxProfit([2,5,0,1]))
        print(maxProfit([10,3,5,2,1,15]))
        print(maxProfit([5,3,1]))
        print(maxProfit([]))
    }
}
