//
//  234.palindrome-linked-list.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/6/11.
//

import Foundation

/*
 234. 回文链表 (简单)
 https://leetcode-cn.com/problems/palindrome-linked-list/
 */

/*
 思路：
 思路1. 利用数组/栈/队列，保存前半部分的值，然后再遍历后半部分， 看是否相等
 思路2. 不需要额外的辅助空间，翻转前半部分链表
 */
class Solution_234 {
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil {
            return false
        }
        
        var count = 0
        var node = head
        while node != nil {
            count += 1
            node = node?.next
        }
        
        let mid = count / 2
        var pre: ListNode? = nil
        var cur = head
        for _ in 0..<mid {
            let next = cur!.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        
        cur = count & 1 == 0 ? cur : cur!.next
        for _ in 0..<mid {
            if pre?.val != cur?.val {
                return false
            }
            pre = pre?.next
            cur = cur?.next
        }
        
        return true
    }
    
    func isPalindrome_1(_ head: ListNode?) -> Bool {
        if head == nil {
            return false
        }
        
        var count = 0
        var node = head
        var allVals = [Int]()
        while node != nil {
            count += 1
            allVals.append(node!.val)
            node = node?.next
        }
        
        if allVals.count == 1 {
            return true
        }
        
        let mid = count / 2
        for i in 0..<mid {
            if allVals[i] != allVals[count - i - 1] {
                return false
            }
        }
        
        return true
    }
    
    /*
     测试用例：
     1. 功能：仅有1个节点、2个及多个节点【是/不是】回文链表
     2. 特殊：空链表
     */
    func test() {
        let tests = """
[1]
[1,1]
[1,2]
[1,2,3,2,1]
[1,2,3,3,1]
[]
"""
        for i in LeetCodeTestCaseTool.arrayWithMultilineText(tests) {
            print(isPalindrome(createListNode(values: i)))
        }
    }
}
