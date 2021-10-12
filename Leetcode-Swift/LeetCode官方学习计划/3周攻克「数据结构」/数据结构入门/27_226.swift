//
//  27_226.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/10/9.
//

import Foundation

/*
 226. 翻转二叉树 (简单)
 https://leetcode-cn.com/problems/invert-binary-tree/
 
 解法：
 1. 递归
 2. BFS
 3. DFS
 */

class Solution_226_3weeksDataStructures {
    
    /// DFS
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        var stack = [root!]
        while !stack.isEmpty {
            let node = stack.removeLast()
            let tmp = node.left
            node.left = node.right
            node.right = tmp
            
            if node.left != nil {
                stack.append(node.left!)
            }
            if node.right != nil {
                stack.append(node.right!)
            }
        }
        
        return root
    }
    
    /// BFS (层次遍历翻转)
    func invertTree_2(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        var queue = [root!]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            let tmp = node.left
            node.left = node.right
            node.right = tmp
            
            if node.left != nil {
                queue.append(node.left!)
            }
            if node.right != nil {
                queue.append(node.right!)
            }
        }
        
        return root
    }
    
    /// 递归
    func invertTree_1(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        let left = invertTree(root?.left)
        let right = invertTree(root?.right)
        
        root?.left = right
        root?.right = left
        
        return root
    }
    
    func test() {
        var root = createTreeNode([4,2,7,1,3,6,9])
        print(invertTree(root)?.levelOrder())
    }
}
