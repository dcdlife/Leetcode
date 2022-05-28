//
//  337.swift
//  Leetcode-Swift
//
//  Created by devcz on 2022/5/23.
//

import Foundation

/*
 337. 打家劫舍 III (中等)
 https://leetcode.cn/problems/house-robber-iii/
 */

class Solution_337 {
    func rob(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        let val = dfs(root)

        return max(val.0, val.1)
    }

    // 返回元组 (不选，选)
    func dfs(_ root: TreeNode?) -> (Int, Int) {
        if root == nil {
            return (0, 0)
        }

        let l = dfs(root?.left)
        let r = dfs(root?.right)
        
        let noChoose = max(l.0, l.1) + max(r.0, r.1)
        let choose = root!.val + l.0 + r.0

        return (noChoose, choose)
    }
}
