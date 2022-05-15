//
//  17.22.swift
//  Leetcode-Swift
//
//  Created by yefeng on 2022/5/15.
//

import Foundation

/*
 面试题 17.22. 单词转换 (中等)
 https://leetcode.cn/problems/word-transformer-lcci/
 */

class Solution_17_22 {
    var visited = Set<String>()
    var success = false
    var path = [String]()
    var ans = [String]()

    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [String] {
        if beginWord.isEmpty || endWord.isEmpty || (beginWord.count != endWord.count) {
            return []
        }
        if !wordList.contains(endWord) {
            return []
        }

        dfs(beginWord, endWord, wordList)

        return ans
    }

    func dfs(_ curWord: String, _ endWord: String, _ wordList: [String]) {
        if success {
            return
        }

        visited.insert(curWord)
        path.append(curWord)

        if (curWord == endWord) {
            success = true
            ans = path
            return
        }

        for word in wordList {
            if visited.contains(word) {
                continue
            }
            
            if isValidChange(curWord, word) {
                dfs(word, endWord, wordList)
            }
        }

        path.removeLast()
    }

    func isValidChange(_ word: String, _ targetWord: String) -> Bool {
        var diffCount = 0
        for i in 0..<word.count {
            let index = targetWord.index(targetWord.startIndex, offsetBy: i)
            if word[index...index] != targetWord[index...index] {
                diffCount += 1
            }
        }
        return diffCount == 1
    }
}
