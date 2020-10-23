"""
90. 子集 II (中等)
https://leetcode-cn.com/problems/subsets-ii/

给定一个可能包含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

说明：解集不能包含重复的子集。

示例:

输入: [1,2,2]
输出:
[
  [2],
  [1],
  [1,2,2],
  [2,2],
  [1,2],
  []
]
"""

from typing import List


class Solution:

    # 先对数组排序，然后再横向去重: https://leetcode-cn.com/problems/subsets-ii/solution/hui-su-pai-xu-jian-zhi-by-yi-wen-statistics/
    # 执行用时：44 ms, 在所有 Python3 提交中击败了66.34%的用户
    # 内存消耗：13.6 MB, 在所有 Python3 提交中击败了23.03%的用户
    def subsetsWithDup(self, nums: List[int]) -> List[List[int]]:
        nums = sorted(nums)
        n = len(nums)
        res = []

        def back_func(start=0, temp=[]):
            res.append(temp[:])
            for i in range(start, n):
                if i > start and nums[i] == nums[i-1]:
                    continue
                temp.append(nums[i])
                back_func(i+1, temp)
                temp.pop()
        back_func()
        return res


if __name__ == "__main__":
    su = Solution()
    print(su.subsetsWithDup([1, 2, 2]))
