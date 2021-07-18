//
//  33.er-cha-sou-suo-shu-de-hou-xu-bian-li-xu-lie-lcof.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/5/12.
//

import Foundation

/*
 剑指 Offer 33. 二叉搜索树的后序遍历序列 (中等)
 https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-hou-xu-bian-li-xu-lie-lcof/
 */

class Solution_Offer_33 {
    func verifyPostorder(_ postorder: [Int]) -> Bool {
        let count = postorder.count
        
        if count <= 1 {
            return true
        }
        
        let root = postorder.last!
        
        var left = 0
        for i in postorder[...(count - 2)] {
            if i > root  {
                break
            }
            left += 1
        }
        
        let right = left
        if right < (count - 1) {
            for i in postorder[right...(count - 2)] {
                if i < root {
                    return false
                }
            }
        }
        
        var leftValid = true
        if left > 0 {
            leftValid = verifyPostorder(Array(postorder[0...left-1]))
        }
        
        var rightValid = true
        if right <= count - 2 {
            rightValid = verifyPostorder(Array(postorder[right...(count - 2)]))
        }
        
        return leftValid && rightValid
    }
    
    /*
     测试用例：
     1. 功能测试：输入的后序序列对应一颗二叉树：完全二叉树、只有左子树、只有右子树、只有1个节点；输入的后续序列不对应一颗二叉树
     2. 特殊输入测试：空树
     */
    func test() {
        print(verifyPostorder([1,3,2]))
        print(verifyPostorder([1,3,2,6,5]))
        print(verifyPostorder([1,2,5]))
        print(verifyPostorder([7,6,5]))
        print(verifyPostorder([7]))
        print(verifyPostorder([]))
    }
}
