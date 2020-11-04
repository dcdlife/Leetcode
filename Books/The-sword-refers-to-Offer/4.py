"""
面试题4. 二维数组中的查找 (中等)
https://leetcode-cn.com/problems/er-wei-shu-zu-zhong-de-cha-zhao-lcof/

在一个 n * m 的二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个高效的函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。

 

示例:

现有矩阵 matrix 如下：

[
  [1,   4,  7, 11, 15],
  [2,   5,  8, 12, 19],
  [3,   6,  9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30]
]
给定 target = 5，返回 true。

给定 target = 20，返回 false。 

限制：

0 <= n <= 1000

0 <= m <= 1000
"""

from typing import List


class Solution:
    # 思路：以右上角为起点，进行遍历判断（也可以选取左下角的数字）
    # 执行用时：48 ms, 在所有 Python3 提交中击败了67.46%的用户
    # 内存消耗：17.5 MB, 在所有 Python3 提交中击败了16.26%的用户
    def findNumberIn2DArray(self, matrix: List[List[int]], target: int) -> bool:
        if not matrix or not matrix[0]:
            return False
        row = 0
        col = len(matrix[0]) - 1
        while row < len(matrix) and col >= 0:
            value = matrix[row][col]
            if value == target:
                return True
            elif value > target:
                col -= 1
            else:
                row += 1
        return False


if __name__ == "__main__":
    su = Solution()
    # 测试用例
    # 1. 二维数组中包含查找的数字
    #   1. 查找的数字是数组中的最大值和最小值
    #   2. 查找的数字介于数组中的最大值和最小值之间
    # 2. 二维数组中没有查找的数字
    #   1. 大于最大值
    #   2. 小于最小值
    #   3. 最大值和最小值之间，但不存在数组中
    # 3. 特殊输入测试：空指针
    print(su.findNumberIn2DArray([], 0))
    print(su.findNumberIn2DArray([
        [1,   4,  7, 11, 15],
        [2,   5,  8, 12, 19],
        [3,   6,  9, 16, 22],
        [10, 13, 14, 17, 24],
        [18, 21, 23, 26, 30]
    ], 1))
    print(su.findNumberIn2DArray([
        [1,   4,  7, 11, 15],
        [2,   5,  8, 12, 19],
        [3,   6,  9, 16, 22],
        [10, 13, 14, 17, 24],
        [18, 21, 23, 26, 30]
    ], 30))
    print(su.findNumberIn2DArray([
        [1,   4,  7, 11, 15],
        [2,   5,  8, 12, 19],
        [3,   6,  9, 16, 22],
        [10, 13, 14, 17, 24],
        [18, 21, 23, 26, 30]
    ], 6))
    print(su.findNumberIn2DArray([
        [1,   4,  7, 11, 15],
        [2,   5,  8, 12, 19],
        [3,   6,  9, 16, 22],
        [10, 13, 14, 17, 24],
        [18, 21, 23, 26, 30]
    ], -1))
    print(su.findNumberIn2DArray([
        [1,   4,  7, 11, 15],
        [2,   5,  8, 12, 19],
        [3,   6,  9, 16, 22],
        [10, 13, 14, 17, 24],
        [18, 21, 23, 26, 30]
    ], 31))
    print(su.findNumberIn2DArray([
        [1,   4,  7, 11, 15],
        [2,   5,  8, 12, 19],
        [3,   6,  9, 16, 22],
        [10, 13, 14, 17, 24],
        [18, 21, 23, 26, 30]
    ], 25))
