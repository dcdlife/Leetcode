//
//  136_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/8/21.
//

import Foundation

/*
 136. 只出现一次的数字 (简单)
 https://leetcode-cn.com/problems/single-number/
 */

class Solution_136_Day20Plan {
    func singleNumber(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        var ans = nums[0]
        for i in 1..<nums.count {
            ans ^= nums[i]
        }
        return ans
    }
    
    func test() {
        print(singleNumber([2,2,1]))
        print(singleNumber([4,1,2,1,2]))
    }
}
