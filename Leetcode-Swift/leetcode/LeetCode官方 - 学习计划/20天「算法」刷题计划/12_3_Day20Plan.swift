//
//  3_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/8/14.
//

import Foundation

/*
 3. 无重复字符的最长子串 (中等)
 https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/
 */

class Solution_3_Day20Plan {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        
        var ans = 0
        let s = Array(s)
        var map = [Character: Int]()
        var left = 0
        var right = 0
        
        while right < s.count {
            let char = s[right]
            if map[char] != nil {
                let newLeft = map[char]! + 1
                for i in left..<newLeft {
                    map[s[i]] = nil
                }
                left = newLeft
                map[char] = right
            } else {
                map[char] = right
                ans = max(ans, right - left + 1)
            }
            right += 1
        }
        
        return ans
    }
    
    func test() {
        print(lengthOfLongestSubstring("abcabcbb"))
        print(lengthOfLongestSubstring("bbbbb"))
        print(lengthOfLongestSubstring("pwwkew"))
        print(lengthOfLongestSubstring(""))

        print(lengthOfLongestSubstring("abcde"))
    }
}
