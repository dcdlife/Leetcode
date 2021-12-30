//
//  74.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/12/30.
//

import Foundation

/*
 74. 搜索二维矩阵 (中等)
 https://leetcode-cn.com/problems/search-a-2d-matrix/
 */

class Solution_74 {
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty || matrix[0].isEmpty {
            return false
        }

        var i = 0
        var j = matrix[0].count - 1

        while i < matrix.count && j >= 0 {
            if target == matrix[i][j] {
                return true
            }
            if target > matrix[i][j] {
                i += 1
            } else {
                j -= 1
            }
        }

        return false
    }
    
    func test() {
        assert(searchMatrix([[1]], 1) == true)
        assert(searchMatrix([[1]], -1) == false)
        assert(searchMatrix([[1],[3]], 3) == true)
        assert(searchMatrix([[1],[3]], -3) == false)
        assert(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3) == true)
        assert(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13) == false)
        print("success")
    }
}
