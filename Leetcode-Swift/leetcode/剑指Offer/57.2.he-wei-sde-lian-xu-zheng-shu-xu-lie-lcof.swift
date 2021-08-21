//
//  57.2.he-wei-sde-lian-xu-zheng-shu-xu-lie-lcof.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/5/29.
//

import Foundation

/*
 剑指 Offer 57 - II. 和为s的连续正数序列 (简单)
 https://leetcode-cn.com/problems/he-wei-sde-lian-xu-zheng-shu-xu-lie-lcof/
 */

class Solution_Offer_57_2 {
    func findContinuousSequence(_ target: Int) -> [[Int]] {
        if target <= 2 {
            return []
        }
        
        var ans = [[Int]]()
        var counts = [Int]()
        var sum = 0
        var cur = 1
        let end = target / 2 + 1
        
        while cur <= end {
            counts.append(cur)
            sum += cur
            
            while sum >= target && counts.count > 0 {
                if sum == target && counts.count >= 2 {
                    ans.append(counts)
                }
                
                sum -= counts.removeFirst()
            }
            
            cur += 1
        }
        
        return ans
    }
    
    /*
     测试用例：
     1. 功能：3、4、5等正数有和为target的连续正数序列
     2. 特殊：小于等于2；大数
     */
    func test() {
        let tests = [
            3,4,5,6,7,8,9,15,100
        ]
        
        for i in tests {
            print(findContinuousSequence(i))
        }
    }
}
