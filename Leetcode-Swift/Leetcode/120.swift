//
//  120.triangle.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/4/19.
//

import Foundation

/*
 120. 三角形最小路径和 (中等)
 https://leetcode-cn.com/problems/triangle/
 */

class Solution_120 {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        if triangle.isEmpty {
            return 0
        }

        var triangle = triangle
        let rows = triangle.count

        for i in 1..<rows {
            triangle[i][0] = triangle[i][0] + triangle[i - 1][0]
            
            for j in 1..<i {
                triangle[i][j] = triangle[i][j] +  min(triangle[i - 1][j - 1], triangle[i - 1][j])
            }
            
            triangle[i][i] = triangle[i][i] + triangle[i - 1][i - 1]
        }

        return triangle[rows - 1].min()!
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
