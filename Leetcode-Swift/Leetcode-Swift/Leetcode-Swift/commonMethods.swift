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

func createCycleListNode(_ values: [Int], pos: Int) -> ListNode? {
    if values.count != 0 && pos != -1 {
        let head: ListNode? = createListNode(values: values)
        
        var endNode: ListNode? = head
        while endNode?.next != nil {
            endNode = endNode?.next
        }
        
        var entranceNode: ListNode? = head
        var index = 0
        while index != pos {
            index += 1
            entranceNode = entranceNode?.next
        }
        
        endNode?.next = entranceNode
        return head
    } else {
        return createListNode(values: values)
    }
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

func createTreeNode(_ list: [Int?]) -> TreeNode? {
    if list.count < 3 || list[0] == nil {
        return nil
    }
    var queue: [Int?] = list
    let root = TreeNode(list[0]!)
    queue.removeFirst()
    var waitToSetNodes: [TreeNode] = [root]
    while queue.count != 0 {
        var tmpNewNodes: [TreeNode] = []
        for node in waitToSetNodes {
            if queue[0] != nil {
                let left = TreeNode(queue[0]!)
                node.left = left
                tmpNewNodes.append(left)
            }
            queue.removeFirst()
            if queue[0] != nil {
                let right = TreeNode(queue[0]!)
                node.right = right
                tmpNewNodes.append(right)
            }
            queue.removeFirst()
        }
        waitToSetNodes = tmpNewNodes
    }
    return root
}
