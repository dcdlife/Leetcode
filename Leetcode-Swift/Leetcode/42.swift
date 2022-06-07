//
//  42.swift
//  Leetcode-Swift
//
//  Created by devcz on 2021/12/19.
//

import Foundation

/*
 42. 接雨水 (困难)
 https://leetcode-cn.com/problems/trapping-rain-water/
 */

class Solution_42 {
    func trap(_ height: [Int]) -> Int {
        if height.isEmpty {
            return 0
        }

        let count = height.count
        var leftMaxHeight = [Int](repeating: 0, count: count)
        var ans = 0
        
        var pre = height[0]
        for i in 1..<count {
            leftMaxHeight[i] = pre
            pre = max(pre, height[i])
        }

        pre = height[count - 1]
        for i in (0..<(count - 1)).reversed() {
            let minHeight = min(leftMaxHeight[i], pre)
            pre = max(pre, height[i])

            ans += (minHeight > height[i] ? (minHeight - height[i]) : 0)
        }

        return ans
    }
}
