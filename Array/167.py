"""
167. 两数之和 II - 输入有序数组
简单
https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted/
"""

from typing import List

class Solution:
    # 方法一: 双指针

    # 56 ms	    25.59%
    # 13.8 MB   6.25%
    def twoSum(self, numbers: List[int], target: int) -> List[int]:
        n = len(numbers)
        left = 0
        right = n - 1
        while left < right:
            v_left = numbers[left]
            v_right = numbers[right]
            value = v_left + v_right
            if value == target:
                return [left + 1, right + 1]
            elif value > target:
                right -= 1
            else:
                left += 1
        return []