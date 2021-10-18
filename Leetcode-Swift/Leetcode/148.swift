//
//  148.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/10/19.
//

import Foundation

/*
 148. 排序链表 (中等)
 https://leetcode-cn.com/problems/sort-list/
 */

class Solution_148 {
    func sortList(_ head: ListNode?) -> ListNode? {
        func merge(_ head1: ListNode?, _ head2: ListNode?) -> ListNode? {
            let dummyHead = ListNode(0)
            var pre: ListNode? = dummyHead, head1 = head1, head2 = head2
            while head1 != nil && head2 != nil {
                if head1!.val <= head2!.val {
                    pre?.next = head1
                    head1 = head1?.next
                } else {
                    pre?.next = head2
                    head2 = head2?.next
                }
                pre = pre?.next
            }
            if head1 != nil {
                pre?.next = head1
            } else {
                pre?.next = head2
            }
            
            return dummyHead.next
        }
        
        func sort(_ head: ListNode?, _ tail: ListNode?) -> ListNode? {
            if head == nil {
                return nil
            }
            if head?.next === tail {
                head?.next = nil
                return head
            }
            var slow = head, fast = head
            while fast !== tail {
                slow = slow?.next
                fast = fast?.next
                if fast !== tail {
                    fast = fast?.next
                }
            }
            let mid = slow
            return merge(sort(head, mid), sort(mid, tail))
        }
        
        return sort(head, nil)
    }
    
    func test() {
        printListNode(rootNode: sortList(createListNode(values: [6,5,4,3,2])))
    }
}
