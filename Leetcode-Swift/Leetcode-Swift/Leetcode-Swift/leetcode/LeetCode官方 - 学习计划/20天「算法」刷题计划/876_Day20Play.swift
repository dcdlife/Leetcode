//
//  876_Day20Play.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/8/13.
//

import Foundation

/*
 876. 链表的中间结点 (简单)
 https://leetcode-cn.com/problems/middle-of-the-linked-list/
 */

class Solution_876_Day20Play {
    func middleNode(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var slow = head
        var fast = head
        while slow?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return fast?.next == nil ? slow : slow?.next
    }
    
    func test() {
        printListNode(rootNode: middleNode(createListNode(values: [1,])))
        printListNode(rootNode: middleNode(createListNode(values: [1,2])))
        printListNode(rootNode: middleNode(createListNode(values: [1,2,3])))
        printListNode(rootNode: middleNode(createListNode(values: [1,2,3,4])))
        printListNode(rootNode: middleNode(createListNode(values: [1,2,3,4,5])))
    }
}
