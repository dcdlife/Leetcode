"""
剑指 Offer 06. 从尾到头打印链表 (简单)
https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/

输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。

示例 1：

输入：head = [1,3,2]
输出：[2,3,1]

限制：

0 <= 链表长度 <= 10000
"""

from typing import List

# Definition for singly-linked list.


class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None


class Solution:
    # 执行用时：56 ms, 在所有 Python3 提交中击败了40.04%的用户
    # 内存消耗：15 MB, 在所有 Python3 提交中击败了38.24%的用户
    def reversePrint1(self, head: ListNode) -> List[int]:
        res = []
        while head:
            res.insert(0, head.val)
            head = head.next

        return res

    # 利用栈
    # 执行用时：36 ms, 在所有 Python3 提交中击败了98.33%的用户
    # 内存消耗：15 MB, 在所有 Python3 提交中击败了32.95%的用户
    def reversePrint(self, head: ListNode) -> List[int]:
        stack = []
        while head:
            stack.append(head.val)
            head = head.next
        res = []
        while len(stack):
            res.append(stack.pop())
        return res


if __name__ == "__main__":
    su = Solution()
    head = ListNode(1)
    node2 = ListNode(2)
    node3 = ListNode(3)
    head.next = node2
    node2.next = node3
    print(su.reversePrint(None))
    print(su.reversePrint(head))
    print(su.reversePrint(node2))
    print(su.reversePrint(node3))
