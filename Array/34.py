"""
34. 在排序数组中查找元素的第一个和最后一个位置 (中等)

给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

你的算法时间复杂度必须是 O(log n) 级别。

如果数组中不存在目标值，返回 [-1, -1]。

示例 1:

输入: nums = [5,7,7,8,8,10], target = 8
输出: [3,4]
示例 2:

输入: nums = [5,7,7,8,8,10], target = 6
输出: [-1,-1]

"""

class Solution:

    # 执行用时：48 ms, 在所有 Python3 提交中击败了32.42%的用户
    # 内存消耗：14.7 MB, 在所有 Python3 提交中击败了20.27%的用户
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        if not nums:
            return [-1, -1]
        length = len(nums)
        l, r = 0, length - 1

        while l <= r:
            mid = (l + r) // 2
            if (nums[mid] == target):
                begin, end = mid, mid
                while begin > 0:
                    begin -= 1
                    if nums[begin] != target:
                        begin += 1
                        break
                while end < length - 1:
                    end += 1
                    if nums[end] != target:
                        end -= 1
                        break
                return [begin, end]
            elif nums[mid] > target:
                r -= 1
            else:
                l += 1
        return [-1, -1]
