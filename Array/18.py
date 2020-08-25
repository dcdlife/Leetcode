"""
18. 四数之和 (中等)
https://leetcode-cn.com/problems/4sum/

给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。

注意：

答案中不可以包含重复的四元组。

示例：

给定数组 nums = [1, 0, -1, 0, -2, 2]，和 target = 0。

满足要求的四元组集合为：
[
  [-1,  0, 0, 1],
  [-2, -1, 1, 2],
  [-2,  0, 0, 2]
]

"""

from typing import List

class Solution:
    def threeSum(self, nums: List[int], begin: int,  target: int) -> List[List[int]]:
        length = len(nums)
        res = []
        for i in range(begin, length - 2):
            # 去掉重复的第一个元素
            if i == begin or nums[i] != nums[i - 1]:
                value_i = nums[i]
                # 三重循环指针
                k = length - 1
                for j in range(i + 1, length):
                    # 去掉重复的第二个元素
                    if j == i + 1 or nums[j] != nums[j - 1]:
                        value_j = nums[j]
                        value_k = nums[k]
                        # 易出错，出错用例 [1,1] [0,0,0,0]
                        while value_i + value_j + value_k > target:
                            k -= 1
                            if k < 0:
                                break
                            value_k = nums[k]
                        if j >= k:
                            break
                        if value_i + value_j + value_k == target:
                            res.append([value_i, value_j, value_k])
        return res


    # 方法：利用三数之和思路
    # 执行用时：1852 ms, 在所有 Python3 提交中击败了13.28%的用户
    # 内存消耗：13.7 MB, 在所有 Python3 提交中击败了50.41%的用户
    def fourSum(self, nums: List[int], target: int) -> List[List[int]]:
        nums = sorted(nums)
        length = len(nums)
        res = []
        for i in range(length - 3):
            # 去重
            if i == 0 or nums[i] != nums[i - 1]:
                threeSums = self.threeSum(nums, i + 1, target - nums[i])
                for threeSum in threeSums:
                    res.append([nums[i]] + threeSum)
        return res


if __name__ == "__main__":
    su = Solution()
    # 出错用例
    """
    [1,0,-1,0,-2,2]
    0
    [0,0,0,0]
    0
    [-1,-5,-5,-3,2,5,0,4]
    -7
    """
    su.fourSum([0,0,0,0], 0)
