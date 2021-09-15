//
//  19_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/8/13.
//

import Foundation

/*
 19. 删除链表的倒数第 N 个结点 (中等)
 https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/
 */

class Solution_19_Day20Plan {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        // 哑节点，next指向head，可减少对head的特殊判断
        var dummy: ListNode? = ListNode(0, head)
        
        var fast = head
        var slow = dummy
        
        for _ in 0..<n {
            fast = fast?.next
        }
        
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        slow?.next = slow?.next?.next
        dummy = dummy?.next
        return dummy
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
