"""
350. 两个数组的交集 II
简单
https://leetcode-cn.com/problems/intersection-of-two-arrays-ii/
"""

from typing import List

class Solution:
    # 56ms      91.65%
    # 13.8MB    12.50%
    def intersect(self, nums1: List[int], nums2: List[int]) -> List[int]:
        if not nums1 or not nums2:
            return []
        dict_nums1 = {}
        dict_nums2 = {}
        for i in nums1:
            if i not in dict_nums1:
                dict_nums1[i] = 1
            else:
                dict_nums1[i] += 1
        
        for i in nums2:
            if i not in dict_nums2:
                dict_nums2[i] = 1
            else:
                dict_nums2[i] += 1

        res = []
        for i in dict_nums1.keys():
            if i in dict_nums2:
                res += [i] * min(dict_nums1[i], dict_nums2[i])
        return res
            