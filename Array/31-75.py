"""
75. 颜色分类 (中等)
https://leetcode-cn.com/problems/sort-colors/

给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。

注意:
不能使用代码库中的排序函数来解决这道题。

示例:

输入: [2,0,2,1,1,0]
输出: [0,0,1,1,2,2]
进阶：

一个直观的解决方案是使用计数排序的两趟扫描算法。
首先，迭代计算出0、1 和 2 元素的个数，然后按照0、1、2的排序，重写当前数组。
你能想出一个仅使用常数空间的一趟扫描算法吗？
"""

from typing import List

class Solution:

    # 方法二：利用3个指针，一次遍历
    # 复杂度: 时间O(n) 空间O(1)
    # 执行用时：44 ms, 在所有 Python3 提交中击败了49.60%的用户
    # 内存消耗：13.4 MB, 在所有 Python3 提交中击败了20.30%的用户
    def sortColors(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        if not nums:
            return
        p0, cur, p2 = 0, 0, len(nums) - 1
        while cur <= p2:
            if nums[cur] == 2:
                nums[cur], nums[p2] = nums[p2], nums[cur]
                p2 -= 1
            elif nums[cur] == 0:
                nums[cur], nums[p0] = nums[p0], nums[cur]
                p0 += 1
                # ① p0 < curr，这种情况下 nums【p0】==1（因为只有遇到了1之后，p0和curr才会拉开距离），那么交换之后就可以直接curr++ 
                # ② p0 == curr，这种情况下，显然也应该直接右移，即curr++。
                cur += 1
            else:
                cur += 1



    # 最简单做法: 计算0、1、2个数，然后重写数组
    # 复杂度: 时间O(n) 空间O(1)
    # 执行用时：48 ms, 在所有 Python3 提交中击败了22.97%的用户
    # 内存消耗：13.3 MB, 在所有 Python3 提交中击败了55.53%的用户
    def sortColors1(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        countZero, countOne, countTwo = 0, 0, 0
        for i in nums:
            if i == 0:
                countZero += 1
            elif i == 1:
                countOne += 1
            else:
                countTwo += 1
        for i in range(countZero):
            nums[i] = 0
        for i in range(countZero, countZero + countOne):
            nums[i] = 1
        for i in range(countZero + countOne, countZero + countOne + countTwo):
            nums[i] = 2
        
if __name__ == "__main__":
    su = Solution()
    a = [1,1,0,2]
    print(a)
    su.sortColors(a)
    print(a)

    a = [1,1,0]
    print(a)
    su.sortColors(a)
    print(a)

    a = [1,0,2]
    print(a)
    su.sortColors(a)
    print(a)

        