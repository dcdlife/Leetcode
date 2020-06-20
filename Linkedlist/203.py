"""
203. 移除链表元素
简单
https://leetcode-cn.com/problems/remove-linked-list-elements/
"""

# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    def removeElements(self, head: ListNode, val: int) -> ListNode:
        while head and head.val == val:
            head = head.next

        if not head:
            return None
        
        last = head
        while last.next:
            if last.next.val == val:
                last.next = last.next.next
            else:
                last = last.next
                
        return head
        