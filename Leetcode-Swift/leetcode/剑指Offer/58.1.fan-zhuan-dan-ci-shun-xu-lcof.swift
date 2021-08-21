//
//  58.1.fan-zhuan-dan-ci-shun-xu-lcof.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/5/30.
//

import Foundation

/*
 剑指 Offer 58 - I. 翻转单词顺序 (简单)
 https://leetcode-cn.com/problems/fan-zhuan-dan-ci-shun-xu-lcof/
 */

class Solution_Offer_58_1 {
    func reverseWords(_ s: String) -> String {
        if s.count == 0 {
            return ""
        }
        
        // 移除空格
        var s = Array(s)
        var ans = [Character]()
        var ansBegin = 0
        while ansBegin < s.count {
            if s[ansBegin] == " " {
                ansBegin += 1
                continue
            }
            while ansBegin < s.count {
                ans.append(s[ansBegin])
                if s[ansBegin] == " " {
                    break
                }
                ansBegin += 1
            }
        }
        
        if ans.last == " " {
            ans.removeLast()
        }
        
        s = ans
        
        func swapInRange(_ arr: inout [Character], _ begin: Int, _ end: Int) {
            var begin = begin
            var end = end
            while begin < end {
                arr.swapAt(begin, end)
                begin += 1
                end -= 1
            }
        }
        
        var count = s.count
        var end = count - 1
        swapInRange(&s, 0, end)
        
        var begin = 0
        end = 0
        count = s.count
        
        while begin < count && end < count {
            if s[end] == " " {
                swapInRange(&s, begin, end - 1)
                while s[end] == " " {
                    end += 1
                }
                begin = end
            } else if end == count - 1 {
                swapInRange(&s, begin, end)
                break
            } else {
                end += 1
            }
        }

        return String(s)
    }
    
    func test() {
        let tests = [
            "",
            "s",
            "  s ",
            "the sky is blue",
            "  hello world!  ",
            "a good   example",
            "  a good   example     "
        ]
        
        for i in tests {
            print(reverseWords(i))
        }
    }
}
