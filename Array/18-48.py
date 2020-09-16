"""
48. 旋转图像 (中等)
https://leetcode-cn.com/problems/rotate-image/

给定一个 n × n 的二维矩阵表示一个图像。

将图像顺时针旋转 90 度。

说明：

你必须在原地旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要使用另一个矩阵来旋转图像。

示例 1:

给定 matrix = 
[
  [1,2,3],
  [4,5,6],
  [7,8,9]
],

原地旋转输入矩阵，使其变为:
[
  [7,4,1],
  [8,5,2],
  [9,6,3]
]
示例 2:

给定 matrix =
[
  [ 5, 1, 9,11],
  [ 2, 4, 8,10],
  [13, 3, 6, 7],
  [15,14,12,16]
], 

原地旋转输入矩阵，使其变为:
[
  [15,13, 2, 5],
  [14, 3, 4, 1],
  [12, 6, 8, 9],
  [16, 7,10,11]
]

"""

from typing import List

class Solution:

    # 方法三：法二的精简版。
    def rotate(self, matrix):
      """
      :type matrix: List[List[int]]
      :rtype: void Do not return anything, modify matrix in-place instead.
      """
      n = len(matrix[0])        
      for i in range(n // 2 + n % 2):
          for j in range(n // 2):
              tmp = matrix[n - 1 - j][i]
              matrix[n - 1 - j][i] = matrix[n - 1 - i][n - j - 1]
              matrix[n - 1 - i][n - j - 1] = matrix[j][n - 1 - i]
              matrix[j][n - 1 - i] = matrix[i][j]
              matrix[i][j] = tmp
              print(
                tmp,
                matrix[n - 1 - j][i], 
                matrix[n - 1 - i][n - j - 1],
                matrix[j][n - 1 - i],
                matrix[i][j]
                )

    # 方法二：每次旋转4个点。
    # 复杂度：时间O(n^2)。空间O(1)
    def rotate2(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: void Do not return anything, modify matrix in-place instead.
        """
        n = len(matrix[0])
        for i in range(n // 2 + n % 2):
            for j in range(n // 2):
                tmp = [0] * 4
                row, col = i, j
                print(row, col)
                # store 4 elements in tmp
                for k in range(4):
                    tmp[k] = matrix[row][col]
                    row, col = col, n - 1 - row
                # rotate 4 elements   
                for k in range(4):
                    matrix[row][col] = tmp[(k - 1) % 4]
                    row, col = col, n - 1 - row

        print(matrix)
    # 方法一: 两次矩阵操作。先按左上到右下的对角线反转，然后再反转每一行。
    # 时间复杂度: O(n^2)
    # 执行用时：28 ms, 在所有 Python3 提交中击败了99.28%的用户
    # 内存消耗：13.4 MB, 在所有 Python3 提交中击败了17.28%的用户
    def rotate1(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        if not matrix:
            return None
        
        rows = len(matrix)
        for i in range(rows):
            for j in range(i, rows):
                matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
        
        for i in range(rows):
          left, right = 0, rows - 1
          while left < right:
            matrix[i][left], matrix[i][right] = matrix[i][right], matrix[i][left]
            left += 1
            right -= 1

if __name__ == "__main__":
    su = Solution()
    su.rotate([
      [ 5, 1, 9,11],
      [ 2, 4, 8,10],
      [13, 3, 6, 7],
      [15,14,12,16]
    ])

        
