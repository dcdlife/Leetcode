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
    // MARK: - 哈希表思路
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count < 2 {
            return []
        }

        var map = [Int: Int]()

        for (index, val) in nums.enumerated() {
            if let anotherIndex = map[target - val] {
                return [index, anotherIndex]
            }
            map[val] = index
        }

        return []
    }
    
    // MARK: - 暴力枚举 两重for循环思路
    func twoSum_v2(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count < 2 {
            return []
        }

        let count = nums.count
        for i in 0...(count - 2) {
            for j in (i + 1)...(count - 1) {
                if (nums[i] + nums[j]) == target {
                    return [i, j]
                }
            }
        }

        return []
    }
    
    // MARK: - 排序、双指针、索引查找
    func twoSum_v3(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count < 2 {
            return []
        }

        let count = nums.count
        var copyNums = nums
        copyNums = copyNums.sorted()
        var left = 0
        var right = count - 1

        while left < right {
            let sum = copyNums[left] + copyNums[right]
            if sum == target {
                return indexesOf(nums, copyNums[left], copyNums[right])
            } else if sum > target {
                right -= 1
            } else {
                left += 1
            }
        }

        return []
    }

    func indexesOf(_ nums: [Int], _ a: Int, _ b: Int) -> [Int] {
        var used = [Bool](repeating: false, count: nums.count)
        var ans = [Int]()
        for i in 0..<(nums.count) {
            if (nums[i] == a) && !used[i] {
                ans.append(i)
                used[i] = true
            }
            if (nums[i] == b) && !used[i] {
                ans.append(i)
                used[i] = true
            }
            if ans.count == 2 {
                return ans
            }
        }

        return []
    }
}

