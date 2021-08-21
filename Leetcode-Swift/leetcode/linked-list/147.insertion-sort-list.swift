//
//  147.insertion-sort-list.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/6/16.
//

import Foundation

/*
 147. 对链表进行插入排序 (中等)
 https://leetcode-cn.com/problems/insertion-sort-list/
 */

class Solution_147 {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var ans = head
        var cur = head?.next
        ans?.next = nil
        
        while cur != nil {
            let next = cur?.next
            cur?.next = nil
            
            var tmpPre: ListNode? = nil
            var tmpCur: ListNode? = ans
            while tmpCur != nil {
                if cur!.val <= tmpCur!.val  {
                    break
                }
                tmpPre = tmpCur
                tmpCur = tmpCur?.next
            }
            
            if tmpPre == nil {
                cur?.next =  ans
                ans = cur
            } else {
                tmpPre?.next = cur
                cur?.next = tmpCur
            }
            
            cur = next
        }
        
        return ans
    }
    
    /*
     测速用例
     1. 功能：全有序；仅1或2个节点有序或无序；全倒序；错乱序
     2. 特殊：空链表
     */
    func test() {
        let tests = """
[]
[1]
[1,2]
[1,2,3]
[1,2,3,4]
[1,2,3,4,5]
[5,4,3,2,1]
[3,2,10,1]
[2,1]
[4,2,1,3]
[-1,5,3,4,0]
"""
        for i in LeetCodeTestCaseTool.arrayWithMultilineText(tests) {
            let rootNode = createListNode(values: i)
            printListNode(rootNode: insertionSortList(rootNode))
        }
    }
}
