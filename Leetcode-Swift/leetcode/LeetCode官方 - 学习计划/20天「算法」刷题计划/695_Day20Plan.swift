//
//  695_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/8/15.
//

import Foundation

/*
 695. 岛屿的最大面积 (中等)
 https://leetcode-cn.com/problems/max-area-of-island/
 */

class Solution_695_Day20Plan {
    /// 广度优先搜索+队列
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        if grid.isEmpty {
            return 0
        }
        
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        var ans = 0
        var queue = [(Int, Int)]()
        
        for i in 0..<rows {
            for j in 0..<cols {
                var area = 0
                queue.append((i, j))
                while !queue.isEmpty {
                    let (x, y) = queue.removeFirst()
                    if x < 0 || y < 0 || x >= rows || y >= cols || grid[x][y] != 1 {
                        continue
                    }
                    area += 1
                    grid[x][y] = 0
                    for (dx, dy) in [(0, -1), (0, 1), (-1, 0), (1, 0)] {
                        queue.append(((x + dx), (y + dy)))
                    }
                    ans = max(ans, area)
                }
            }
        }
        
        return ans
    }
    
    func test() {
        print(maxAreaOfIsland([[0,0,1,0,0,0,0,1,0,0,0,0,0],
                               [0,0,0,0,0,0,0,1,1,1,0,0,0],
                               [0,1,1,0,1,0,0,0,0,0,0,0,0],
                               [0,1,0,0,1,1,0,0,1,0,1,0,0],
                               [0,1,0,0,1,1,0,0,1,1,1,0,0],
                               [0,0,0,0,0,0,0,0,0,0,1,0,0],
                               [0,0,0,0,0,0,0,1,1,1,0,0,0],
                               [0,0,0,0,0,0,0,1,1,0,0,0,0]]))
        print(maxAreaOfIsland([[0,0,0]]))
    }
}
