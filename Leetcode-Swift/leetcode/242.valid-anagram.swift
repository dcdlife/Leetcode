//
//  242.valid-anagram.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/4/7.
//

import Foundation
/*
 242. 有效的字母异位词 (简单)
 https://leetcode-cn.com/problems/valid-anagram/
 */

class Solution242 {
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        let a = Int("a".unicodeScalars.first!.value)
        var counter = [Int](repeating: 0, count: 26)
        for index in s.unicodeScalars {
            counter[Int(index.value)-a] += 1
        }
        for index in t.unicodeScalars {
            counter[Int(index.value)-a] -= 1
        }
        for (_,n) in counter.enumerated() {
            if n > 0 {
                return false
            }
        }
        return true
    }
    
    // 自写：利用哈希表记录字母个数
    func isAnagram_byself(_ s: String, _ t: String) -> Bool {
        if (s.count != t.count) {
            return false
        }
        
        var dict: [Character: Int] = [:]
        for i in s {
            if dict[i] != nil {
                dict[i]! += 1
            } else {
                dict[i] = 1
            }
        }
        for j in t {
            if dict[j] != nil {
                dict[j]! -= 1
            }
        }
        for k in dict.values {
            if k != 0 {
                return false
            }
        }
        return true
    }
    
    /*
     测试用例：
     1. 个数相等：1、2、多个
     2. 个数不等
     3. 空字符串
     */
    func test() {
        print(isAnagram("a", "a"))
        print(isAnagram("ba", "ab"))
        print(isAnagram("anagram", "nagaram"))
        print(isAnagram("a", "abbb"))
        print(isAnagram("", ""))
        
        // 出错用例
        print(isAnagram("aacc", "ccac"))
    }
}
