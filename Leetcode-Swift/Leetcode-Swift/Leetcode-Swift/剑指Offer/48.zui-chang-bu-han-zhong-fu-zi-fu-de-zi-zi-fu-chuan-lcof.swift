//
//  48.zui-chang-bu-han-zhong-fu-zi-fu-de-zi-zi-fu-chuan-lcof.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/5/23.
//

import Foundation

/*
 剑指 Offer 48. 最长不含重复字符的子字符串 (中等)
 https://leetcode-cn.com/problems/zui-chang-bu-han-zhong-fu-zi-fu-de-zi-zi-fu-chuan-lcof/
 */

class Solution_Offer_48 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        
        var ans = 0
        var subStrArray = [Character]()
        for i in s {
            if subStrArray.contains(i) {
                let index = subStrArray.firstIndex(of: i)!
                subStrArray = index != subStrArray.count - 1 ? Array(subStrArray[(index+1)...]) : [Character]()
            }
            subStrArray.append(i)
            ans = max(ans, subStrArray.count)
        }
        return ans
    }
    
    /*
     测试用例：
     1. 功能测试：不含重复子字符串；含1个、多个重复子字符串；字符串全一样
     2. 特殊输入测试：仅1个字符的字符串；空串
     */
    func test() {
        print(lengthOfLongestSubstring("abcdefg"))
        print(lengthOfLongestSubstring("abcdeff"))
        print(lengthOfLongestSubstring("aabbccdd"))
        print(lengthOfLongestSubstring("aaaaaa"))
        print(lengthOfLongestSubstring("a"))
        print(lengthOfLongestSubstring(""))
    }
}
