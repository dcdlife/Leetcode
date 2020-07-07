"""
112.路径总和
简单
https://leetcode-cn.com/problems/path-sum/
"""

# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def hasPathSum(self, root: TreeNode, sum: int) -> bool:
        if root == None:
            return False
        if root.left == None and root.right == None and root.val == sum:
            return True
        if root.left:
            if self.hasPathSum(root.left, sum - root.val):
                return True
        if root.right:
            if self.hasPathSum(root.right, sum - root.val):
                return True
        return False
