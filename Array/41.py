"""
41. 缺失的第一个正数 (困难)
https://leetcode-cn.com/problems/first-missing-positive/

给你一个未排序的整数数组，请你找出其中没有出现的最小的正整数。

 

示例 1:

输入: [1,2,0]
输出: 3
示例 2:

输入: [3,4,-1,1]
输出: 2
示例 3:

输入: [7,8,9,11,12]
输出: 1

提示：

你的算法的时间复杂度应为O(n)，并且只能使用常数级别的额外空间。


"""

from typing import List

class Solution:
    # 原地哈希
    # 执行用时：44 ms, 在所有 Python3 提交中击败了52.78%的用户
    # 内存消耗：13.7 MB, 在所有 Python3 提交中击败了35.12%的用户
    def firstMissingPositive(self, nums: List[int]) -> int:
        if not nums:
            return 1
        
        length = len(nums)
        for i in range(length):
            if nums[i] <= 0:
                nums[i] = length + 1
        
        for i in range(length):
            num = abs(nums[i])
            if num <= length:
                nums[num - 1] = -abs(nums[num - 1])

        res = length + 1

        for i in range(length):
            if nums[i] > 0:
                res = i + 1
                break

        return res


    
    # # 方法二: 置换
    # # 遍历数组，将遍历到的元素，置换到其应该在的位置。（可能会死循环）
    # # 最后再次遍历，如果对应索引的值不等于索引+1，返回索引+1。否则，然后数组数量+1。
    
    # # 40 ms	    75.32%
    # # 13.5 MB   16.67%
    # def firstMissingPositive(self, nums: List[int]) -> int:
    #     n = len(nums)

    #     for i in range(n):
    #         while 1 <= nums[i] <= n and nums[nums[i] - 1] != nums[i]:
    #             nums[nums[i] - 1], nums[i] = nums[i], nums[nums[i] - 1]
        
    #     for i in range(n):
    #         if (i + 1) != nums[i]:
    #             return i + 1
        
    #     return n + 1


if __name__ == "__main__":
    su = Solution()
    
    test = [
        [], # 1 注意：提交时出错用例
        [1,1], # 2 注意：提交时出错用例
        [1,2,0], # 3
        [3,4,-1,1], # 2
        [1,2,3,4]
    ]
    for i in test:
        print(su.firstMissingPositive(i))
    