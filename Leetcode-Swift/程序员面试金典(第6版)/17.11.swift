//
//  17.11.swift
//  Leetcode-Swift
//
//  Created by devcz on 2022/6/2.
//

import Foundation

/*
 面试题 17.11. 单词距离 (中等)
 https://leetcode.cn/problems/find-closest-lcci/
 */

class Solution_17_11 {
    func findClosest(_ words: [String], _ word1: String, _ word2: String) -> Int {
        if words.isEmpty {
            return -1
        }

        var index1 = -1
        var index2 = -1
        var ans = words.count

        for (index, word) in words.enumerated() {
            if word == word1 {
                index1 = index
            } else if word == word2 {
                index2 = index
            }

            if index1 != -1 && index2 != -1 {
                ans = min(ans, abs(index1 - index2))
            }
        }

        return ans
    }
}
