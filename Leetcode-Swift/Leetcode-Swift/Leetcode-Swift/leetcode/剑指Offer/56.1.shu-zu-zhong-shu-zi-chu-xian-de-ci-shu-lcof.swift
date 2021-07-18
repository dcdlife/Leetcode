//
//  56.1.shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-lcof.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/5/28.
//

import Foundation

/*
 剑指 Offer 56 - I. 数组中数字出现的次数 (中等)
 https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-lcof/
 */

class Solution_Offer_56_1 {
    func singleNumbers(_ nums: [Int]) -> [Int] {
        if nums.count == 0 {
            return []
        }
        
        var xorRes = nums.first!
        for i in nums[1...] {
            xorRes ^= i
        }
        
        if xorRes == 0 {
            return []
        }
        
        let firstBit1Index = findFirstBitIs1(xorRes)
        
        var a: Int? = nil
        var b: Int? = nil
        for i in nums {
            if isBit1OfIndex(i, firstBit1Index) {
                if a != nil {
                    a = a! ^ i
                } else {
                    a = i
                }
            } else {
                if b != nil {
                    b = b! ^ i
                } else {
                    b = i
                }
            }
        }
        
        if a == nil || b == nil {
            return []
        }
        
        return [a!, b!]
    }
    
    func isBit1OfIndex(_ num: Int, _ indexBit: Int) -> Bool {
        var num = num
        num = num >> indexBit
        return num & 1 == 1
    }

    func findFirstBitIs1(_ num: Int) -> Int {
        var num = num
        var indexBit = 0
        while ((num & 1) == 0 && num > 0) {
            num = num >> 1
            indexBit += 1
        }
        return indexBit
    }
    
    /*
     测试用例：
     1. 用例：多多对重复的数字；无多对重复的数字
     */
    func test() {
        let tests = [
            [1,1,2,3,3,4],
            [1,2]
        ]
        for i in tests {
            print(singleNumbers(i))
        }
    }
}
