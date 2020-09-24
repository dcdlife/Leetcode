"""
59. 螺旋矩阵 II (中等)
https://leetcode-cn.com/problems/spiral-matrix-ii/

给定一个正整数 n，生成一个包含 1 到 n2 所有元素，且元素按顺时针顺序螺旋排列的正方形矩阵。

示例:

输入: 3
输出:
[
 [ 1, 2, 3 ],
 [ 8, 9, 4 ],
 [ 7, 6, 5 ]
]
"""

from typing import List

class Solution:

    # 题解看到的更好的方法
    def generateMatrix(self, n: int) -> [[int]]:
        l, r, t, b = 0, n - 1, 0, n - 1
        mat = [[0 for _ in range(n)] for _ in range(n)]
        num, tar = 1, n * n
        while num <= tar:
            for i in range(l, r + 1): # left to right
                mat[t][i] = num
                num += 1
            t += 1
            for i in range(t, b + 1): # top to bottom
                mat[i][r] = num
                num += 1
            r -= 1
            for i in range(r, l - 1, -1): # right to left
                mat[b][i] = num
                num += 1
            b -= 1
            for i in range(b, t - 1, -1): # bottom to top
                mat[i][l] = num
                num += 1
            l += 1
        return mat

    # 方法一: 顺时针从外到内依次添加元素。利用标记数组和四个方向数组，判断下一个位置是否遍历过或超出边界，如果是，就转到下一个方向。
    # 复杂度: 时间O(n), 空间O(n)
    # 执行用时：32 ms, 在所有 Python3 提交中击败了97.29%的用户
    # 内存消耗：13.3 MB, 在所有 Python3 提交中击败了72.62%的用户
    def generateMatrix1(self, n: int) -> List[List[int]]:
        res = [[0] * n for _ in range(n)]
        visited = [[False] * n for _ in range(n)]
        directions = [[0,1], [1,0], [0,-1], [-1, 0]]
        directionIndex = 0
        row, col = 0, 0
        for i in range(1, n ** 2 + 1):
            res[row][col] = i
            visited[row][col] = True
            nextRow, nextCol = row + directions[directionIndex][0], col + directions[directionIndex][1]
            if not (0 <= nextRow < n and 0 <= nextCol < n and visited[nextRow][nextCol] == False):
                directionIndex = (directionIndex + 1) % 4
            row, col = row + directions[directionIndex][0], col + directions[directionIndex][1]
        return res

if __name__ == "__main__":
    su = Solution()
    su.generateMatrix(1)
    su.generateMatrix(2)
    su.generateMatrix(3)