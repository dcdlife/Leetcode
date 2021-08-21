//
//  542_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/8/16.
//

import Foundation

/*
 542. 01 矩阵 (中等)
 https://leetcode-cn.com/problems/01-matrix/
 */

class Solution_542_Day20Plan {
    /// 广度优先搜索
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        if mat.isEmpty {
            return []
        }
        
        let rows = mat.count
        let cols = mat[0].count
        var ans = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        
        var queue = [(Int, Int)]()
        for i in 0..<rows {
            for j in 0..<cols {
                if mat[i][j] == 0 {
                    queue.append((i, j))
                    visited[i][j] = true
                }
            }
        }
        
        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            for (newX, newY) in [(x, y - 1), (x, y + 1), (x - 1, y), (x + 1, y)] {
                if newX < 0 || newY < 0 || newX >= rows || newY >= cols || visited[newX][newY] {
                    continue
                }
                ans[newX][newY] = ans[x][y] + 1
                queue.append((newX , newY))
                visited[newX][newY] = true
            }
        }
    
        return ans
    }
    
    func test() {
        print(updateMatrix([[0,0,0],[0,1,0],[0,0,0]]))
        print(updateMatrix([[0,0,0],[0,1,0],[1,1,1]]))
    }
}
