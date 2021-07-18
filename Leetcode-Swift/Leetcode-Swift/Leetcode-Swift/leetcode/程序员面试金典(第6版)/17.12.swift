//
//  17.12.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/7/13.
//

import Foundation

/*
 面试题 17.12. BiNode (简单)
 https://leetcode-cn.com/problems/binode-lcci/
 */

class Solution_Jindian_17_12 {
    func convertBiNode(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        return convertBiNodeCore(root).0
    }
    
    func convertBiNodeCore(_ root: TreeNode?) -> (TreeNode?, TreeNode?) {
        if root == nil {
            return (nil, nil)
        }
        let (headLeft, endLeft) = convertBiNodeCore(root?.left)
        let (headRight, endRight) = convertBiNodeCore(root?.right)
        
        root?.left = nil
        root?.right = nil
        
        if endLeft != nil {
            endLeft?.right = root
        }
        if headRight != nil {
            root?.right = headRight
        }
        
        let head = headLeft ?? endLeft ?? root
        let end = endRight ?? headRight ?? root
        return (head, end)
    }
    
    /*
     测试用例：
     1. 功能：满二叉搜索树、都在左/右子树的二叉搜索树、普通二叉搜索树
     2. 特殊：只有1个节点的二叉树搜索树
     */
    func test() {
        
    }
}
