"""
73. 矩阵置零 (中等)
https://leetcode-cn.com/problems/set-matrix-zeroes/

给定一个 m x n 的矩阵，如果一个元素为 0，则将其所在行和列的所有元素都设为 0。请使用原地算法。

示例 1:

输入: 
[
  [1,1,1],
  [1,0,1],
  [1,1,1]
]
输出: 
[
  [1,0,1],
  [0,0,0],
  [1,0,1]
]
示例 2:

输入: 
[
  [0,1,2,0],
  [3,4,5,2],
  [1,3,1,5]
]
输出: 
[
  [0,0,0,0],
  [0,4,5,0],
  [0,3,1,0]
]
进阶:

一个直接的解决方案是使用  O(mn) 的额外空间，但这并不是一个好的解决方案。
一个简单的改进方案是使用 O(m + n) 的额外空间，但这仍然不是最好的解决方案。
你能想出一个常数空间的解决方案吗？
"""

from typing import List

class Solution:

    # 待优化

    # 下面的方法优化版
    def setZeroes(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: void Do not return anything, modify matrix in-place instead.
        """
        R = len(matrix)
        C = len(matrix[0])
        rows, cols = set(), set()

        # Essentially, we mark the rows and columns that are to be made zero
        for i in range(R):
            for j in range(C):
                if matrix[i][j] == 0:
                    rows.add(i)
                    cols.add(j)

        # Iterate over the array once again and using the rows and cols sets, update the elements
        for i in range(R):
            for j in range(C):
                if i in rows or j in cols:
                    matrix[i][j] = 0

    def modifyToZeroForAnyDirections(self, matrix: List[List[int]], marks: List) -> None:
        n = len(matrix)
        m = len(matrix[0])
        for x, y in marks:
            for i in range(m):
                matrix[x][i] = 0
            for j in range(n):
                matrix[j][y] = 0

    # 通过遍历找出所有为0的位置，然后将它们所在的放心依次置为0
    # 复杂度: 时间O(mn) 空间O(m+n)
    # 执行用时：48 ms, 在所有 Python3 提交中击败了85.63%的用户
    # 内存消耗：13.7 MB, 在所有 Python3 提交中击败了69.20%的用户
    def setZeroes1(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        if not matrix:
            return None

        n = len(matrix)
        m = len(matrix[0])            
        marks = []
        for i in range(n):
            for j in range(m):
                if matrix[i][j] == 0:
                    marks.append([i, j])
        if len(marks):
            self.modifyToZeroForAnyDirections(matrix, marks)

if __name__ == "__main__":
    su = Solution()
    """
    [[0]]
    [[0,1],[1,0]]
    """
    su.setZeroes([[0,1,2,0],[3,4,5,2],[1,3,1,5]])