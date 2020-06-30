"""
面试题 02.01. 移除重复节点
简单
https://leetcode-cn.com/problems/remove-duplicate-node-lcci/
"""

import sys
import os

curPath = os.path.abspath(os.path.dirname(__file__))
rootPath = os.path.split(curPath)[0]
sys.path.append(rootPath + '/Common')

import YCUtil

# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    # 方法一: 借助额外的数组
    # 2184 ms   9.95%
    # 19.5 MB   100.00%
    def removeDuplicateNodes(self, head: ListNode) -> ListNode:
        elements = []
        node = head
        while node:
            if node.val not in elements:
                elements.append(node.val)
                last = node
                node = node.next
            else:
                last.next = last.next.next
                node = node.next
        return head


if __name__ == "__main__":
    test = [
        [1,2,3,3,2,1],
        [1,1]
    ]
    for i in test:
        root = YCUtil.numbersToListNode(i)
        print(YCUtil.listNodeToString(root))