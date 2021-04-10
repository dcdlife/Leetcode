//
//  49.group-anagrams.swift
//  Leetcode-Swift
//
//  Created by 尹冲 on 2021/4/8.
//

import Foundation
/*
 49. 字母异位词分组 (中等)
 https://leetcode-cn.com/problems/group-anagrams/
 */

class Solution49 {
    /*
     思路：排序
     时间复杂度: nklogk
     空间复杂度: nk
     */
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        if strs.count == 0 {
            return []
        }
        
        var resDict: [String : [String]] = [:]
        for str in strs {
            let sortedStr = String(str.sorted())
            guard let _ = resDict[sortedStr] else {
                resDict[sortedStr] = [String(str)]
                continue
            }
            resDict[sortedStr]?.append(String(str))
        }
        return Array(resDict.values)
    }
    
    /*
     测试用例：
     1. 两个元素：是字母异位词；不是字母异位词
     2. 多个元素：多个字母异位词
     3. 1个元素
     4. 空元素
     */
    func test() {
        print(groupAnagrams(["abc", "bca"]))
        print(groupAnagrams(["abc", "bdsfa"]))
        print(groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
        print(groupAnagrams(["eat1", "tea1", "tan", "ate", "nat", "bat"]))
        print(groupAnagrams(["a"]))
        print(groupAnagrams([]))
    }
}