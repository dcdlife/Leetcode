//
//  47.li-wu-de-zui-da-jie-zhi-lcof.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/5/22.
//

import Foundation

/*
 剑指 Offer 47. 礼物的最大价值 (中等)
 https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof/
 */

class Solution_Offer_47 {
    func maxValue(_ grid: [[Int]]) -> Int {
        if grid.count == 0 || grid[0].count == 0 {
            return 0
        }
        
        let rows = grid.count
        let cols = grid[0].count
        
        if rows == 1 {
            return grid[0].reduce(0, +)
        }
        
        if cols == 1 {
            return grid.reduce(0) { $0 + $1[0] }
        }
        
        var ans = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        ans[0][0] = grid[0][0]
        for i in 1..<cols {
            ans[0][i] = ans[0][i - 1] + grid[0][i]
        }
        for j in 1..<rows {
            ans[j][0] = ans[j - 1][0] + grid[j][0]
        }
        
        for i in 1..<rows {
            for j in 1..<cols {
                ans[i][j] = max(ans[i - 1][j], ans[i][j - 1]) + grid[i][j]
            }
        }
        
        return ans[rows - 1][cols - 1]
    }
    
    /*
     测试用例：
     1. 功能测试：只有1个数字；1行；1列；多行多列
     2. 特殊输入测试：空数组
     */
    func test() {
        print(maxValue([[1]]))
        print(maxValue([[1,2,3,4,5]]))
        print(maxValue([[1],[2],[3]]))
        print(maxValue([
            [1,3,1],
            [1,5,1],
            [4,2,1]
          ]
        ))
        print(maxValue([]))
        print(maxValue([[]]))
    }
}
