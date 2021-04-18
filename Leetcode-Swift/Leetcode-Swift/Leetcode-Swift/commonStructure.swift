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

/// Trie树（字典树）
class Trie {
    var isEndOfWord = false
    var nexts = [Character: Trie]()
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var next = self

        for character in word {
            if let temp = next.nexts[character] {
                next = temp
            } else {
                let temp = Trie()
                next.nexts[character] = temp
                next = temp
            }
        }

        next.isEndOfWord = true
    }
    
    func searchPrefix(_ prefix: String) -> Trie? {
        if prefix.count == 0 {
            return nil
        }
        
        var next = self
        for character in prefix {
            if let temp = next.nexts[character] {
                next = temp
            } else {
                return nil
            }
        }
        return next
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        let searchedNode = searchPrefix(word)
        return searchedNode != nil && searchedNode!.isEndOfWord
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        return searchPrefix(prefix) != nil
    }
}
