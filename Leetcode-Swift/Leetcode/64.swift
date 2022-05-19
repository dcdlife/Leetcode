//
//  64.swift
//  Leetcode-Swift
//
//  Created by yefeng on 2022/5/20.
//

import Foundation

/*
 64. 最小路径和 (中等)
 https://leetcode.cn/problems/minimum-path-sum/
 */

class Solution_64 {
    func minPathSum(_ grid: [[Int]]) -> Int {
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
                grid[i][j] = grid[i][j] + min(grid[i - 1][j], grid[i][j - 1])
            }
        }

        return grid[rows - 1][cols - 1]
    }
}
