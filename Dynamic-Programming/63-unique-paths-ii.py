"""
63. 不同路径 II
中等
https://leetcode-cn.com/problems/unique-paths-ii/
"""

from typing import List

class Solution:
    # 方法一: 动态规划思路，到重点的路径等于左边的加上上面的两个点的路径和

    # 48 ms	    35.96%
    # 13.8 MB   14.29%
    def uniquePathsWithObstacles(self, obstacleGrid: List[List[int]]) -> int:
        m = len(obstacleGrid)
        n = len(obstacleGrid[0])
        dp = [[0] * n for _ in range(m)]
        if obstacleGrid[0][0] == 1 or obstacleGrid[m - 1][n - 1]:
            return 0
        if m == n == 1:
            return 1
        dp[0][0] = 1
        for i in range(m):
            for j in range(n):
                if i == 0 and j == 0:
                    continue
                if obstacleGrid[i][j] == 0:
                    path = 0
                    if j - 1 >= 0:
                        if obstacleGrid[i][j - 1] == 0:
                            path += dp[i][j - 1]
                    if i - 1 >= 0:
                        if obstacleGrid[i - 1][j] == 0:
                            path += dp[i - 1][j]
                    dp[i][j] = path
        if m == 1:
            return dp[0][n - 1]
        if n == 1:
            return dp[m - 1][0]
        return dp[m - 1][n - 2] + dp[m - 2][n - 1]

if __name__ == "__main__":
    su = Solution()
    test = [
        [[0],[0]],
        [[0,0,0,0]],
        [
            [0,0,0,0,0],
            [0,1,0,1,0],
            [0,0,0,0,0]
        ],
        [[0,0,0],[0,1,0],[0,0,0]],
        [[0,0],[0,1]]
    ]
    for i in test:
        print(su.uniquePathsWithObstacles(i))



[[0,0,0],[0,1,0],[0,0,0]]
[[0,0,0,0,0],[0,1,0,1,0],[0,0,0,0,0]]
[[1]]
[[0]]
[[0,1,1],[0,0,0]]
[[0,0,1],[1,0,0],[0,1,0]]
[[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]
[[0,0],[0,0]]
[[0],[0]]
[[0,0,0,0]]
[[0,0],[0,1]]