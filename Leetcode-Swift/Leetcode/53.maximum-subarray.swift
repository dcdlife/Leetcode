//
//  53.maximum-subarray.swift
//  Leetcode-Swift
//
//  Created by devcz on 2021/4/11.
//

import Foundation
/*
 53. 最大子序和 (简单)
 https://leetcode-cn.com/problems/maximum-subarray/
 */

/*
 思路：
 1. 动态规划（ 一次遍历）
 2. 分治
 */
class Solution53 {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return -1
        }
        struct Status {
            var lSum: Int // [l,r] 内以 l 为左端点的最大子段和
            var rSum: Int // [l,r] 内以 r 为右端点的最大子段和
            var mSum: Int // [l,r] 内的最大子段和
            var iSum: Int // [l,r] 的区间和
        }
        func combine(_ l: Status, _ r: Status) -> Status {
            let iSum = l.iSum + r.iSum;
            let lSum = max(l.lSum, l.iSum + r.lSum);
            let rSum = max(r.rSum, r.iSum + l.rSum);
            let mSum = max(max(l.mSum, r.mSum), l.rSum + r.lSum);
            return Status(lSum: lSum, rSum: rSum, mSum: mSum, iSum: iSum)
        }
        func getInfo(_ nums: [Int], _ l: Int, _ r: Int) -> Status {
            if l == r {
                return Status(lSum: nums[l], rSum: nums[l], mSum: nums[l], iSum: nums[l])
            }
            let m = (l + r) >> 1
            let lSub = getInfo(nums, l, m)
            let rSub = getInfo(nums, m + 1, r)
            return combine(lSub, rSub)
        }
        return getInfo(nums, 0, nums.count - 1).mSum
    }
    
    func maxSubArray_oneIteration(_ nums: [Int]) -> Int {
        let count = nums.count
        if count == 0 {
            return 0
        }
        if count == 1 {
            return nums[0]
        }
        var maxSum = nums[0]
        var preSum = maxSum
        for i in nums[1...] {
            if preSum <= 0 {
                preSum = i
            } else {
                preSum += i
            }
            maxSum = max(maxSum,preSum)
        }
        return maxSum
    }
    
    /*
     测试用例：
     1. 两个（一正一负）、多个值
     2. 仅1个元素
     3. 空元素
     */
    func test() {
        print(maxSubArray([-1,10]))
        print(maxSubArray([-1,10, 5, -10]))
        print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
        print(maxSubArray([1]))
        print(maxSubArray([-1]))
        print(maxSubArray([]))
        
        print(maxSubArray([5,4,-1,7,8]))
    }
}
