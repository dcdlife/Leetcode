"""
16. 最接近的三数之和（中等）
https://leetcode-cn.com/problems/3sum-closest/

给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。


示例：

输入：nums = [-1,2,1,-4], target = 1
输出：2
解释：与 target 最接近的和是 2 (-1 + 2 + 1 = 2) 。
 

提示：

3 <= nums.length <= 10^3
-10^3 <= nums[i] <= 10^3
-10^4 <= target <= 10^4

"""

from typing import List

"""
[-1,2,1,-4]
1
[1,2,3]
1

此用例频繁出错
[0,2,1,-3]
1
"""

class Solution:

    # 排序+双指针 
    # 时间复杂度 O(n^2)； 空间复杂度 
    # 执行用时：336 ms, 在所有 Python3 提交中击败了12.30%的用户
    # 内存消耗：13.6 MB, 在所有 Python3 提交中击败了86.64%的用户
    def threeSumClosest(self, nums: List[int], target: int) -> int:
        nums = sorted(nums)
        length = len(nums)
        res = nums[0] + nums[1] + nums[2]
        for i in range(length - 2):
            # 去掉重复的第一个元素
            if i == 0 or nums[i] != nums[i - 1]:
                value_i = nums[i]
                j = i + 1
                k = length - 1
                while j < k:
                    # 去掉重复的第二个元素
                    if j == i + 1 or nums[j] != nums[j - 1]:
                        value_j = nums[j]
                        # 去掉重复的第三个元素
                        if k == length - 1 or nums[k] != nums[k + 1]:
                            value_k = nums[k]
                            sumijk = value_i + value_j + value_k
                            # 错误写法
                            # if target > sumijk:
                            # 正确写法
                            if sumijk - target > 0:
                                k -= 1
                            else:
                                j += 1
                            if abs(target - sumijk) < abs(target - res):
                                res = sumijk
                        else:
                            k -= 1
                    else:
                        j += 1
        return res

if __name__ == "__main__":
    su = Solution()
    # print(su.threeSumClosest([-1, 2, 1, -4], 1))

    # leetcode 提交错误 多次犯错
    print(su.threeSumClosest([0,2,1,-3], 1)) 
