"""
33. 搜索旋转排序数组 (中等)

假设按照升序排序的数组在预先未知的某个点上进行了旋转。

( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。

搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。

你可以假设数组中不存在重复的元素。

你的算法时间复杂度必须是 O(log n) 级别。

示例 1:

输入: nums = [4,5,6,7,0,1,2], target = 0
输出: 4
示例 2:

输入: nums = [4,5,6,7,0,1,2], target = 3
输出: -1

"""

from typing import List

class Solution:

    # 方法：判断mid是在左侧的递增区间还是右侧的递增区间。
    # 执行用时：44 ms, 在所有 Python3 提交中击败了49.79%的用户
    # 内存消耗：13.8 MB, 在所有 Python3 提交中击败了58.75%的用户
    def search(self, nums: List[int], target: int) -> int:
        if not nums:
            return -1
        l, r = 0, len(nums) - 1
        while l <= r:
            mid = (l + r) // 2
            if (nums[mid] == target):
                return mid
            if nums[0] <= nums[mid]: # mid在左侧的递增区间
                if nums[0] <= target < nums[mid]: # target也在左侧的递增区间
                    r = mid - 1
                else: # target在mid的右侧
                    l = mid + 1
            else: # mid在右侧的递增区间
                if nums[mid] < target <= nums[len(nums) - 1]: # target在右侧的递增区间
                    l = mid + 1
                else: # target在左侧
                    r = mid - 1
        return -1
