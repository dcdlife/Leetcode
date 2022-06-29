//
//  207.swift
//  Leetcode-Swift
//
//  Created by 95cc on 2021/10/20.
//

import Foundation

/*
 207. 课程表 (中等)
 https://leetcode-cn.com/problems/course-schedule/
 */

class Solution_207 {
    var edges = [[Int]]()
    var visited = [Int]()
    var isValid = true
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        if prerequisites.isEmpty {
            return true
        }

        edges = [[Int]](repeating: [Int](), count: numCourses)
        visited = [Int](repeating: 0, count: numCourses)

        for i in prerequisites  {
            edges[i[0]].append(i[1])
        }

        for i in 0..<numCourses {
            if !isValid {
                break
            }
            if visited[i] == 0 {
                dfs(i)
            }
        }

        return isValid
    }

    func dfs(_ index: Int) {
        visited[index] = 1

        for i in edges[index] {
            if visited[i] == 0 {
                dfs(i)
                if !isValid {
                    return
                }
            } else if (visited[i] == 1) {
                isValid = false
                return
            }
        }

        visited[index] = 2
    }
}
