//
//  04.01.swift
//  Leetcode-Swift
//
//  Created by 95cc on 2022/5/9.
//

import Foundation

/*
 面试题 04.01. 节点间通路 (中等)
 https://leetcode.cn/problems/route-between-nodes-lcci/
 */

class Solution_04_01 {
    var visited = [Int: Bool]()

    func findWhetherExistsPath(_ n: Int, _ graph: [[Int]], _ start: Int, _ target: Int) -> Bool {
        if graph.isEmpty {
            return false
        }

        var digraph = [Int: [Int]]()
        for i in graph {
            if let _ = digraph[i[0]] {
                if !(digraph[i[0]]!.contains(i[1]) ){
                    digraph[i[0]]!.append(i[1])
                }
            } else {
                digraph[i[0]] = [i[1]]
                visited[i[0]] = false
            }
        }

        return dfs(digraph, start, target)
    }

    func dfs(_ digraph: [Int: [Int]], _ begin: Int, _ target: Int) -> Bool {
        if digraph[begin] == nil {
            return false
        }
        if visited[begin]! {
            return false
        }

        visited[begin]! = true

        for i in digraph[begin]! {
            if i == target {
                return true
            }
            if (dfs(digraph, i, target)) {
                return true
            }
        }

        visited[begin]! = false

        return false
    }
}
