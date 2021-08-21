//
//  31.zhan-de-ya-ru-dan-chu-xu-lie-lcof.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/5/10.
//

import Foundation

/*
 剑指 Offer 31. 栈的压入、弹出序列 (中等)
 https://leetcode-cn.com/problems/zhan-de-ya-ru-dan-chu-xu-lie-lcof/
 */

class Solution_Offer_31 {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        if pushed.count == 0 && popped.count == 0 {
            return true
        }
        var valid = false
        if pushed.count != 0 && pushed.count == popped.count {
            var pushIndex = 0
            let pushEnd = pushed.count - 1
            var popIndex = 0
            let popEnd = popped.count - 1
            var stack = [Int]()
            while popIndex <= popEnd {
                while stack.isEmpty || stack.last! != popped[popIndex] {
                    if pushIndex > pushEnd {
                        break
                    }
                    stack.append(pushed[pushIndex])
                    pushIndex += 1
                }
                if stack.last! != popped[popIndex] {
                    break
                }
                stack.removeLast()
                popIndex += 1
            }
            if stack.isEmpty && popIndex == popEnd + 1 {
                valid = true
            }
        }
        return valid
    }
    
    /*
     测试用例：
     1. 功能测试：
        * 是弹出序列：有多个数；只有1个数;两个数组全等
        * 不是弹出序列：有多个数；只有1个数；两个数组全不等
     2. 特殊输入测试：空数组
     */
    func test() {
        print(validateStackSequences([1,2,3,4,5], [4,5,3,2,1]))
        print(validateStackSequences([1,2,3,4,5], [4,5,3,2]))
        print(validateStackSequences([1,2,3,4,5], [1,2,3,4,5]))
        print(validateStackSequences([1,2,3,4,5], [11,22,33,44,55]))
        print(validateStackSequences([], []))
        print(validateStackSequences([1], [1]))
        print(validateStackSequences([1], [3]))
    }
}
