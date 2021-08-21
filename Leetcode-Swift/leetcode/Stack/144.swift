//
//  144.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/7/20.
//

import Foundation

/*
 144. 二叉树的前序遍历 (简单)
 https://leetcode-cn.com/problems/binary-tree-preorder-traversal/
 */

class Solution_144 {
    /// 法一：递归
    func preorderTraversal_1(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var ans = [root!.val]
        ans += preorderTraversal(root?.left)
        ans += preorderTraversal(root?.right)
        return ans
    }
    
    /// 法二：迭代
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var ans = [Int]()
        var node = root
        var stack = [TreeNode]()
        while node != nil || !stack.isEmpty {
            while node != nil {
                ans.append(node!.val)
                stack.append(node!)
                node = node?.left
            }
            node = stack.removeLast().right
        }
        return ans
    }
    
    func test() {
        print(preorderTraversal(createTreeNode([1,2,3,4,5,6,7])))
    }
}
