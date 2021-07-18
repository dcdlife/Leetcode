//
//  06.cong-wei-dao-tou-da-yin-lian-biao-lcof.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/4/25.
//

import Foundation

/*
 剑指 Offer 06. 从尾到头打印链表 (简单)
 https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/
 */
class Solution_Offer_06 {
    func reversePrint(_ head: ListNode?) -> [Int] {
        if head == nil {
            return []
        }
        var head = head
        var ans = [Int]()
        while head != nil {
            ans.insert(head!.val, at: 0)
            head = head!.next
        }
        return ans
    }
    
    /*
     测试用例：
     1. 功能测试：输入的链表有多个节点；输入的链表只有1个节点
     2. 特殊输入测试：空指针
     */
    func test() {
       print(reversePrint(createListNode(values: [1,2,3])))
        print(reversePrint(createListNode(values: [1,3,2])))
        print(reversePrint(createListNode(values: [1])))
    }
}
