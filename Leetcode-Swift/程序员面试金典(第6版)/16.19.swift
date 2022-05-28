//
//  16.19.swift
//  Leetcode-Swift
//
//  Created by devcz on 2022/5/10.
//

import Foundation

/*
 面试题 16.19. 水域大小 (中等)
 https://leetcode.cn/problems/pond-sizes-lcci/
 */

class Solution_16_19 {
    var visited = [[Bool]]()

    func pondSizes(_ land: [[Int]]) -> [Int] {
        if land.isEmpty || land[0].isEmpty {
            return []
        }

        let rows = land.count
        let cols = land[0].count
        visited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        var ans = [Int]()
        var curWaterAreaCount = 0

        for i in 0..<rows {
            for j in 0..<cols {
                if !visited[i][j] && land[i][j] == 0 {
                    curWaterAreaCount = 0
                    dfs(land, &curWaterAreaCount, i, j, rows, cols)
                    ans.append(curWaterAreaCount)
                }
            }
        }

        return ans.sorted()
    }

    func dfs(_ land: [[Int]], _ waterAreaCount: inout Int, _ row: Int, _ col: Int, _ rows: Int, _ cols: Int) {
        waterAreaCount += 1
        visited[row][col] = true

        let directions = [
            (0,-1), (0,1),
            (-1,0), (1,0),
            (-1,-1), (1,1),
            (1,-1), (-1,1)
        ]
        for i in directions {
            let newRow = row + i.0
            let newCol = col + i.1

            if newRow < 0 || newCol < 0 || newRow >= rows || newCol >= cols {
                continue
            }
            if !visited[newRow][newCol] && land[newRow][newCol] == 0 {
                dfs(land, &waterAreaCount, newRow, newCol, rows, cols)
            }
        }
    }
}
