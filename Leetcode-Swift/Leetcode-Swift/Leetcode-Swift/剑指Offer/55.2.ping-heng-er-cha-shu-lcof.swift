//
//  55.2.ping-heng-er-cha-shu-lcof.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/5/27.
//

import Foundation

/*
 剑指 Offer 55 - II. 平衡二叉树 (简单)
 https://leetcode-cn.com/problems/ping-heng-er-cha-shu-lcof/
 */

class Solution_Offer_55_2 {
    
    /// 方法二：利用后序遍历，仅需遍历一次节点
    func isBalanced(_ root: TreeNode?) -> Bool {
        var depth = 0
        return isBalancedCore(root, &depth)
    }
    
    func isBalancedCore(_ root: TreeNode?, _ depth: inout Int) -> Bool {
        if root == nil {
            depth = 0
            return true
        }
        
        var left = 0, right = 0
        if isBalancedCore(root?.left, &left) && isBalancedCore(root?.right, &right) {
            let diff = left - right
            if diff >= -1 && diff <= 1 {
                depth = max(left, right) + 1
                return true
            }
        }
        
        return false
    }
    
    /// 方法一：会重复遍历节点的做法（不好）
    func isBalanced_1(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        let leftDepth = maxDepth(root?.left)
        let rightDepth = maxDepth(root?.right)
        if abs(leftDepth - rightDepth) > 1 {
            return false
        }
        
        return isBalanced(root?.left) && isBalanced(root?.right)
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
    
    func test() {
        let tests = [
            [3,9,20,nil,nil,15,7],
            [1,2,2,3,3,nil,nil,4,4,nil,nil]
        ]
        for i in tests {
            print(isBalanced(createTreeNode(i)))
        }
    }
}
