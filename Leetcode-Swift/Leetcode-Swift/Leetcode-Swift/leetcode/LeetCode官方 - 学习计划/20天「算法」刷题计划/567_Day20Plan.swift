//
//  567_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/8/14.
//

import Foundation

/*
 567. 字符串的排列 (中等)
 https://leetcode-cn.com/problems/permutation-in-string/
 */

class Solution_567_Day20Plan {
    
    /// 滑动窗口
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.count > s2.count {
            return false
        }
        
        let s1Count = s1.count
        let s1 = Array(s1)
        let s2 = Array(s2)
        
        var letters = [Int](repeating: 0, count: 26)
        for i in 0..<s1Count {
            letters[self.cToInt(s1[i])] -= 1
            letters[self.cToInt(s2[i])] += 1
        }
    
        var unMatchCount = 0
        for i in letters {
            if i != 0 {
                unMatchCount += 1
            }
        }
        
        if unMatchCount == 0 {
            return true
        }
        
        var index = s1Count
        while index < s2.count {
            let leftC = s2[index - s1Count]
            let rightC = s2[index]
            
            if leftC == rightC {
                index += 1
                continue
            }
            
            let leftCIntVal = self.cToInt(leftC)
            let rightCIntVal = self.cToInt(rightC)
            
            if letters[rightCIntVal] == 0 {
                unMatchCount += 1
            }
            letters[rightCIntVal] += 1
            if letters[rightCIntVal] == 0 {
                unMatchCount -= 1
            }
            
            if letters[leftCIntVal] == 0 {
                unMatchCount += 1
            }
            letters[leftCIntVal] -= 1
            if letters[leftCIntVal] == 0 {
                unMatchCount -= 1
            }
            
            if unMatchCount == 0 {
                return true
            }
            
            index += 1
        }
        
        return false
    }
    
    func cToInt(_ c: Character) -> Int {
        return Int(c.unicodeScalars.first!.value) - 97
    }
    
    func test() {
//        print(checkInclusion("ab", "eidbaooo"))
//        print(checkInclusion("ab", "eidboaoo"))

        print(checkInclusion("a", "a"))
//        print(checkInclusion("ab", "ab"))
//        print(checkInclusion("abc", "ab"))
//
//        print(checkInclusion("adc", "dcda"))
//        print(checkInclusion("abcd", "abdeeeeabcd"))
    }
}
