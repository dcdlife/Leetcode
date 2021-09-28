//
//  18_83.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/9/28.
//

import Foundation

/*
 83. 删除排序链表中的重复元素 (简单)
 https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/
 */

class Solution_83_3weeksDataStructures {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var pre = head
        var cur = pre?.next
        while cur != nil {
            let newCur = cur?.next
            if pre!.val == cur!.val {
                pre?.next = cur?.next
            } else {
                pre = cur
            }
            cur = newCur
        }
        return head
    }
    
    func test() {
        printListNode(rootNode: deleteDuplicates(createListNode(values: [1,1,2,3,3])))
        printListNode(rootNode: deleteDuplicates(createListNode(values: [1,1,2])))
        printListNode(rootNode: deleteDuplicates(createListNode(values: [1,1])))
    }
}
