"""
108. 将有序数组转换为二叉搜索树
简单
https://leetcode-cn.com/problems/convert-sorted-array-to-binary-search-tree/
"""

from typing import List

# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
    # 方法一: 递归

    # 60 ms	    62.41%
    # 15.9 MB   9.52%
    def sortedArrayToBST(self, nums: List[int]) -> TreeNode:
        if not nums:
            return None
        n = len(nums)
        mid = n // 2
        root = TreeNode(nums[mid])
        if mid > 0:
            left = self.sortedArrayToBST(nums[:mid])
            root.left = left
        if n - 1 - mid > 0:
            right = self.sortedArrayToBST(nums[mid + 1:])
            root.right = right
        return root


        
