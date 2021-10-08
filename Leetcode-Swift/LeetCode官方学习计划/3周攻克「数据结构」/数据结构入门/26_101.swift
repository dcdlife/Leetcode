//
//  26_101.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/10/8.
//

import Foundation

/*
 101. 对称二叉树 (简单)
 https://leetcode-cn.com/problems/symmetric-tree/
 */

class Solution_101_3weeksDataStructures {
    
    /// 迭代
    func isSymmetric(_ root: TreeNode?) -> Bool {
        func check(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            var queue = [p, q]
            while !queue.isEmpty {
                let head1 = queue.removeFirst()
                let head2 = queue.removeFirst()
                if head1 == nil && head2 == nil {
                    continue
                }
                if head1 == nil || head2 == nil || head1!.val != head2!.val {
                    return false
                }
                queue.append(head1?.left)
                queue.append(head2?.right)
              
                queue.append(head1?.right)
                queue.append(head2?.left)
            }
            
            return true
        }
        
        return check(root, root)
    }
    
    /// 递归
    func isSymmetric_1(_ root: TreeNode?) -> Bool {
        func check(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if p == nil && q == nil {
                return true
            }
            if p == nil || q == nil {
                return false
            }
            return p!.val == q!.val && check(p?.left, q?.right) && check(p?.right, q?.left)
        }
        
        return check(root, root)
    }
    
    func test() {
        let n1 = createTreeNode([1,2,2,3,4,4,3])
        print(isSymmetric(n1))
    }
}
