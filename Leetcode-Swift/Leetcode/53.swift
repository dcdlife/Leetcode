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

class Solution53 {
    // MARK: - 动态规划
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var pre = 0, ans = nums[0]
        for i in nums {
            pre = max(pre + i, i)
            ans = max(pre, ans)
        }
        
        return ans
    }

    // MARK: 分治
    // https://leetcode.cn/problems/maximum-subarray/solution/zui-da-zi-xu-he-by-leetcode-solution/
    func maxSubArray_v1(_ nums: [Int]) -> Int {
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
}
