//
//  278.swift
//  Leetcode-Swift
//
//  Created by devyc on 2021/8/9.
//

import Foundation

/*
 278. 第一个错误的版本 (简单)
 https://leetcode-cn.com/problems/first-bad-version/
 */

/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */
class VersionControl {
    
}

class Solution_278 : VersionControl {
    
    func firstBadVersion(_ n: Int) -> Int {
        var l = 1;
        var r = n;

        while l < r {
            let m = (l + r) / 2
            if isBadVersion(m) {
                r = m;
            } else {
                l = m + 1;
            }
        }

        return l;
    }
    
    func firstBadVersion_self(_ n: Int) -> Int {
        var left = 1
        var right = n
        
        while left <= n {
            let mid = left + (right - left) >> 1
            if isBadVersion(mid) {
                if !isBadVersion(mid - 1) {
                    return mid
                } else {
                    right = mid - 1
                }
            } else {
                left = mid + 1
            }
        }
        
        return -1
    }
    
    var badVersion = 4
    func isBadVersion(_ version: Int) -> Bool {
        return badVersion == version
    }
    
    
    func test() {
        badVersion = 4
        print(firstBadVersion(5))
        badVersion = 1
        print(firstBadVersion(1))
    }
}
