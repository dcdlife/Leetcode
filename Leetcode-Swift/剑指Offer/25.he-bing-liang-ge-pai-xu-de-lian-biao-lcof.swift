//
//  25.he-bing-liang-ge-pai-xu-de-lian-biao-lcof.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/5/8.
//

import Foundation

/*
 剑指 Offer 25. 合并两个排序的链表 (简单)
 https://leetcode-cn.com/problems/he-bing-liang-ge-pai-xu-de-lian-biao-lcof/
 */

class Solution_Offer_25 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil {
            return l1 == nil ? l2 : l1
        }
        var head1 = l1
        var head2 = l2
        var ansHead: ListNode? = nil
        if head1!.val <= head2!.val {
            ansHead = head1
            head1 = head1?.next
        } else {
            ansHead = head2
            head2 = head2?.next
        }
        var tailNode = ansHead
        while head1 != nil && head2 != nil {
            if head1!.val <= head2!.val {
                tailNode?.next = head1
                head1 = head1?.next
            } else {
                tailNode?.next = head2
                head2 = head2?.next
            }
            tailNode = tailNode?.next
        }
        if head1 != nil {
            tailNode?.next = head1
        }
        if head2 != nil {
            tailNode?.next = head2
        }
        
        return ansHead
    }
    
    /*
     测试用例：
     1. 功能测试：两个链表都有值（一个多一个少；两个一样多）、l1或l2其中一个为空
     2. 特殊输入测试：两个都为空
     */
    func test() {
        printListNode(rootNode: mergeTwoLists(createListNode(values: [1,2,3]), createListNode(values: [4,5,6])))
        printListNode(rootNode: mergeTwoLists(createListNode(values: [1,2,3]), nil))
        printListNode(rootNode: mergeTwoLists(nil, createListNode(values: [4,5,6])))
        printListNode(rootNode: mergeTwoLists(createListNode(values: [1,2,3,4,5]), createListNode(values: [4,5,6])))
        printListNode(rootNode: mergeTwoLists(createListNode(values: [1,2,3]), createListNode(values: [1,2,3,4,5,6])))
        
        printListNode(rootNode: mergeTwoLists(nil, nil))
        printListNode(rootNode: mergeTwoLists(createListNode(values: [1]), createListNode(values: [1])))
    }
}
