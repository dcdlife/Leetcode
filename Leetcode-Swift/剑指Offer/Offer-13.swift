//
//  13.ji-qi-ren-de-yun-dong-fan-wei-lcof.swift
//  Leetcode-Swift
//
//  Created by 95cc on 2021/4/28.
//

import Foundation

/*
 剑指 Offer 13. 机器人的运动范围 (中等)
 https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof/
 */

class Solution_Offer_13 {
    var visited = [[Bool]]()
    var ans = 0

    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        if (m < 0) || (n < 0) || (k < 0) {
            return 0
        }

        visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        dfs(0, m, 0, n, k)

        return ans
    }

    func dfs(_ row: Int, _ rows: Int, _ col: Int, _ cols: Int, _ k : Int) {
        if (row < 0) || (row >= rows) || (col < 0) || (col >= cols) || visited[row][col] {
            return
        }

        let sum = getDititSum(row) + getDititSum(col)
        if sum > k {
            return
        }

        visited[row][col] = true
        ans += 1

        let directioins = [(0, -1), (0, 1), (-1, 0), (1, 0)]
        for directioin in directioins {
            dfs(row + directioin.0, rows, col + directioin.1, cols, k)
        }
    }

    func getDititSum(_ num: Int) -> Int {
        var num = num
        var sum = 0
        while num > 0 {
            sum += (num % 10)
            num = (num / 10)
        }
        return sum
    }
    
    /*
     测试用例：
     1. 功能测试：多行多列；k为正数
     2. 边界值测试：只有1行、只有1列；k=0
     3. 特殊测试：k为负数
     */
    func test() {
        print(movingCount(2, 3, 1))
        print(movingCount(3, 1, 0))
        
        print(movingCount(10, 20, 20))
        print(movingCount(39, 19, 25))
        print(movingCount(1, 0, 10))
        print(movingCount(0, 1, 10))
        print(movingCount(3, 10, 0))
        
        print(movingCount(10, 10, -1))
    }
}
