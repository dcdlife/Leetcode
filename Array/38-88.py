"""
88. 合并两个有序数组 (简单)
https://leetcode-cn.com/problems/merge-sorted-array/

给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。

说明：

初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 

示例：

输入：
nums1 = [1,2,3,0,0,0], m = 3
nums2 = [2,5,6],       n = 3

输出：[1,2,2,3,5,6]

提示：

-10^9 <= nums1[i], nums2[i] <= 10^9
nums1.length == m + n
nums2.length == n

"""

from typing import List


class Solution:
    # LeetCode题解
    # 题解1：暴力。合并后排序
    # 复杂度: 时间O((m+n)log(m+n)) 空间O(1)
    def merge1(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:
        """
        Do not return anything, modify nums1 in-place instead.
        """
        nums1[:] = sorted(nums1[:m] + nums2)

    # 题解2：双指针。先将数组nums1拷贝一份，清空原nums1数组，然后利用两个指针分别指向nums1拷贝和nums2的开头，然后依次遍历将小的数放入结果数组中。
    def merge2(self, nums1, m, nums2, n):
        """
        :type nums1: List[int]
        :type m: int
        :type nums2: List[int]
        :type n: int
        :rtype: void Do not return anything, modify nums1 in-place instead.
        """
        # Make a copy of nums1.
        nums1_copy = nums1[:m]
        nums1[:] = []

        # Two get pointers for nums1_copy and nums2.
        p1 = 0
        p2 = 0

        # Compare elements from nums1_copy and nums2
        # and add the smallest one into nums1.
        while p1 < m and p2 < n:
            if nums1_copy[p1] < nums2[p2]:
                nums1.append(nums1_copy[p1])
                p1 += 1
            else:
                nums1.append(nums2[p2])
                p2 += 1

        # if there are still elements to add
        if p1 < m:
            nums1[p1 + p2:] = nums1_copy[p1:]
        if p2 < n:
            nums1[p1 + p2:] = nums2[p2:]

    # 题解3：最优。倒着覆盖。将空间复杂度降为1.
    def merge3(self, nums1, m, nums2, n):
        """
        :type nums1: List[int]
        :type m: int
        :type nums2: List[int]
        :type n: int
        :rtype: void Do not return anything, modify nums1 in-place instead.
        """
        # two get pointers for nums1 and nums2
        p1 = m - 1
        p2 = n - 1
        # set pointer for nums1
        p = m + n - 1

        # while there are still elements to compare
        while p1 >= 0 and p2 >= 0:
            if nums1[p1] < nums2[p2]:
                nums1[p] = nums2[p2]
                p2 -= 1
            else:
                nums1[p] = nums1[p1]
                p1 -= 1
            p -= 1

        # add missing elements from nums2
        nums1[:p2 + 1] = nums2[:p2 + 1]

    # 自写: 将nums1中大的数换到nums2中，如果发生交换，就对nums2重新进行排序
    # 复杂度：时间O(m * nlogn + n)
    # 执行用时：44 ms, 在所有 Python3 提交中击败了48.96%的用户
    # 内存消耗：13.6 MB, 在所有 Python3 提交中击败了5.26%的用户
    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:
        """
        Do not return anything, modify nums1 in-place instead.
        """
        if not nums1 or not nums2:
            return
        index1 = 0
        index2 = 0
        while index1 < m:
            num1 = nums1[index1]
            num2 = nums2[index2]
            if num1 > num2:
                nums1[index1], nums2[index2] = nums2[index2], nums1[index1]
                nums2 = sorted(nums2)
            index1 += 1
        while index2 < n:
            nums1[index1] = nums2[index2]
            index1 += 1
            index2 += 1


if __name__ == "__main__":
    # 出错用例。未检查数组是否为空
    """
    [1]
    1
    []
    0
    """
    su = Solution()
    a = [1, 2, 3, 0, 0, 0]
    b = [2, 5, 6]
    su.merge3(a, 3, b, 3)
    print(a)

    a = [1, 2, 3, 7, 8, 0, 0, 0]
    su.merge3(a, 5, b, 3)
    print(a)
