//
//  283_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/8/11.
//

import Foundation

/*
 283. 移动零 （简单）
 https://leetcode-cn.com/problems/move-zeroes/
 */

class Solution_283_Day20Plan {
    /// 优化
    func moveZeroes(_ nums: inout [Int]) {
        let len = nums.count
        var left = 0, right = 0
        while right < len {
            if nums[right] != 0 {
                nums.swapAt(left, right)
                left += 1
            }
            right += 1
        }
    }
    
    /// 自写双指针
    func moveZeroes_1(_ nums: inout [Int]) {
        let len = nums.count
        func getZeroIndex(_ begin: Int) -> Int {
            if begin >= len {
                return len
            }
            var zeroIndex = begin
            while zeroIndex < len && nums[zeroIndex] != 0 {
                zeroIndex += 1
            }
            return zeroIndex
        }
        
        func getNextNumIndex(_ zeroIndex: Int) -> Int {
            if zeroIndex >= len {
                return len
            }
            var numIndex = zeroIndex + 1
            while numIndex < len && nums[numIndex] == 0 {
                numIndex += 1
            }
            return numIndex
        }
        
        var zeroIndex = getZeroIndex(0)
        var numIndex = getNextNumIndex(zeroIndex)
        while zeroIndex < len && numIndex < len {
            if zeroIndex > numIndex {
                break
            }
            nums.swapAt(zeroIndex, numIndex)
            zeroIndex = getZeroIndex(zeroIndex + 1)
            numIndex = getNextNumIndex(zeroIndex)
        }
    }
    
    func test() {
        var nums = [Int]()
        
        nums = [0,1,0,3,12]
        moveZeroes(&nums)
        print(nums)

        nums = [1,2,3,0]
        moveZeroes(&nums)
        print(nums)

        nums = [0,1,2,3]
        moveZeroes(&nums)
        print(nums)

        nums = [1,2,3]
        moveZeroes(&nums)
        print(nums)

        nums = [1,0,2,0,3]
        moveZeroes(&nums)
        print(nums)

        nums = [0,1,0,2,0,3,0]
        moveZeroes(&nums)
        print(nums)

        nums = [0,1]
        moveZeroes(&nums)
        print(nums)
        
        nums = [1,0,1]
        moveZeroes(&nums)
        print(nums)
    }
}
