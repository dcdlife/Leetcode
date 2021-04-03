//
//  commonMethods.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/4/3.
//

import Foundation

func createListNode(values: [Int]) -> ListNode? {
    var resNode: ListNode? = nil
    if values.count > 0 {
        var lastNode: ListNode? = nil
        for value in values {
            let node = ListNode(value)
            if lastNode != nil {
                lastNode?.next = node
                lastNode = node
            } else {
                lastNode = node
                resNode = lastNode
            }
        }
    }
    return resNode
}

/// 依次打印链表节点
func printListNode(rootNode: ListNode?) {
    if rootNode == nil {
        return
    }
    var curNode = rootNode
    var result: [Int] = []
    repeat {
        result.append(curNode!.val)
        curNode = curNode!.next
    } while curNode != nil
    
    print(result, separator: ",", terminator: "\n")
}
