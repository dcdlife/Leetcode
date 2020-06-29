"""
215. 数组中的第K个最大元素
中等
https://leetcode-cn.com/problems/kth-largest-element-in-an-array/
"""

from typing import List

class Solution:
    # 方法一: 利用快排思想，找出pivot + 1 等于k时的值

    # 1320 ms	13.73%
    # 14.4 MB   15.79%
    def findKthLargest(self, nums: List[int], k: int) -> int:
        begin = 0
        end = len(nums) - 1
        while True:
            pivot = self.partition(nums, begin, end)
            if (pivot + 1) > k:
                end = pivot - 1
            elif (pivot + 1) < k:
                begin = pivot + 1
            else:
                return nums[pivot]
        return None

    def partition(self, nums, begin, end) -> int:
        pivot = end
        while begin < pivot:
            if nums[begin] >= nums[pivot]:
                begin += 1
            else:
                nums[begin], nums[pivot] = nums[pivot], nums[begin]
                pivot -= 1
                nums[begin], nums[pivot] = nums[pivot], nums[begin]
        return pivot

if __name__ == "__main__":
    su = Solution()

    test= [
        ([3,1,2,4], 2),
        ([3,2,1,5,6,4], 2),
        ([3,2,3,1,2,4,5,5,6], 4),
        ([1], 1),
        ([1,2,3], 1),
        ([1,2,3], 2),
        ([1,2,3], 3),
        ([3,2,1], 1),
        ([3,2,1], 2),
        ([3,2,1], 3)
    ]

    for (nums, k) in test:
        print(su.findKthLargest(nums, k))
