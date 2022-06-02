//
//  16.06.swift
//  Leetcode-Swift
//
//  Created by devcz on 2022/6/2.
//

import Foundation

/*
 面试题 16.06. 最小差 (中等)
 https://leetcode.cn/problems/smallest-difference-lcci/
 */

class Solution_16_06 {
    func smallestDifference(_ a: [Int], _ b: [Int]) -> Int {
        let a = a.sorted()
        let b = b.sorted()

        var ans = Int.max
        let countA = a.count
        let countB = b.count
        var indexA = 0
        var indexB = 0
        
        while indexA < countA && indexB < countB {
            let valA = a[indexA]
            let valB = b[indexB]

            if valA == valB {
                return 0
            }

            ans = min(ans, abs(valA - valB))

            valA < valB ? (indexA += 1) : (indexB += 1)
        }

        return ans
    }
}
