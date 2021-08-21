//
//  21_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/8/17.
//

import Foundation

/*
 21. 合并两个有序链表 (简单)
 https://leetcode-cn.com/problems/merge-two-sorted-lists/
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution_21_Day20Plan {
    // 递归解法
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        
        if l2 == nil {
            return l1
        }
        
        var root: ListNode? = nil
        if l1!.val <= l2!.val {
            root = ListNode(l1!.val)
            root?.next = mergeTwoLists(l1?.next, l2)
        } else {
            root = ListNode(l2!.val)
            root?.next = mergeTwoLists(l1, l2?.next)
        }
        
        return root
    }
    
    func test() {
        printListNode(rootNode: mergeTwoLists(createListNode(values: [1,2,4]), createListNode(values: [1,3,4])))
    }
}
