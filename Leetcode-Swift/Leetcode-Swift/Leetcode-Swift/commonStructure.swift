//
//  commonStructure.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/4/3.
//

import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    // MARK: - 实例方法
    func inorder() -> [Int] {
        return TreeNode.inorder(self)
    }
    
    func preorder(_ root: TreeNode?) -> [Int] {
        return TreeNode.preorder(self)
    }
    
    func postorder(_ root: TreeNode?) -> [Int] {
        return TreeNode.preorder(self)
    }
    
    // MARK: - 类方法
    public static func inorder(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        return inorder(root?.left) + [root!.val] + inorder(root?.right)
    }
    
    public static func preorder(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        return [root!.val] + inorder(root?.left) +  inorder(root?.right)
    }
    
    public static func postorder(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        return inorder(root?.left) +  inorder(root?.right) + [root!.val]
    }
}
