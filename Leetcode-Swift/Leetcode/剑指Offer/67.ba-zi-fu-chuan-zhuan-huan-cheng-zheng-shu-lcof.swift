//
//  67.ba-zi-fu-chuan-zhuan-huan-cheng-zheng-shu-lcof.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/6/5.
//

import Foundation

/*
 剑指 Offer 67. 把字符串转换成整数 (中等)
 https://leetcode-cn.com/problems/ba-zi-fu-chuan-zhuan-huan-cheng-zheng-shu-lcof/submissions/
 */

class Solution_Offer_67 {
    func strToInt(_ str: String) -> Int {
        // 排除空字符串
        if str.count == 0 {
            return 0
        }
        
        var strArray = Array(str)
        // 去除空格字符
        var left = 0
        var right = strArray.count - 1
        
        while (left <= right && (strArray[left] == " " || strArray[right] == " ")) {
            if strArray[left] == " " {
                left += 1
            }
            if strArray[right] == " " {
                right -= 1
            }
        }
        
        if left > right {
            return 0
        }
        
        strArray = Array(strArray[left...right])
        var sign = 1
        // 排除仅有正负号的数
        if strArray.first! == "-" || strArray.first! == "+" {
            if strArray.count == 1 {
                return 0
            }
         
            sign = strArray[0] != "-" ? 1 : -1
            strArray.removeFirst()
        }
        
        var ans = 0
        let digits: ClosedRange<Character> = "0"..."9"
        for i in strArray {
            if digits.contains(i) {
                let newAns = ans * 10 + (Int(i.unicodeScalars.first!.value) - 48) * sign
                if (sign == 1 && newAns > 0x7fffffff) || (sign == -1 && newAns < (-1 * 0x80000000)) {
                    return sign == 1 ? 0x7fffffff : -1 * 0x80000000
                }
                ans = newAns
            } else {
                break
            }
        }
        
        return ans
    }
    
    /*
     测试用例：
     1. 功能：带正负号；0；前后有空格
     2. 特殊：仅1个空格；全是空格；有非数字的字符
     3. 边界值：最大值、最小值
     */
    func test() {
        let tests = [
            " ",
            "   ",
            "  -42  ",
            "words and 987",
            "+110words and 987",
            "-91283472332"
        ]
        
        for i in tests {
            print(strToInt(i))
        }
    }
}
