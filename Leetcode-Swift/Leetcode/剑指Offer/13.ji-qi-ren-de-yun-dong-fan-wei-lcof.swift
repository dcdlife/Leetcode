//
//  13.ji-qi-ren-de-yun-dong-fan-wei-lcof.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/4/28.
//

import Foundation

/*
 剑指 Offer 13. 机器人的运动范围 (中等)
 https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof/
 */

class Solution_Offer_13 {
    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        if m < 0 || n < 0 || k < 0 {
            return -1
        }
        
        func _getDigitNum(_ num: Int) -> Int {
            var ans = 0
            var num = num
            while num > 0 {
                ans += (num % 10)
                num /= 10
            }
            return ans
        }
        
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        var ans = 0
        func _dfs(_ row: Int, _ col: Int) {
            if row < 0 || row >= m || col < 0 || col >= n || visited[row][col] {
                return
            }
            let digitCount = _getDigitNum(row) + _getDigitNum(col)
            if digitCount > k {
                return
            }
            
            ans += 1
            visited[row][col] = true
            let dx = [0,0,-1,1]
            let dy = [1,-1,0,0]
            for i in 0..<4 {
                _dfs(row + dx[i], col + dy[i])
            }
        }
        _dfs(0, 0)
        return ans
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
