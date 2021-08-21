//
//  19_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/8/13.
//

import Foundation

/*
 19. 删除链表的倒数第 N 个结点 (中等)
 https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/
 */

class Solution_19_Day20Plan {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var head = head
        var step = n
        var slow = head
        var fast = head
        
        while step > 0 {
            fast = fast?.next
            step -= 1
        }
        
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        if fast == nil {
            head = head?.next
        } else {
            slow?.next = slow?.next?.next
        }
        
        return head
    }
    
    func test() {
        printListNode(rootNode: removeNthFromEnd(createListNode(values: [1,2,3,4,5]), 1))
        printListNode(rootNode: removeNthFromEnd(createListNode(values: [1,2,3,4,5]), 2))
        printListNode(rootNode: removeNthFromEnd(createListNode(values: [1,2,3,4,5]), 3))
        printListNode(rootNode: removeNthFromEnd(createListNode(values: [1,2,3,4,5]), 4))
        printListNode(rootNode: removeNthFromEnd(createListNode(values: [1,2,3,4,5]), 5))
        printListNode(rootNode: removeNthFromEnd(createListNode(values: [1]), 1))
    }
}
