"""
105. 从前序与中序遍历序列构造二叉树 (中等)
https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

根据一棵树的前序遍历与中序遍历构造二叉树。

注意:
你可以假设树中没有重复的元素。

例如，给出

前序遍历 preorder = [3,9,20,15,7]
中序遍历 inorder = [9,3,15,20,7]
返回如下的二叉树：

    3
   / \
  9  20
    /  \
   15   7
"""

from typing import List

# Definition for a binary tree node.


class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:

    # 利用递归，每次递归都是一个子树的前序、中序遍历结果。根据前序的第一个元素确定根节点，然后分别在两个数组中找到左子树数组和右子树数组

    # 复杂度:
    # 时间复杂度：O(n)，其中 n 是树中的节点个数。
    # 空间复杂度：O(n)，除去返回的答案需要的 O(n) 空间之外，我们还需要使用 O(n) 的空间存储哈希映射，
    # 以及 O(h)（其中 h 是树的高度）的空间表示递归时栈空间。这里 h < n，所以总空间复杂度为 O(n)。

    # 执行用时：56 ms, 在所有 Python3 提交中击败了86.56%的用户
    # 内存消耗：18.2 MB, 在所有 Python3 提交中击败了69.40%的用户
    def buildTree(self, preorder: List[int], inorder: List[int]) -> TreeNode:
        def myBuildTree(preorder_left: int, preorder_right: int, inorder_left: int, inorder_right: int):
            if preorder_left > preorder_right:
                return None
            preorder_root = preorder_left
            inorder_root = index[preorder[preorder_root]]

            root = TreeNode(preorder[preorder_root])
            size_left_subtree = inorder_root - inorder_left
            root.left = myBuildTree(
                preorder_left + 1, preorder_left + size_left_subtree, inorder_left, inorder_root - 1)
            root.right = myBuildTree(
                preorder_left + size_left_subtree + 1, preorder_right, inorder_root + 1, inorder_right)
            return root

        n = len(preorder)
        index = {element: i for i, element in enumerate(inorder)}
        return myBuildTree(0, n - 1, 0, n - 1)


if __name__ == "__main__":
    node1 = TreeNode(1)
    node2 = TreeNode(9)
    node3 = TreeNode(20)
    node4 = TreeNode(15)
    node5 = TreeNode(7)

    node1.left = node2
    node1.right = node3
    node3.left = node4
    node3.right = node5

    su = Solution()
    node = su.buildTree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])
    print(node.val)
