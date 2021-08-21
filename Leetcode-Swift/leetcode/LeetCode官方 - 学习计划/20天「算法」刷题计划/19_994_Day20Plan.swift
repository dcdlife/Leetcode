//
//  994_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/8/17.
//

import Foundation

/*
 994. 腐烂的橘子 (中等)
 https://leetcode-cn.com/problems/rotting-oranges/
 */

class Solution_994_Day20Plan {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        if grid.isEmpty {
            return -1
        }
        
        let rows = grid.count
        let cols = grid[0].count
        
        var grid = grid
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        
        var queue = [(Int, Int)]()
        var freshCount = 0
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 2 {
                    queue.append((i, j))
                    visited[i][j] = true
                } else if grid[i][j] == 0 {
                    visited[i][j] = true
                } else {
                    freshCount += 1
                }
            }
        }
        
        if queue.isEmpty {
            if freshCount == 0 {
                return 0
            }
            return -1
        }
        
        var minusSecond = 0
        while !queue.isEmpty {
            var len = queue.count
            var infected = false
            while len > 0 {
                let (x, y) = queue.removeFirst()
                for (newX, newY) in [(x, y - 1), (x, y + 1), (x - 1, y), (x + 1, y)] {
                    if newX < 0 || newY < 0 || newX >= rows || newY >= cols || visited[newX][newY] {
                        continue
                    }
                    infected = true
                    grid[newX][newY] = 2
                    freshCount -= 1
                    queue.append((newX , newY))
                    visited[newX][newY] = true
                }
                len -= 1
            }
            if infected {
                minusSecond += 1
            }
        }

        return freshCount == 0 ? minusSecond : -1
    }
    
    func test() {
        print(orangesRotting([[2,1,1],[1,1,0],[0,1,1]]))
        /*
         2 1 1
         0 1 1
         1 0 1
         */
        print(orangesRotting([[2,1,1],[0,1,1],[1,0,1]]))
        print(orangesRotting([[0,2]]))
        
        // leetcode
        print(orangesRotting([[0]])) // 0
    }
}
