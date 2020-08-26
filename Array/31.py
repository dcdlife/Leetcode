"""
31. 下一个排列 (中等)
https://leetcode-cn.com/problems/next-permutation/

实现获取下一个排列的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。

如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。

必须原地修改，只允许使用额外常数空间。

以下是一些例子，输入位于左侧列，其相应输出位于右侧列。
1,2,3 → 1,3,2
3,2,1 → 1,2,3
1,1,5 → 1,5,1

"""

from typing import List

class Solution:
    # 一遍扫描: https://leetcode-cn.com/problems/next-permutation/solution/xia-yi-ge-pai-lie-by-leetcode/
    # 执行用时：44 ms, 在所有 Python3 提交中击败了52.77%的用户
    # 内存消耗：13.7 MB, 在所有 Python3 提交中击败了56.69%的用户
    def nextPermutation(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        if not nums:
            return
        length = len(nums)
        i = length - 1
        # 倒叙查找第一个拐点i
        while i > 0:
            if nums[i] > nums[i - 1]:
                break
            i -= 1
        # 如果有拐点，代表存在下一个更大的排列
        if i > 0:
            # 倒序查找第一个比拐点前的那个数大的数，并互相交换
            j = length - 1
            while j >= i:
                if nums[j] > nums[i - 1]:
                    nums[j], nums[i - 1] = nums[i - 1], nums[j]
                    break
                j -= 1
            
            # 反转拐点到最后的所有数字
            left = i
            right = length - 1
            while left < right:
                nums[left], nums[right] = nums[right], nums[left]
                left += 1
                right -= 1
        else:
            # 没有拐点，直接从小到大排序
            nums.sort()


        

# 输入 [1,3,2]
# 正确输出 [2,1,3]
# 错误输出 [3,1,2]

if __name__ == "__main__":
    su = Solution()
    a = [1,3,2]
    su.nextPermutation(a)
    print(a)
