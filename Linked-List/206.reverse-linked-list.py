"""
206. 反转链表
简单
https://leetcode-cn.com/problems/reverse-linked-list/
"""

# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    # 方法一: 递归
    # 64 ms	18.5 MB
    def reverseList1(self, head: ListNode) -> ListNode:
        if head == None or head.next == None:
            return head
        
        newHead = self.reverseList(head.next)
        head.next.next = head
        head.next = None
        return newHead

    # 方法二: 迭代
    # 44 ms	14.7 MB
    def reverseList(self, head: ListNode) -> ListNode:
        if head == None or head.next == None:
            return head
        
        newHead = None
        while head != None:
            temp = head.next
            head.next = newHead
            newHead = head
            head = temp

        return newHead


