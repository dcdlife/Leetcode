//
//  16_203.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/9/27.
//

import Foundation

/*
 203. 移除链表元素 (简单)
 https://leetcode-cn.com/problems/remove-linked-list-elements/
 */

class Solution_203_3weeksDataStructures {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        // 哨兵元素
        let preHead = ListNode(0, head)
        
        var pre: ListNode? = preHead
        var cur = pre?.next
        while cur != nil {
            if cur!.val == val {
                let newCur = cur?.next
                pre?.next = cur?.next
                cur = newCur
            } else {
                pre = cur
                cur = cur?.next
            }
        }
        return preHead.next
    }
    
    func test() {
        printListNode(rootNode: removeElements(createListNode(values: [1,2,6,3,4,5,6]), 6))
        printListNode(rootNode: removeElements(createListNode(values: [1,2,6,3,4,5,6]), 1))
        printListNode(rootNode: removeElements(createListNode(values: [1]), 1))
    }
}
