//
//  34.er-cha-shu-zhong-he-wei-mou-yi-zhi-de-lu-jing-lcof.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/5/12.
//

import Foundation

/*
 剑指 Offer 34. 二叉树中和为某一值的路径 (中等)
 https://leetcode-cn.com/problems/er-cha-shu-zhong-he-wei-mou-yi-zhi-de-lu-jing-lcof/
 */

class Solution_Offer_34 {
    func pathSum(_ root: TreeNode?, _ target: Int) -> [[Int]] {
        if root == nil {
            return []
        }
        var ans = [[Int]]()
        _pathSum(root!, [], 0, target, ans: &ans)
        return ans
    }
    
    func _pathSum(_ root: TreeNode, _ nums: [Int], _ sum: Int, _ target: Int, ans: inout [[Int]]) {
        if root.left == nil && root.right == nil {
            if sum + root.val == target {
                ans.append(nums + [root.val])
            }
            return
        }
        if root.left != nil {
            _pathSum(root.left!, nums + [root.val], sum + root.val, target, ans: &ans)
        }
        if root.right != nil {
            _pathSum(root.right!, nums + [root.val], sum + root.val, target, ans: &ans)
        }
    }
    
    /*
     测试用例：
     1. 功能测试：二叉树有1条、多条符合；没有符合
     2. 特殊输入测试：空树
     */
    func test() {
        print(pathSum(createTreeNode([5,4,8,11,nil,13,4,7,2,nil,nil,5,1]), 22))
        print(pathSum(createTreeNode([5,4,8,11,nil,13,4,7,2,nil,nil,1,1]), 22))
        print(pathSum(createTreeNode([5,4,8,11,nil,13,4,7,2,nil,nil,1,1]), 25))
        print(pathSum(nil, 10))
    }
}
