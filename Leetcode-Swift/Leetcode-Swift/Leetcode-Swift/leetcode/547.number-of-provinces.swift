//
//  547.number-of-provinces.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/4/22.
//

import Foundation

/*
 547. 省份数量 (中等)
 https://leetcode-cn.com/problems/number-of-provinces/
 */

class Solution547 {
    
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        if isConnected.count == 0 || isConnected[0].count == 0 {
            return 0
        }
        let provinces = isConnected.count
        var visited: [Bool] = [Bool](repeating: false, count: provinces)
        
        var queue = [Int]()
        var ans = 0
        for i in 0..<provinces {
            if !visited[i] {
                queue.append(i)
                while queue.count > 0 {
                    let head = queue.removeFirst()
                    visited[head] = true
                    for j in 0..<provinces {
                        if isConnected[head][j] == 1 && !visited[j] {
                            queue.append(j)
                        }
                    }
                }
                ans += 1
            }
        }
        
        return ans
    }
    
    func findCircleNum_dfs(_ isConnected: [[Int]]) -> Int {
        if isConnected.count == 0 || isConnected[0].count == 0 {
            return 0
        }
        let provinces = isConnected.count
        var visited: [Bool] = [Bool](repeating: false, count: provinces)
        
        func _dfs(_ province: Int) {
            for j in 0..<provinces {
                if isConnected[province][j] == 1 && !visited[j] {
                    visited[j] = true
                    _dfs(j)
                }
            }
        }
        var ans = 0
        for i in 0..<provinces {
            if !visited[i] {
                ans += 1
                _dfs(i)
            }
        }
    
        return ans
    }
    
    func test() {
        print(findCircleNum([
            [1,1,0],
            [1,1,0],
            [0,0,1]
        ]))
        print(findCircleNum([
            [1,0,0],
            [0,1,0],
            [0,0,1]
        ]))
        
        // 未过用例
        /*
         [[1,0,0,1],
          [0,1,1,0],
          [0,1,1,1],
          [1,0,1,1]]
         */
        print(findCircleNum([[1,0,0,1],
                              [0,1,1,0],
                              [0,1,1,1],
                              [1,0,1,1]]))
    }
}
