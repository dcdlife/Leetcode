"""
174. 地下城游戏
困难
https://leetcode-cn.com/problems/dungeon-game/
"""

from typing import List

class Solution:
    # 方法一: 动态规划。本地思路为从右下往左上执行动态规划，考验逆向思维，以往的动态规划大多是正向思维。

    # 72 ms	    20.22%
    # 14.3 MB   100.00%
    def calculateMinimumHP(self, dungeon: List[List[int]]) -> int:
        rows = len(dungeon)
        cols = len(dungeon[0])
        dp = [[float('inf')] * (cols + 1) for _ in range(rows + 1)]
        dp[rows][cols - 1] = dp[rows - 1][cols] = 1
        for row in range(rows - 1, -1, -1):
            for col in range(cols - 1, -1, -1):
                dp[row][col] = max((min(dp[row + 1][col], dp[row][col + 1]) - dungeon[row][col]), 1)
        return dp[0][0]


if __name__ == "__main__":
    su = Solution()
    tests = [
        [[-2,-3,3],[-5,-10,1],[10,30,-5]]
    ]
    for test in tests:
        print(su.calculateMinimumHP(test))
