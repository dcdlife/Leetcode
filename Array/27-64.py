"""
64. 最小路径和 (中等)
https://leetcode-cn.com/problems/minimum-path-sum/

给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。

说明：每次只能向下或者向右移动一步。

示例:

输入:
[
  [1,3,1],
  [1,5,1],
  [4,2,1]
]
输出: 7
解释: 因为路径 1→3→1→1→1 的总和最小。
"""

from typing import List

class Solution:
    # 动态规划，取上方及左方的最小值加上自身的值为格子的最短路径和
    # 复杂度: 时间O(mn) 空间O(mn)
    # 执行用时：56 ms, 在所有 Python3 提交中击败了82.17%的用户
    # 内存消耗：14.6 MB, 在所有 Python3 提交中击败了56.90%的用户
    def minPathSum(self, grid: List[List[int]]) -> int:
        if not grid or not grid[0]:
            return 0
        rows = len(grid)
        cols = len(grid[0])
        paths = [[0] * cols for _ in range(rows)]
        paths[0][0] = grid[0][0]
        for i in range(1, cols):
            paths[0][i] = paths[0][i - 1] + grid[0][i]
        for j in range(1, rows):
            paths[j][0] = paths[j - 1][0] + grid[j][0]
        for row in range(1, rows):
            for col in range(1, cols):
                paths[row][col] = min(paths[row][col - 1], paths[row - 1][col]) + grid[row][col]
        return paths[-1][-1]

if __name__ == "__main__":
    su = Solution()
    # [[1,3,1],[1,5,1],[4,2,1]]
    # [[1],[2],[3]]
    # [[1]]
    # [[0]]
    # [[3]]
    # [[0,1],[1,0]]
    print(
        su.minPathSum(
            [
                [1,3,1],
                [1,5,1],
                [4,2,1]
            ]
        )
    )
    print(
        su.minPathSum(
            [
                [0]
            ]
        )
    )
    print(
        su.minPathSum(
            [
                [1]
            ]
        )
    )