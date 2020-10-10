"""
62. 不同路径 (中等)
https://leetcode-cn.com/problems/unique-paths/

一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。

机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。

问总共有多少条不同的路径？


例如，上图是一个7 x 3 的网格。有多少可能的路径？


示例 1:

输入: m = 3, n = 2
输出: 3
解释:
从左上角开始，总共有 3 条路径可以到达右下角。
1. 向右 -> 向右 -> 向下
2. 向右 -> 向下 -> 向右
3. 向下 -> 向右 -> 向右
示例 2:

输入: m = 7, n = 3
输出: 28
 

提示：

1 <= m, n <= 100
题目数据保证答案小于等于 2 * 10 ^ 9

"""

from typing import List

class Solution:
    # 思路：使用动态规划。每个格子的值为左边格子的值+上面格子的值。初始化时：将[0][0]格子的值设为1
    # 执行用时：44 ms, 在所有 Python3 提交中击败了50.68%的用户
    # 内存消耗：13.3 MB, 在所有 Python3 提交中击败了76.87%的用户
    def uniquePaths(self, m: int, n: int) -> int:
        dp = [[1] * m for _ in range(n)]
        for row in range(1, n): # 行
            for col in range(1, m): # 列
                dp[row][col] = dp[row - 1][col] + dp[row][col - 1]
        return dp[-1][-1]

    # 第一版，上面的为优化版
    # 执行用时：36 ms, 在所有 Python3 提交中击败了90.78%的用户
    # 内存消耗：13.3 MB, 在所有 Python3 提交中击败了58.40%的用户
    def uniquePaths2(self, m: int, n: int) -> int:
        paths = [[0] * m for _ in range(n)]
        paths[0][0] = 1
        for row in range(n): # 行
            for col in range(m): # 列
                firstX, firstY = row - 1, col
                secondX, secondY = row, col - 1
                if firstX >= 0 and firstY >= 0:
                    paths[row][col] += paths[firstX][firstY]
                if secondX >= 0 and secondY >= 0:
                    paths[row][col] += paths[secondX][secondY]
        return paths[n - 1][m - 1]

    # 递归解法。超时
    def uniquePaths1(self, m: int, n: int) -> int:
        if m == 1 or n == 1:
            return 1
        if m == 2 and n == 2:
            return 2
        return self.uniquePaths(m - 1, n) + self.uniquePaths(m, n - 1)

if __name__ == "__main__":
    su = Solution()
    print(su.uniquePaths(5, 3))
    print(su.uniquePaths(7, 3))
    print(su.uniquePaths(30, 30))