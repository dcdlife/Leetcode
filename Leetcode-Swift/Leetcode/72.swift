//
//  72.edit-distance.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/4/22.
//

import Foundation

/*
 72. 编辑距离 (困难)
 https://leetcode-cn.com/problems/edit-distance/
 */

class Solution72 {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1.count == 0 && word2.count == 0 {
            return 0
        }
        let m = word1.count, n = word2.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 0..<m+1 {
            dp[i][0] = i
        }
        for j in 0..<n+1 {
            dp[0][j] = j
        }
        
        for i in 1..<m + 1 {
            for j in 1..<n + 1 {
                let char1 = word1[word1.index(word1.startIndex, offsetBy: i - 1)]
                let char2 = word2[word2.index(word2.startIndex, offsetBy: j - 1)]
                dp[i][j] = min(
                    dp[i - 1][j - 1] + (char1 == char2 ? 0 : 1),
                    dp[i - 1][j] + 1,
                    dp[i][j - 1] + 1
                )
            }
        }
        
        return dp[m][n]
    }
    
    /*
     测试用例：
     1. 全等；全不等；有等有不等（word1个数 >或<或= word2个数）
     2. 两个空
     */
    func test() {
        print(minDistance("horse", "ros"))
        print(minDistance("intention", "execution"))
        
        print(minDistance("abc", "abc"))
        print(minDistance("abc", "def"))
        print(minDistance("abc", "defgh"))
        print(minDistance("abcxx", "def"))
        
        print(minDistance("", ""))
    }
}
