//
//  102.binary-tree-level-order-traversal.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/4/15.
//

import Foundation

/*
 102. 二叉树的层序遍历 (中等)
 https://leetcode-cn.com/problems/binary-tree-level-order-traversal/
 */

class Solution102 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var queue1 = [root]
        var queue2 = [TreeNode]()
        var ans = [[Int]]()
        var levelVals = [Int]()
        while queue1.count > 0 {
            let head = queue1.removeFirst()!
            levelVals.append(head.val)
            
            if head.left != nil {
                queue2.append(head.left!)
            }
            if head.right != nil {
                queue2.append(head.right!)
            }
            
            if queue1.count == 0 {
                ans.append(levelVals)
                levelVals = [Int]()
                queue1 = queue2
                queue2 = [TreeNode]()
            }
        }
        return ans
    }
    
    /*
     测试用例：
     1. 节点都在左子树；节点都在右子树；节点分布在左右子树
     2. 仅1个节点；
     3. 空节点
     */
    func test() {
        let n1 = createTreeNode([1,2,nil,3,nil,nil,nil])
        let n2 = createTreeNode([1,nil,2,nil,3])
        let n3 = createTreeNode([3,9,20,nil,nil,15,7])
        let n4 = createTreeNode([3,9,20,15,7,nil,nil])
        let n5 = createTreeNode([1,nil,nil])
        print(levelOrder(n1))
        print(levelOrder(n2))
        print(levelOrder(n3))
        print(levelOrder(n4))
        print(levelOrder(n5))
        print(levelOrder(nil))
    }
}
