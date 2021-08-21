//
//  236.lowest-common-ancestor-of-a-binary-tree.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/4/10.
//

import Foundation
/*
 236. 二叉树的最近公共祖先 (中等)
 https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/
 */

class Solution236 {
    /*
     迭代：遍历树，记录每个节点的父节点。通过利用哈希表记录p和q访问过的父节点，已经访问过的父节点即为最近的公共祖先节点
     */
    func dfs(_ root: TreeNode?, _ dict: inout [Int : TreeNode]) {
        if root == nil {
            return
        }
        if let left = root?.left {
            dict[left.val] = root
            dfs(left, &dict)
        }
        if let right = root?.right {
            dict[right.val] = root
            dfs(right, &dict)
        }
    }
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || p == nil || q == nil {
            return nil
        }
        var dict: [Int: TreeNode] = [:]
        dfs(root, &dict)
        dict[root!.val] = nil
        
        var markDict: [Int: Bool] = [:]
        var tmpP = p
        while tmpP != nil {
            markDict[tmpP!.val] = true
            tmpP = dict[tmpP!.val]
        }
        var tmpQ = q
        while tmpQ != nil {
            if let exist = markDict[tmpQ!.val], exist == true {
                return tmpQ
            }
            tmpQ = dict[tmpQ!.val]
        }
        
        return nil
    }
    
    /*
     思路：递归
     */
    func lowestCommonAncestor_recursive(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || p == nil || q == nil {
            return nil
        }
        if root! === p! || root! === q! {
            return root
        }
        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)
        return left == nil ? right : (right == nil ? left : root)
    }
    
    /*
     测试用例：
     1. 有公共祖先：公共祖先为q或q或根节点；p/q相等；公共祖先在左子树；公共祖先在右子树
     2. 没有公共祖先
     3. 空节点
     */
    func test() {
        let root1 = createTreeNode([5,3,9,2,4,7,10])
        print(lowestCommonAncestor(root1, root1?.left, root1?.left?.right)?.val)
        print(lowestCommonAncestor(root1, root1?.right, root1?.right?.left)?.val)
        print(lowestCommonAncestor(root1, root1?.right?.left, root1?.right?.left)?.val)
        print(lowestCommonAncestor(root1, root1?.left?.left, root1?.right?.right)?.val)
        print(lowestCommonAncestor(root1, root1?.left?.left, root1?.left?.right)?.val)
        print(lowestCommonAncestor(root1, root1?.right?.left, root1?.right?.right)?.val)
        print(lowestCommonAncestor(root1, root1?.right?.left, TreeNode(1))?.val)
        print(lowestCommonAncestor(root1, nil, root1?.right?.right)?.val)
    }
}
