//
//  20.valid-parentheses.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/4/4.
//

import Foundation
/*
 20. 有效的括号 (简单)
 https://leetcode-cn.com/problems/valid-parentheses/
 */

class Solution20 {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        let dict: [Character : Character] = ["{":"}", "(":")", "[":"]"]
        for char in s {
            if dict[char] != nil {
                stack.append(char)
            } else {
                if dict[stack.last ?? "x"] == char {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
        return stack.count == 0
    }

    /*
     测试用例：
     1. 1个(左/右)、多个匹配，多个不匹配（奇数个数不匹配、偶数个数不匹配）
     2. 空
     */
    func test() {
        print(isValid("{"))
        print(isValid("]"))
        print(isValid("{]"))
        print(isValid("{}"))
        print(isValid("[]"))
        print(isValid("()"))
        print(isValid("{[()]}"))
        print(isValid("{{{}}}"))
        print(isValid("{{{[}}}"))
        print(isValid(""))
    }
}
