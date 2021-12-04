//
//  36.er-cha-sou-suo-shu-yu-shuang-xiang-lian-biao-lcof.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/5/14.
//

import Foundation

/*
 剑指 Offer 36. 二叉搜索树与双向链表 (中等)
 https://leetcode-cn.com/problems/er-cha-sou-suo-shu-yu-shuang-xiang-lian-biao-lcof/

 页末有javaascript解法
 */

class Solution_Offer_36 {
    func treeToDoublyList(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        var headNode: TreeNode? = root
        while headNode?.left != nil {
            headNode = headNode?.left
        }
        
        var last: TreeNode? = nil
        convert(root, &last)
        
        headNode?.left = last
        last?.right = headNode
        
        return headNode
    }
    
    func convert(_ root: TreeNode?, _ last: inout TreeNode?) {
        if root == nil {
            return
        }
        
        let current = root
        if current?.left != nil {
            convert(root?.left, &last)
        }
        
        current?.left = last
        if last != nil {
            last?.right = current
        }
        
        last = current
        if current?.right != nil {
            convert(root?.right, &last)
        }
    }
    
    func printDoubleList(_ root: TreeNode?) {
        if root == nil {
            print([])
            return
        }
        
        let sentry = root
        var ans = [root!.val]
        var root = root?.right
        while unsafeBitCast(root, to: UnsafeRawPointer.self) != unsafeBitCast(sentry, to: UnsafeRawPointer.self) {
            ans.append(root!.val)
            root =  root?.right
        }
        print(ans)
    }
    
    /*
     测试用例：
     1. 功能测试：完全二叉树；所有节点都在左子树/都在右子树；只有一个节点的二叉树
     2. 特殊输入测试：空树
     */
    func test() {
        printDoubleList(treeToDoublyList(createTreeNode([4,2,5,1,3,nil,nil])))
        printDoubleList(treeToDoublyList(createTreeNode([4,2,nil,1,nil,nil,nil])))
        printDoubleList(treeToDoublyList(createTreeNode([4,nil,5,nil,6,nil,nil])))
        printDoubleList(treeToDoublyList(createTreeNode([4,nil,nil])))
        
        printDoubleList(treeToDoublyList(nil))
    }
}


/*
var treeToDoublyList = function(root) {
 if (root == null) {
     return null
 }

 let head = root
 var tmp = root
 while (tmp.left != null) {
     head = tmp.left
     tmp = tmp.left
 }

 var last = null
 var convert = function(root) {
     if (root == null) {
         return
     }
 
     if (root.left) {
         convert(root.left)
     }
 
     root.left = last
     if (last != null) {
         last.right = root
     }
     
     last = root
     if (root.right) {
         convert(root.right)
     }
 }

 convert(root)

 head.left = last
 if (last != null) {
     last.right = head
 }

 return head
};
 */
