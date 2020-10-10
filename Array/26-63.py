"""
63. 不同路径 II (中等)
https://leetcode-cn.com/problems/unique-paths-ii/

一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。

机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。

现在考虑网格中有障碍物。那么从左上角到右下角将会有多少条不同的路径？

网格中的障碍物和空位置分别用 1 和 0 来表示。

说明：m 和 n 的值均不超过 100。

示例 1:

输入:
[
  [0,0,0],
  [0,1,0],
  [0,0,0]
]
输出: 2
解释:
3x3 网格的正中间有一个障碍物。
从左上角到右下角一共有 2 条不同的路径：
1. 向右 -> 向右 -> 向下 -> 向下
2. 向下 -> 向下 -> 向右 -> 向右
"""

from typing import List

# Obstacle 障碍物

class Solution:

    # 使用动态规划，如果碰到障碍物就不进行计算
    # 复杂度: 时间O(mn) 空间O(mn)
    # 执行用时：40 ms, 在所有 Python3 提交中击败了80.00%的用户
    # 内存消耗：13.5 MB, 在所有 Python3 提交中击败了5.39%的用户
    def uniquePathsWithObstacles(self, obstacleGrid: List[List[int]]) -> int:
        rows = len(obstacleGrid)
        cols = len(obstacleGrid[0])
        paths = [[0] * cols for _ in range(rows)]
        # 边界条件处理 [[0]] [[1]] [[1,0]]
        if obstacleGrid[0][0] == 1:
            return 0
        paths[0][0] = 1
        for i in range(1, cols):
            if obstacleGrid[0][i] != 1:
                paths[0][i] = 1
            else:
                break
        for j in range(1, rows):
            if obstacleGrid[j][0] != 1:
                paths[j][0] = 1
            else:
                break

        for row in range(1, rows):
            for col in range(1, cols):
                if obstacleGrid[row][col] != 1:
                    paths[row][col] = paths[row - 1][col] + paths[row][col - 1]

        return paths[-1][-1]

if __name__ == "__main__":
    su = Solution()
    print(su.uniquePathsWithObstacles([
        [0,0,0],
        [0,1,0],
        [0,0,0]
    ]))