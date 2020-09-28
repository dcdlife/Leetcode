"""
74. 搜索二维矩阵 (中等)
https://leetcode-cn.com/problems/search-a-2d-matrix/

编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性：

每行中的整数从左到右按升序排列。
每行的第一个整数大于前一行的最后一个整数。
示例 1:

输入:
matrix = [
  [1,   3,  5,  7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
]
target = 3
输出: true
示例 2:

输入:
matrix = [
  [1,   3,  5,  7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
]
target = 13
输出: false
"""

from typing import List

class Solution:

    # 方法二：标准的二分查找。把二维数组想象成一维。利用 index // n 来得出行， index % n 来得出列
    # 复杂度: 时间O(log(mn)) 空间O(1)
    # 执行用时：36 ms, 在所有 Python3 提交中击败了92.18%的用户
    # 内存消耗：14.4 MB, 在所有 Python3 提交中击败了5.11%的用户
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        m = len(matrix)
        if m == 0:
            return False
        n = len(matrix[0])
        
        #二分查找
        left, right = 0, m * n - 1
        while left <= right:
                pivot_idx = (left + right) // 2
                pivot_element = matrix[pivot_idx // n][pivot_idx % n]
                if target == pivot_element:
                    return True
                else:
                    if target < pivot_element:
                        right = pivot_idx - 1
                    else:
                        left = pivot_idx + 1
        return False


    # 方法一: 先找到行，然后再用折半查找在找到的行中查找
    # 复杂度: 时间O(n) 空间O(1)
    # 执行用时：32 ms, 在所有 Python3 提交中击败了97.90%的用户
    # 内存消耗：14.3 MB, 在所有 Python3 提交中击败了9.86%的用户
    def searchMatrix1(self, matrix: List[List[int]], target: int) -> bool:
        if not matrix or not matrix[0]:
            return False
        rows = len(matrix)
        cols = len(matrix[0])
        targetRow = -1
        for i in range(rows - 1, -1, -1):
          if matrix[i][0] == target:
            return True
          if matrix[i][0] < target:
            targetRow = i
            break
          
        if targetRow == -1:
          return False

        left, right = 0, cols - 1
        while left <= right:
          mid = left + (right - left) // 2
          value = matrix[targetRow][mid]
          if value == target:
            return True
          elif value > target:
            right = mid - 1
          else:
            left = mid + 1
        return False

if __name__ == "__main__":
    su = Solution()
    print(su.searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,50]],11))
    print(su.searchMatrix([[1]], 1))
    print(su.searchMatrix(
      [
        [1,   3,  5,  7],
        [10, 11, 16, 20],
        [23, 30, 34, 50]
      ],
      3
    ))
    print(su.searchMatrix(
      [
        [1,   3,  5,  7],
        [10, 11, 16, 20],
        [23, 30, 34, 50]
      ],
      13
    ))
    print(su.searchMatrix([[1,1]], 2))
    