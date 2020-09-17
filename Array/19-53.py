"""
53. 最大子序和 (简单)
https://leetcode-cn.com/problems/maximum-subarray/

给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

示例:

输入: [-2,1,-3,4,-1,2,1,-5,4]
输出: 6
解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
进阶:

如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。
"""

from typing import List

class Solution:

    # 方法三：分治。涉及线段树的概念
    # 复杂度: 时间O(n) 空间O(logn)
    # 执行用时：88 ms, 在所有 Python3 提交中击败了6.46%的用户
    # 内存消耗：13.6 MB, 在所有 Python3 提交中击败了99.94%的用户
    def maxSubArray(self, nums: List[int]) -> int:
        # lSum 表示 [l, r] 内以 ll 为左端点的最大子段和
        # rSum 表示 [l, r] 内以 rr 为右端点的最大子段和
        # mSum 表示 [l, r] 内的最大子段和
        # iSum 表示 [l, r] 的区间和
        def pushUp(l, r):
            lSumValue = max(l['lSum'], l['iSum'] + r['lSum'])
            rSumValue = max(r['rSum'], r['iSum'] + l['rSum'])
            mSumValue = max(max(l['mSum'], r['mSum']), l['rSum'] + r['lSum'])
            iSumValue = l['iSum'] + r['iSum']

            resDict = {}
            resDict['lSum'] = lSumValue
            resDict['rSum'] = rSumValue
            resDict['mSum'] = mSumValue
            resDict['iSum'] = iSumValue
            return resDict

        def get(nums, l, r):
            if l == r:
                return {'lSum': nums[l], 'rSum': nums[l], 'mSum': nums[l], 'iSum': nums[l]}
            mid = (l + r) >> 1
            lSub = get(nums, l, mid)
            rSub = get(nums, mid + 1, r)
            return pushUp(lSub, rSub)
        return get(nums, 0, len(nums) - 1)['mSum']

    # 方法二：动态规划
    # 复杂度： 时间O(n), 空间O(1)
    # 执行用时：40 ms, 在所有 Python3 提交中击败了97.28%的用户
    # 内存消耗：14 MB, 在所有 Python3 提交中击败了70.38%的用户
    def maxSubArray2(self, nums: List[int]) -> int:
        pre, ans = 0, nums[0]
        for i in nums:
            pre = max(pre + i, i)
            ans = max(ans, pre)
        return ans

    # 方法一：以和是否小于0来判断应该将当前遍历的值复制给和，还是累加到和。
    # 执行用时：48 ms, 在所有 Python3 提交中击败了78.03%的用户
    # 内存消耗：14 MB, 在所有 Python3 提交中击败了80.31%的用户
    def maxSubArray1(self, nums: List[int]) -> int:
        if not nums or len(nums) == 0:
            return 0
        
        if len(nums) == 1:
            return nums[0]

        res = nums[0]
        curSum = nums[0]
        for i in nums[1:]:
            if curSum < 0:
                curSum = i
            else:
                curSum += i
            res = max(res, curSum)
        
        return res


if __name__ == "__main__":
    su = Solution()
    print(su.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))