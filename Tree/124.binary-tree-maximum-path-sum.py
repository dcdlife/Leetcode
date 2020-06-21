"""
124. 二叉树中的最大路径和
困难
https://leetcode-cn.com/problems/binary-tree-maximum-path-sum/
"""

# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
    # 方法一: 递归求解。
    # 节点的最大路径和为 节点的值 + max(左节点路径最大值, 0) + max(右节点的路径最大值, 0)
    # 156 ms	10.09%
    # 20.2 MB   40.00%
    def maxPathSum(self, root: TreeNode) -> int:
        self.maxSum = float('-inf')
        self.maxPathSumWithRootNode(root)
        return self.maxSum
        
    def maxPathSumWithRootNode(self, rootNode: TreeNode) -> int:
        if not rootNode:
            return 0

        leftPathSum = max(self.maxPathSumWithRootNode(rootNode.left), 0)
        rightPathSum = max(self.maxPathSumWithRootNode(rootNode.right), 0)
        rootPathSum = rootNode.val + leftPathSum + rightPathSum

        self.maxSum = max(self.maxSum, rootPathSum)
        
        return rootNode.val + max(leftPathSum, rightPathSum)

    