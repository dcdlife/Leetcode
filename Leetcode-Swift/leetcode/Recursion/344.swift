//
//  344.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/8/6.
//

import Foundation

/*
 344. 反转字符串 (简单)
 https://leetcode-cn.com/problems/reverse-string/
 */

class Solution_344 {
    func reverseString(_ s: inout [Character]) {
        if s.isEmpty {
            return
        }
        
        var left = 0
        var right = s.count - 1
        while left < right {
            s.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
    
    func test() {
        var a: [Character] = ["a"]
        reverseString(&a)
        print(a)
        
        a = ["a", "b"]
        reverseString(&a)
        print(a)
        
        a = ["a", "b", "c"]
        reverseString(&a)
        print(a)
    }
}
