//
//  22.generate-parentheses.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/4/16.
//

import Foundation

/*
 22. 括号生成 (中等)
 https://leetcode-cn.com/problems/generate-parentheses/
 */

/*
 思路：
 1. 暴力解法
 2. 回溯法
 */
class Solution22 {
    func generateParenthesis(_ n: Int) -> [String] {
        if n <= 0 {
            return []
        }
        var ans = [String]()
        var cur = ""
        backtrack(&ans, &cur, 0, 0, n)
        return ans
    }
    
    func backtrack(_ ans: inout [String], _ cur: inout String, _ open: Int, _ close: Int, _ max: Int) {
        if cur.count == 2 * max {
            ans.append(cur)
            return
        }
        if open < max {
            cur.append("(")
            backtrack(&ans, &cur, open + 1, close, max)
            cur.removeLast()
        }
        if close < open {
            cur.append(")")
            backtrack(&ans, &cur, open, close + 1, max)
            cur.removeLast()
        }
    }
    
    /*
     测试用例：
     1. 0；1；2；3等
     */
    func test() {
        print(generateParenthesis(0))
        print(generateParenthesis(1))
        print(generateParenthesis(2))
        print(generateParenthesis(3))
    }
}
