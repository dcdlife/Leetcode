//
//  03_74_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/8/22.
//

import Foundation

/*
 74. 搜索二维矩阵 (中等)
 https://leetcode-cn.com/problems/search-a-2d-matrix/
 */

class Solution_03_74_Day20Plan {
    
    // 优化
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty {
            return false
        }
        let rows = matrix.count
        let cols = matrix[0].count
        
        var l = 0
        var r = rows * cols - 1
        while l <= r {
            let m = l + (r - l) >> 1
            let val = matrix[m / cols][m % cols]
            if val == target {
                return true
            } else if val > target {
                r = m - 1
            } else {
                l = m + 1
            }
        }
        
        return false
    }
    
    // 初版
    func searchMatrix_1(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty {
            return false
        }
        
        let rows = matrix.count
        let cols = matrix[0].count
        
        if matrix[0][0] > target || matrix[rows - 1][cols - 1] < target {
            return false
        }
        
        var row = rows
        for i in 0..<rows {
            if matrix[i][0] > target {
                row = i
                break
            }
        }
        
        row -= 1
        var l = 0
        var r = matrix[row].count - 1
        while l <= r {
            let m = l + (r - l) >> 1
            let val = matrix[row][m]
            if val == target {
                return true
            } else if (val > target) {
                r = m - 1
            } else {
                l = m + 1
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
