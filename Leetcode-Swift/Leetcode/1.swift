//
//  1.tow-sum.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/4/3.
//

import Foundation

//: 1.两数之和（简单）
//: https://leetcode-cn.com/problems/two-sum

/*
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 的那 两个 整数，并返回它们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

 你可以按任意顺序返回答案。
 
 示例 1：

 输入：nums = [2,7,11,15], target = 9
 输出：[0,1]
 解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。
 示例 2：

 输入：nums = [3,2,4], target = 6
 输出：[1,2]
 示例 3：

 输入：nums = [3,3], target = 6
 输出：[0,1]
  

 提示：

 2 <= nums.length <= 103
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 只会存在一个有效答案
 */

/*
 思路：利用一个哈希表（里面存放为 key：元素，value：元素索引），依次遍历数组元素，以目标值减去当前元素的值为key，
 在哈希表中查找，如果找到，返回[当前遍历元素的索引, 哈希表中目标值减去当前元素的值为key所对应的value]
 
 时间复杂度：O(n)
 空间复杂度：O(n)
 */
class Solution_1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // 如果nums的个数小于2，直接返回
        if nums.count < 2 {
            return []
        }
        // 初始化字典，用来记录已经遍历过的值，以及其索引
        var dict = [Int:Int]()
        for (index, i) in nums.enumerated() {
            if let idx = dict[target - i] {
                return [index, idx]
            }
            dict[i] = index
        }
        return []
    }
    
    func test() {
        print(twoSum([2,7,11,15], 9))
    }
}

