//
//  56.2.shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-ii-lcof.swift
//  Leetcode-Swift
//
//  Created by devcz on 2021/5/29.
//

import Foundation

/*
 剑指 Offer 56 - II. 数组中数字出现的次数 II (中等)
 https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-ii-lcof/
 */

class Solution_Offer_56_2 {
    func singleNumber(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return -1
        }
        
        var counts = [Int](repeating: 0, count: 32)
        for var i in nums {
            for j in 0...31 {
                counts[j] += i & 1
                i >>= 1
            }
        }
        
        var ans = 0, times = 3
        for i in 0...31 {
            ans <<= 1
            ans |= counts[31 - i] % times
        }
        
        return ans
    }
    
    func test() {
        let tests = [
            [3,4,3,3],
            [9,1,7,9,7,9,7]
        ]
        
        for i in tests {
            print(singleNumber(i))
        }
    }
}
