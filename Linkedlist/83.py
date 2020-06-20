"""
83. 删除排序链表中的重复元素
简单
https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/
"""

# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    # 68 ms	  14.03
    # 13.8 MB 6.06
    def deleteDuplicates(self, head: ListNode) -> ListNode:
        last = head
        while last and last.next:
            if last.val == last.next.val:
                last.next = last.next.next
            else:
                last = last.next
        return head