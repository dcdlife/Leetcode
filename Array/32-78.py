"""
78. 子集 (中等)
https://leetcode-cn.com/problems/subsets/

给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

说明：解集不能包含重复的子集。

示例:

输入: nums = [1,2,3]
输出:
[
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]
"""

from typing import List

class Solution:

    # 方法二: 迭代。利用掩码，将每个数是否在子集中定义为0/1，迭代每个情况
    # 复杂度: 时间O(n * 2^n) 空间O(n)
    # 执行用时：48 ms, 在所有 Python3 提交中击败了23.01%的用户
    # 内存消耗：13.4 MB, 在所有 Python3 提交中击败了62.21%的用户
    def subsets(self, nums: List[int]) -> List[List[int]]:
        n = len(nums)
        res = []
        # 共有1<<n个结果
        for i in range(0, 1<<n):
            t = []
            for j in range(n):
                if i & (1 << j):
                    t.append(nums[j])
            res.append(t)
        return res

    # 方法一: 使用递归求解
    # 复杂度: 时间O(n * 2^n) 空间O(n)
    # 执行用时：36 ms, 在所有 Python3 提交中击败了89.31%的用户
    # 内存消耗：13.5 MB, 在所有 Python3 提交中击败了46.40%的用户
    def subsets1(self, nums: List[int]) -> List[List[int]]:
        if not nums:
            return [[]]
        if len(nums) == 1:
            return [[], nums]
        res = []
        first = nums[0]
        others = nums[1:]
        otherSubSets = self.subsets(others)
        for i in otherSubSets:
            res.append([first] + i)
        res += otherSubSets
        return res

if __name__ == "__main__":
    su = Solution()
    print(su.subsets([]))
    print(su.subsets([1]))
    print(su.subsets([1, 2]))
    print(su.subsets([1, 2, 3]))
