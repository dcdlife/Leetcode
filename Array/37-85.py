"""
85. 最大矩形 (困难)
https://leetcode-cn.com/problems/maximal-rectangle/

给定一个仅包含 0 和 1 的二维二进制矩阵，找出只包含 1 的最大矩形，并返回其面积。

示例:

输入:
[
  ["1","0","1","0","0"],
  ["1","0","1","1","1"],
  ["1","1","1","1","1"],
  ["1","0","0","1","0"]
]
输出: 6
"""

from typing import List

class Solution:

    # 通过计算每个点的最大宽度，然后在每个点从下到上一次计算以这个点为右下角的矩形
    # 复杂度: 时间O(n*n*m) 空间O(nm)
    # 执行用时：2236 ms, 在所有 Python3 提交中击败了13.97%的用户
    # 内存消耗：14.3 MB, 在所有 Python3 提交中击败了5.09%的用户
    def maximalRectangle(self, matrix: List[List[str]]) -> int:
        maxarea = 0

        dp = [[0] * len(matrix[0]) for _ in range(len(matrix))]
        for i in range(len(matrix)):
            for j in range(len(matrix[0])):
                if matrix[i][j] == '0': continue

                # compute the maximum width and update dp with it
                width = dp[i][j] = dp[i][j-1] + 1 if j else 1

                # compute the maximum area rectangle with a lower right corner at [i, j]
                for k in range(i, -1, -1):
                    width = min(width, dp[k][j])
                    maxarea = max(maxarea, width * (i-k+1))
        return maxarea

if __name__ == "__main__":
    su = Solution()
    print(su.maximalRectangle(
        [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
    ))