//
//  15.3sum.swift
//  Leetcode-Swift
//
//  Created by devcz on 2021/4/7.
//

import Foundation
/*
 15. 三数之和 (中等)
 https://leetcode-cn.com/problems/3sum/
 */

class Solution_15 {
    // 排序+哈希表
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }

        let nums = nums.sorted()
        let n = nums.count
        var map = [Int: Int]()
        var ans = [[Int]]()

        // 生成值和索引对应的哈希表
        for (idx, i) in nums.enumerated() {
            map[i] = idx
        }

        for i in 0..<(n - 2) {
            if (i != 0) && (nums[i] == nums[i - 1]) { // 第一个元素去重
                continue
            }
            for j in (i + 1)..<(n - 1) {
                if (j != (i + 1)) && (nums[j] == nums[j - 1]) { // 第二个元素去重
                    continue
                }
                if let k = map[0 - nums[i] - nums[j]], k > j {
                    ans.append([nums[i], nums[j], nums[k]])
                }
            }
        }

        return ans
    }

    /*
     思路：排序+双指针
     */
    func threeSum_v1(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }

        let nums = nums.sorted()
        let count = nums.count
        var ans = [[Int]]()

        for i in 0..<(count - 2) {
            if i > 0 && (nums[i] == nums[i - 1]) {
                continue
            }
            var left = i + 1
            var right = count - 1
            while left < right {
                if left > (i + 1) && (nums[left] == nums[left - 1]) {
                    left += 1
                    continue
                }
                if right < (count - 1) && (nums[right] == nums[right + 1]) {
                    right -= 1
                    continue
                }
                let sum = nums[i] + nums[left] + nums[right]
                if sum == 0 {
                    ans.append([nums[i], nums[left], nums[right]])
                    left += 1
                    right -= 1
                } else if (sum > 0) {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }

        return ans
    }
    
    /*
     测试用例：
     1. 仅有3个：和为0、和不为0
     2. 超过3个：有1个和为0；有多个和为0；没有和为0
     3. 空数组；小于3个的数组
     */
    func test() {
        print(threeSum([1,0,-1]))
        print(threeSum([1,1,-1]))
        print(threeSum([-1,0,1,2,-1,-4]))
        print(threeSum([-1,0,1,1,1,1]))
        print(threeSum([-1,1,1,2,-5,-4]))
        print(threeSum([]))
        print(threeSum([1]))
        print(threeSum([1,2]))

        // 错误用例
        // 1. [0,0,0,0]
        // 2. [1,-1,-1,0]
        print(threeSum([0,0,0,0]))
        print(threeSum([1,-1,-1,0]))
    }
    
}
