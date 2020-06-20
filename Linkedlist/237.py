"""
237. 删除链表中的节点 
简单
https://leetcode-cn.com/problems/delete-node-in-a-linked-list/
"""

# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    # 方法一: 先替换元素，然后删除结点
    # 执行用时: 68ms, 12.78%
    # 内存消耗: 14MB, 7.14%
    def deleteNode(self, node):
        """
        :type node: ListNode
        :rtype: void Do not return anything, modify node in-place instead.
        """
        node.val = node.next.val
        node.next = node.next.next



