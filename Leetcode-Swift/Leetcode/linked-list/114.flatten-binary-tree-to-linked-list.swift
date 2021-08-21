//
//  114.flatten-binary-tree-to-linked-list.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/6/29.
//

import Foundation

/*
 114. 二叉树展开为链表 (中等)
 https://leetcode-cn.com/problems/flatten-binary-tree-to-linked-list/
 */

class Solution_114 {
    
    /// 非原地
    func flatten(_ root: TreeNode?) {
        if root == nil {
            return
        }
        
        var nodes = [TreeNode]()
        var queue = [root!]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if node.right != nil {
                queue.insert(node.right!, at: 0)
            }
            if node.left != nil {
                queue.insert(node.left!, at: 0)
            }
            nodes.append(node)
        }
        
        
        var pre = root
        for i in nodes[1...] {
            pre?.left = nil
            pre?.right = i
            pre = i
        }
    }
    
    func test() {
        let tests = [
            createTreeNode([1,2,5,3,4,nil,6]),
            nil,
            createTreeNode([0])
        ]
        
        for i in tests {
            flatten(i)
            print(i?.levelOrder() ?? 0)
        }
    }
}
