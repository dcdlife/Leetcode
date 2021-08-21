//
//  617_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/8/15.
//

import Foundation

/*
 617. 合并二叉树 (简单)
 https://leetcode-cn.com/problems/merge-two-binary-trees/
 */

class Solution_617_Day20Plan {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let root1 = root1 else {
            return root2
        }
        guard let root2 = root2 else {
            return root1
        }
        
        let newNode = TreeNode(root1.val + root2.val)
        newNode.left = self.mergeTrees(root1.left, root2.left)
        newNode.right = self.mergeTrees(root1.right, root2.right)
        return newNode
    }
    
    func test() {
        print(mergeTrees(createTreeNode([1,3,2,5,nil,nil,nil]), createTreeNode([2,1,3,nil,4,nil,7]))!.levelOrder())
    }
}
