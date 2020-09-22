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
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        if not matrix:
            return []

        size = len(matrix)
        if size == 0:
            return []

        res = []
        rows = size
        cols = len(matrix[0])
        xs = cols // 2 + cols % 2
        if cols == 1:
            for i in range(rows):
                res.append(matrix[i][0])
            return res
        if rows == 1:
            for i in range(cols):
                res.append(matrix[0][i])
            return res
        
        if rows == 2 or cols == 2:
            i = 0
            maxCol = cols - 1
            maxRow = rows - 1
            for col in range(i, maxCol + 1):
                res.append(matrix[i][col])
            for row in range(i + 1, maxRow + 1):
                res.append(matrix[row][maxCol])
            for col in range(maxCol - 1, i - 1, -1):
                res.append(matrix[maxRow][col])
            for row in range(maxRow - 1, i, -1):
                res.append(matrix[row][i])
            return res

        for i in range(xs):
            if (rows % 2 == 0 and cols % 2 == 0) or i != xs - 1: 
                maxCol = cols - i - 1
                maxRow = rows - i - 1
                for col in range(i, maxCol + 1):
                    res.append(matrix[i][col])
                for row in range(i + 1, maxRow + 1):
                    res.append(matrix[row][maxCol])
                for col in range(maxCol - 1, i - 1, -1):
                    res.append(matrix[maxRow][col])
                for row in range(maxRow - 1, i, -1):
                    res.append(matrix[row][i])
            else:
                if rows % 2 == 1:
                    if cols % 2 == 1:
                        res.append(matrix[xs - 1][xs - 1])
                    else:
                        for i in range(xs - 1, cols - xs + 1):
                            res.append(matrix[xs - 1][i])
                else:
                    for i in range(xs - 1, rows - xs + 1):
                        res.append(matrix[i][xs - 1])
        return res

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
    