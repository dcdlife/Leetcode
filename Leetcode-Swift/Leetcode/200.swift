//
//  200.number-of-islands.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/4/22.
//

import Foundation

/*
 200. 岛屿数量 (中等)
 https://leetcode-cn.com/problems/number-of-islands/
 */

class Solution200 {
    
    /// dfs
    var visited = [[Bool]]()
    func numIslands(_ grid: [[Character]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        visited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)

        var ans = 0
        for i in 0..<rows {
            for j in 0..<cols {
                if !visited[i][j] && grid[i][j] == "1" {
                    ans += 1
                    dfs(grid, i, j, rows, cols)
                }
            }
        }

        return ans
    }

    func dfs(_ grid: [[Character]], _ row: Int, _ col: Int, _ rows: Int, _ cols: Int) {
        visited[row][col] = true
        let directions = [(0,-1), (0,1), (-1,0), (1,0)]
        
        for i in directions {
            let newRow = row + i.0
            let newCol = col + i.1

            if newRow < 0 || newCol < 0 || newRow >= rows || newCol >= cols {
                continue
            }
            if visited[newRow][newCol] || grid[newRow][newCol] == "0" {
                continue
            }
            dfs(grid, newRow, newCol, rows, cols)
        }
    }
    
    /// bfs
    func numIslands_bfs(_ grid: [[Character]]) -> Int {
        if grid.count == 0 || grid[0].count == 0 {
            return 0
        }
        let rows = grid.count
        let cols = grid[0].count
        var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        let dx = [0,0,-1,1]
        let dy = [1,-1,0,0]
        
        func _bfs(_ row: Int, _ col: Int) {
            var queue = [[row, col]]
            while queue.count > 0 {
                let head = queue.removeFirst()
                let row = head[0]
                let col = head[1]
                if row < 0 || row >= rows  || col < 0 || col >= cols || visited[row][col] || grid[row][col] == "0" {
                    continue
                }
                visited[row][col] = true
                for i in 0..<4 {
                    queue.append([row + dx[i], col + dy[i]])
                }
            }
        }
        
        var ans = 0
        for row in 0..<rows {
            for col in 0..<cols {
                if !visited[row][col] && grid[row][col] == "1" {
                    _bfs(row, col)
                    ans += 1
                }
            }
        }
        return ans
    }
    
    /*
     测试用例：
     1. 岛屿在上侧、左侧、下侧、右侧、中间
     2. 无岛屿
     3. 各个岛屿互不相连
     */
    func test() {
        print(numIslands([
            ["1","1","1"],
            ["0","0","0"],
            ["0","0","0"]
        ]))
        print(numIslands([
            ["1","0","0"],
            ["1","0","0"],
            ["1","0","0"]
        ]))
        print(numIslands([
            ["0","0","0"],
            ["0","0","0"],
            ["1","1","1"]
        ]))
        print(numIslands([
            ["0","0","1"],
            ["0","0","1"],
            ["0","0","1"]
        ]))
        print(numIslands([
            ["0","0","0"],
            ["0","1","0"],
            ["0","0","0"]
        ]))
        
        print(numIslands([
            ["0","0","0"],
            ["0","0","0"],
            ["0","0","0"]
        ]))
        
        print(numIslands([
            ["1","0","1"],
            ["0","1","0"],
            ["1","0","1"]
        ]))
    }
}