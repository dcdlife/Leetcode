//
//  557_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/8/12.
//

import Foundation

/*
 557. 反转字符串中的单词 III (简单)
 https://leetcode-cn.com/problems/reverse-words-in-a-string-iii/
 */

class Solution_557_Day20Plan {
    func reverseWords(_ s: String) -> String {
        let len = s.count
        var s = Array(s)
        var wordBeginIndex = 0
        while wordBeginIndex < len {
            if s[wordBeginIndex] != " " {
                var wordEndIndex = wordBeginIndex
                while wordEndIndex < len && s[wordEndIndex] != " " {
                    wordEndIndex += 1
                }
                var left = wordBeginIndex
                var right = wordEndIndex - 1
                while left < right {
                    s.swapAt(left, right)
                    left += 1
                    right -= 1
                }
                wordBeginIndex = wordEndIndex
            } else {
                wordBeginIndex += 1
            }
        }
        return String(s)
    }
    
    func test() {
        print(reverseWords(" Let's take LeetCode contest"))
        print(reverseWords("Let's take LeetCode contest"))
        print(reverseWords(" Let's "))
    }
}
