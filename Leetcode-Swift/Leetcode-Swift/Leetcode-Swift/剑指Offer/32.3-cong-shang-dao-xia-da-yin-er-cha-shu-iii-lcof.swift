//
//  32.3-cong-shang-dao-xia-da-yin-er-cha-shu-iii-lcof.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/5/11.
//

import Foundation

/*
 剑指 Offer 32 - III. 从上到下打印二叉树 III (中等)
 https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-iii-lcof/
 */

class Solution_Offer_32_3 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        
        var queue = [root!]
        var direction = 1
        var ans = [[Int]]()
        while queue.count > 0 {
            var levelVals = [Int](repeating: 0, count: queue.count)
            let count = queue.count
            for i in 0..<count {
                let node = queue.removeFirst()
                if direction == 1 {
                    levelVals[i] = node.val
                } else {
                    levelVals[count - i - 1] = node.val
                }
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
            ans.append(levelVals)
            direction = 1 - direction
        }
        
        return ans
    }
    
    /*
     Test cases：
     1. 功能测试：完全/非完全二叉树；所有节点都在左子树；所有节点都在右子树
     2. 特殊输入测试：空树；只有1个节点的二叉树
     */
    func test() {
        print(levelOrder(createTreeNode([1,2,3,4,5,6,7])))
        print(levelOrder(createTreeNode([1,2,3,4,5,6,nil])))
        print(levelOrder(createTreeNode([1,2,nil,3,nil])))
        print(levelOrder(createTreeNode([1,nil,2,nil,3])))
        print(levelOrder(nil))
        print(levelOrder(createTreeNode([1,nil,nil])))
    }
}
