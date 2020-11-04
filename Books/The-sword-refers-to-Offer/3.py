"""
剑指 Offer 03. 数组中重复的数字 (简单)
https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof/

找出数组中重复的数字。


在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。

示例 1：

输入：
[2, 3, 1, 0, 2, 5, 3]
输出：2 或 3 
 

限制：

2 <= n <= 100000
"""

from typing import List


class Solution:
    # 通过遍历，替换元素应该在的位置，如果发现被替换的有重复，直接返回
    # 执行用时：48 ms, 在所有 Python3 提交中击败了89.89%的用户
    # 内存消耗：22.6 MB, 在所有 Python3 提交中击败了54.56%的用户
    def findRepeatNumber(self, nums: List[int]) -> int:
        if not nums:
            return -1
        n = len(nums)
        index = 0
        while index < n:
            if nums[index] == index:
                index += 1
            else:
                value = nums[index]
                if value == nums[value]:
                    return value
                else:
                    nums[index], nums[value] = nums[value], nums[index]

        return -1

    # 思路②：利用哈希表，记录已经存在的数字


if __name__ == "__main__":
    su = Solution()
    # 测试用例：
    # 1. 长度为n的数组里包含一个或多个重复的数字
    # 2. 数组中不包含重复的数字
    # 3. 无效输入测试用例
    #   1. 空数组
    print(su.findRepeatNumber([1, 2, 1, 3, 1]))
    print(su.findRepeatNumber([1, 2, 1]))
    print(su.findRepeatNumber([2, 3, 5, 0, 4, 1]))
    print(su.findRepeatNumber([]))
