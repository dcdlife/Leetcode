"""
209. 长度最小的子数组
中等
https://leetcode-cn.com/problems/minimum-size-subarray-sum/
"""

from typing import List

class Solution:
    # 方法一: 一次遍历，计算遍历到的和，碰到大于s，就依次减去前面的数，并计算个数。
    # 44 ms	    96.77%
    # 15.3 MB   83.33%
    def minSubArrayLen(self, s: int, nums: List[int]) -> int:
        res = 0
        sum_num = 0
        beginIndex = 0
        for i in range(len(nums)):
            sum_num += nums[i]
            if sum_num >= s:
                while sum_num >= s:
                    if res > (i - beginIndex + 1) or res == 0:
                        res = i - beginIndex + 1
                    sum_num -= nums[beginIndex]
                    beginIndex += 1
        return res

if __name__ == "__main__":
    su = Solution()
    test = [
        ([2,3,1,2,4,3], 7),
        ([1,2,3,1], 7),
        ([7], 7),
        ([2,3,1,2,4,3], 17),
        ([2,3], 4),
    ]
    for (nums, s) in test:
        print(su.minSubArrayLen(s, nums))