//
//  1.tow-sum.swift
//  Leetcode-Swift
//
//  Created by devcz on 2021/4/3.
//

import Foundation

/*
 1.两数之和（简单）
 https://leetcode-cn.com/problems/two-sum
 */

class Solution_1 {
    
    /*
     思路：利用一个哈希表（里面存放为 key：元素，value：元素索引），依次遍历数组元素，以目标值减去当前元素的值为key，
     在哈希表中查找，如果找到，返回[当前遍历元素的索引, 哈希表中目标值减去当前元素的值为key所对应的value]
     */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count < 2 {
            return []
        }

        var map = [Int: Int]()

        for (idxI, i) in nums.enumerated() {
            if let idxJ = map[target - i] {
                return [idxI, idxJ]
            } else {
                map[i] = idxI
            }
        }

        return []
    }
    
    func test() {
        print(twoSum([2,7,11,15], 9))
    }
}

