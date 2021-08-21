//
//  438.find-all-anagrams-in-a-string.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/4/12.
//

import Foundation
/*
 438. 找到字符串中所有字母异位词 (中等)
 https://leetcode-cn.com/problems/find-all-anagrams-in-a-string/
 */

/*
 所有思路：
 1. 滑动窗口+数组
 2. 滑动窗口+双指针
 */
class Solution438 {
    /*
     思路：滑动窗口 + 双指针
     */
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        if s.count == 0 || p.count == 0 || s.count < p.count {
            return []
        }
        var ans: [Int] = []
        var sCnt: [Int] = [Int](repeating: 0, count: 26)
        var pCnt: [Int] = [Int](repeating: 0, count: 26)
        let sArray = Array(s)
        let pArray = Array(p)
        let pCount = pArray.count
        for i in pArray {
            pCnt[Int(i.unicodeScalars.first!.value) - 97] += 1
        }
        var left = 0
        for right in 0..<sArray.count {
            let index = Int(sArray[right].unicodeScalars.first!.value) - 97
            sCnt[index] += 1
            while sCnt[index] > pCnt[index] {
                sCnt[Int(sArray[left].unicodeScalars.first!.value) - 97] -= 1
                left += 1
            }
            if right - left + 1 == pCount {
                ans.append(left)
            }
        }
        
        return ans
    }
    /*
     思路：滑动窗口+数组
     */
    func findAnagrams_slideWindowAndArray(_ s: String, _ p: String) -> [Int] {
        if s.count == 0 || p.count == 0 || s.count < p.count {
            return []
        }
        var ans: [Int] = []
        var sCnt: [Int] = [Int](repeating: 0, count: 26)
        var pCnt: [Int] = [Int](repeating: 0, count: 26)
        let sArray = Array(s)
        let pArray = Array(p)
        let sCount = sArray.count
        let pCount = pArray.count
        for i in 0..<pCount {
            sCnt[Int(sArray[i].unicodeScalars.first!.value) - 97] += 1
            pCnt[Int(pArray[i].unicodeScalars.first!.value) - 97] += 1
        }
        if sCnt == pCnt {
            ans.append(0)
        }
        for i in pCount..<sCount {
            sCnt[Int(sArray[i - pCount].unicodeScalars.first!.value) - 97] -= 1
            sCnt[Int(sArray[i].unicodeScalars.first!.value) - 97] += 1
            if sCnt == pCnt {
                ans.append(i - pCount + 1)
            }
        }
        
        return ans
    }
    
    /*
     测试用例：
     1. p为1个、两个、多个
     2. s或p为空
     3. s少于p
     */
    func test() {
        print(findAnagrams("cbaebabacd", "abc"))
        print(findAnagrams("abab", "ab"))
        
        print(findAnagrams("abcdedebca", "a"))
        print(findAnagrams("abcdedebca", "ab"))
        print(findAnagrams("abcdedebca", "abc"))
        print(findAnagrams("abcdedebcad", "abcd"))
        print(findAnagrams("", "abcd"))
        print(findAnagrams("abcdedebcad", ""))
        print(findAnagrams("a", "abcd"))
    }
}
