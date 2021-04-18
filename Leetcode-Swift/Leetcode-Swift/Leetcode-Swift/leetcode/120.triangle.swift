//
//  120.triangle.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/4/19.
//

import Foundation

/*
 120. 三角形最小路径和 (中等)
 https://leetcode-cn.com/problems/triangle/
 */

class Solution120 {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0, triangle[0].count > 0 else {
            return 0
        }
        if triangle.count == 1 {
            return triangle[0][0]
        }
        var triangle = triangle
        for i in 1..<triangle.count {
            let count = triangle[i].count
            for j in 0..<count {
                if j == 0 {
                    triangle[i][j] += triangle[i-1][j]
                } else if j == count - 1 {
                    triangle[i][j] += triangle[i - 1][j - 1]
                } else {
                    triangle[i][j] += min(triangle[i - 1][j], triangle[i - 1][j - 1])
                }
            }
        }
        return triangle[triangle.count - 1].min()!
    }
    
    /*
     测试用例：
     1. 最短路径在最左侧；最右侧；中间
     2. 仅1个元素
     */
    func test() {
        print(minimumTotal([[2],[3,4],[5,6,7],[8,9,10,11]]))
        print(minimumTotal([[2],[4,3],[7,6,5],[11,10,9,8]]))
        print(minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]]))
        print(minimumTotal([[5]]))
    }
}
