"""
81. 搜索旋转排序数组 II (中等)
https://leetcode-cn.com/problems/search-in-rotated-sorted-array-ii/

假设按照升序排序的数组在预先未知的某个点上进行了旋转。

( 例如，数组 [0,0,1,2,2,5,6] 可能变为 [2,5,6,0,0,1,2] )。

编写一个函数来判断给定的目标值是否存在于数组中。若存在返回 true，否则返回 false。

示例 1:

输入: nums = [2,5,6,0,0,1,2], target = 0
输出: true
示例 2:

输入: nums = [2,5,6,0,0,1,2], target = 3
输出: false
进阶:

这是 搜索旋转排序数组 的延伸题目，本题中的 nums  可能包含重复元素。
这会影响到程序的时间复杂度吗？会有怎样的影响，为什么？

"""

from typing import List

class Solution:
    # 利用二分查找，先去重，再利用33题的思路。
    # 执行用时：40 ms, 在所有 Python3 提交中击败了77.70%的用户
    # 内存消耗：13.6 MB, 在所有 Python3 提交中击败了16.68%的用户
    def search(self, nums: List[int], target: int) -> bool:        
        l = 0
        r = len(nums) - 1
        while l <= r:
            mid = (l+r) // 2

            if nums[mid] == target:
                return True

            if nums[mid] == nums[l]: # 去除左侧重复
                l += 1
            elif nums[mid] == nums[r]: # 去除右侧重复
                r -= 1
            # 进行到这里，说明 l - r 区间为要搜索的区间，且l为区间左端点，r为区间右端点
            elif nums[mid] > nums[l]:  # l到mid是有序的，判断target是否在其中
                if nums[l] <= target < nums[mid]:  # target在其中，选择l到mid这段
                    r = mid - 1
                else:  # target不在其中，扔掉l到mid这段
                    l = mid + 1
            elif nums[mid] < nums[r]:  # mid到r是有序的，判断target是否在其中
                if nums[mid] < target <= nums[r]:
                    l = mid + 1
                else:
                    r = mid - 1 
        return False

if __name__ == "__main__":
    su = Solution()