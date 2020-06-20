"""
876. 链表的中间结点
简单
https://leetcode-cn.com/problems/middle-of-the-linked-list/
"""

# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    # 44 ms	    37.07%
    # 13.6 MB   14.29%
    def middleNode(self, head: ListNode) -> ListNode:
        if not head or not head.next:
            return head

        slow = head
        fast = head
        while fast and fast.next and fast.next.next:
            slow = slow.next
            fast = fast.next.next
            
        if fast.next:
            return slow.next
        else:
            return slow