"""
41. 缺失的第一个正数
困难
https://leetcode-cn.com/problems/first-missing-positive/
"""

from typing import List

class Solution:
    # 方法一: 置换
    # 遍历数组，将遍历到的元素，置换到其应该在的位置。
    # 最后再次遍历，如果对应索引出的值不等于索引+1，然后索引+1。否则，然后数组数量+1。
    
    # 40 ms	    75.32%
    # 13.5 MB   16.67%
    def firstMissingPositive(self, nums: List[int]) -> int:
        n = len(nums)

        for i in range(n):
            while 1 <= nums[i] <= n and nums[nums[i] - 1] != nums[i]:
                nums[nums[i] - 1], nums[i] = nums[i], nums[nums[i] - 1]
        
        for i in range(n):
            if (i + 1) != nums[i]:
                return i + 1
        
        return n + 1


if __name__ == "__main__":
    su = Solution()
    
    test = [
        [1,2,0], # 3
        [3,4,-1,1] # 2
    ]
    for i in test:
        print(su.firstMissingPositive(i))
    