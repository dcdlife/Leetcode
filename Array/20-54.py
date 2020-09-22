"""
54. 螺旋矩阵 (中等)
https://leetcode-cn.com/problems/spiral-matrix/

给定一个包含 m x n 个元素的矩阵（m 行, n 列），请按照顺时针螺旋顺序，返回矩阵中的所有元素。

示例 1:

输入:
[
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
]
输出: [1,2,3,6,9,8,7,4,5]
示例 2:

输入:
[
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [9,10,11,12]
]
输出: [1,2,3,4,8,12,11,10,9,5,6,7]

"""

from typing import List

class Solution:

    # 方法2: 按层模拟。依次从外圈遍历到内圈
    # 复杂度: 时间O(mn), 空间O(1)
    # 执行用时：36 ms, 在所有 Python3 提交中击败了85.51%的用户
    # 内存消耗：13.4 MB, 在所有 Python3 提交中击败了35.26%的用户
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        if not matrix or not matrix[0]:
            return list()
        
        rows, columns = len(matrix), len(matrix[0])
        order = list()
        left, right, top, bottom = 0, columns - 1, 0, rows - 1
        while left <= right and top <= bottom:
            for column in range(left, right + 1):
                order.append(matrix[top][column])
            for row in range(top + 1, bottom + 1):
                order.append(matrix[row][right])
            if left < right and top < bottom:
                for column in range(right - 1, left, -1):
                    order.append(matrix[bottom][column])
                for row in range(bottom, top, -1):
                    order.append(matrix[row][left])
            left, right, top, bottom = left + 1, right - 1, top + 1, bottom - 1
        return order

    # 方法1: 顺时针打印，模拟旋转路径。创建一个同样的矩阵用来标记是否被遍历过,当遇到边界/或者遍历过，就执行旋转，调整打印方向。
    # 复杂度: 时间O(mn), 空间O(mn)
    # 执行用时：40 ms, 在所有 Python3 提交中击败了65.34%的用户
    # 内存消耗：13.4 MB, 在所有 Python3 提交中击败了27.23%的用户
    def spiralOrder1(self, matrix: List[List[int]]) -> List[int]:
        if not matrix or not matrix[0]:
            return []
            
        rows, cols = len(matrix), len(matrix[0])
        visited = [[False] * cols for _ in range(rows)]
        total = rows * cols
        order = [0] * total
        row, col = 0, 0
        directions = [[0,1], [1,0], [0,-1], [-1,0]]
        directionIndex = 0
        for i in range(total):
            order[i] = matrix[row][col]
            visited[row][col] = True
            nextRow, nexCol = row + directions[directionIndex][0], col + directions[directionIndex][1]
            # 校验nextRow及nextCol
            if not (0 <= nextRow < rows and 0 <= nexCol < cols and not visited[nextRow][nexCol]):
                directionIndex = (directionIndex + 1) % 4
            row += directions[directionIndex][0]
            col += directions[directionIndex][1]
        
        return order

if __name__ == "__main__":
    su = Solution()

    print(su.spiralOrder(
        [[2,5],[8,4],[0,-1]]
    ))

    print(su.spiralOrder(
        [[1,2,3,4,5],[6,7,8,9,10]]
    ))

    # print(su.spiralOrder(
    #     [[1],[2],[3]]
    # ))

    # print(su.spiralOrder(
    #     [[1,2,3]]
    # ))
    # su.spiralOrder(
    #     [
    #         [1, 2, 3, 4],
    #         [5, 6, 7, 8],
    #         [9,10,11,12],
    #         [13,14,15,16]
    #     ]
    # )
    # su.spiralOrder(
    #     [
    #         [ 1, 2, 3 ],
    #         [ 4, 5, 6 ],
    #         [ 7, 8, 9 ]
    #     ]
    # )
    # su.spiralOrder(
    #     [
    #         [ 1, 2, 3,4],
    #         [ 4, 5, 6,7],
    #         [ 7, 8, 9,10 ]
    #     ]
    # )

    # su.spiralOrder(
    #     [
    #         [ 1, 2, 3 ],
    #         [ 4, 5, 6 ],
    #         [ 7, 8, 9 ],
    #         [10,11,12]
    #     ]
    # )
    