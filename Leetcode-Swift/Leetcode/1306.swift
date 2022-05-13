//
//  1306.swift
//  Leetcode-Swift
//
//  Created by devcz on 2022/5/13.
//

import Foundation

/*
 1306. 跳跃游戏 III (中等)
 https://leetcode.cn/problems/jump-game-iii/
 */

class Solution_1306 {
    var visited = [Bool]()

    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        if arr.isEmpty {
            return true
        }

        if start < 0 || start >= arr.count {
            return false
        }

        visited = [Bool](repeating: false, count: arr.count)

        return dfs(arr, start)
    }

    func dfs(_ arr: [Int], _ start: Int) -> Bool {
        if arr[start] == 0 {
            return true
        }

        let nextIndexes = [
            start + arr[start],
            start - arr[start]
        ]

        visited[start] = true

        for index in nextIndexes {
            if index < 0 || index >= arr.count {
                continue
            }
            if visited[index] {
                continue
            }

            if dfs(arr, index) {
                return true
            }
        }
        
        visited[start] = false

        return false
    }
}


