//
//  139.swift
//  Leetcode-Swift
//
//  Created by 95cc on 2022/5/26.
//

import Foundation

/*
 139. 单词拆分 (中等)
 https://leetcode.cn/problems/word-break/
 */

class Solution_139 {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        if s.isEmpty || wordDict.isEmpty {
            return false
        }

        let count = s.count
        var dp = [Bool](repeating: false, count: count + 1)
        dp[0] = true

        for i in 1...count {
            for start in stride(from: i - 1, to: -1, by: -1) {
                let startIndex = s.index(s.startIndex, offsetBy: start)
                let endIndex = s.index(s.startIndex, offsetBy: i)
                let subString = String(s[startIndex..<endIndex])

                if wordDict.contains(subString) {
                    if start == 0 || dp[start] {
                        dp[i] = true
                        break
                    }
                }
            }
        }

        return dp[count]
    }
}
