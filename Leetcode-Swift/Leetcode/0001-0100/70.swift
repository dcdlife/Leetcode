//
//  70.climbing-stairs.swift
//  Leetcode-Swift
//
//  Created by 95cc on 2021/4/19.
//

import Foundation

/*
 70. 爬楼梯 (简单)
 https://leetcode-cn.com/problems/climbing-stairs/
 */

class Solution_70 {
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }

        var f1 = 1
        var f2 = 2
        
        for _ in 3...n {
            let newF2 = f1 + f2
            f1 = f2
            f2 = newF2
        }

        return f2
    }
    
    func test() {
        let cases = [0,1,2,3,4,5,6,7,8]
        for i in cases {
            print(climbStairs(i))
        }
    }
}