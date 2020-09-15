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
    # 方法一: 先按左上到右小的对角线反转，然后再反转每一行。
    # 时间复杂度: O(n)
    def rotate(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        if not matrix:
            return None
        
        rows = len(matrix)
        cols = len(matrix[0])
        for i in range(rows):
            for j in range(i, rows):
                print(i, j)
                matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
        
        print(matrix)


if __name__ == "__main__":
    su = Solution()
    su.rotate([[1,2,3], [4,5,6], [7,8,9]])

        
