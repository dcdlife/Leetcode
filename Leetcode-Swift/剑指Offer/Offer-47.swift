//
//  47.li-wu-de-zui-da-jie-zhi-lcof.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/5/22.
//

import Foundation

/*
 剑指 Offer 47. 礼物的最大价值 (中等)
 https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof/
 */

class Solution_Offer_47 {
    func maxValue(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty {
            return 0
        }

        var grid = grid
        let rows = grid.count
        let cols = grid[0].count

        for row in 1..<rows {
            grid[row][0] = grid[row][0] + grid[row - 1][0]
        }
        for col in 1..<cols {
            grid[0][col] = grid[0][col] + grid[0][col - 1]
        }

        for i in 1..<rows {
            for j in 1..<cols {
                grid[i][j] = grid[i][j] + max(grid[i - 1][j], grid[i][j - 1])
            }
        }

        return grid[rows - 1][cols - 1]
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
