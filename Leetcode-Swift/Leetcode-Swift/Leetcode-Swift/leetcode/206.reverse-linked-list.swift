//
//  2.reverse-linked-list.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/4/3.
//

import Foundation

//: 206. 反转链表（简单）
//: https://leetcode-cn.com/problems/reverse-linked-list/
/*
 反转一个单链表。

 示例:

 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
 */

class Solution206 {
    // 递归解法：
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }
        let last: ListNode? = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return last
    }
    
    // 迭代解法
    func reverseList_iteration(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil, cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
    
    func test() {
        let node5 = ListNode(5)
        let node4 = ListNode(4, node5)
        let node3 = ListNode(3, node4)
        let node2 = ListNode(2, node3)
        let node1: ListNode? = ListNode(1, node2)

        printListNode(rootNode: node1)

        let su = Solution206()
        let newRootNode = su.reverseList_iteration(node1)
        print(newRootNode!.val)
        printListNode(rootNode: newRootNode)
    }
    
    func testCase() {
        /*
         1. 一个、多个节点
         2. 空
         */
    }
}
