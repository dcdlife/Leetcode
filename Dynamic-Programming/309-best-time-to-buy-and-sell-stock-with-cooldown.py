"""
309. 最佳买卖股票时机含冷冻期
中等
https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
"""

from typing import List

class Solution:
    # 方法一: 动态规划。
    # dp[i][0] 代表当前持有股票 max(dp[i - 1][0], dp[i - 1][2] - prices[i])
    # dp[i][1] 代表当前不持有，且在冷冻期 dp[i - 1][0] + prices[i]
    # dp[i][2] 代表当前不持有，且不在冷冻期 max(dp[i - 1][1], dp[i - 1][2])

    # 60 ms	    32.11%
    # 14.1 MB   9.09%
    def maxProfit(self, prices: List[int]) -> int:
        if not prices:
            return 0

        n = len(prices)
        dp = [[-prices[0], 0, 0]] + [[0] * 3 for _ in range(n - 1)]

        for i in range(1, n):
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][2] - prices[i])
            dp[i][1] = dp[i - 1][0] + prices[i]
            dp[i][2] = max(dp[i - 1][1], dp[i - 1][2])
        return max(dp[n - 1][1], dp[n - 1][2])

if __name__ == "__main__":
    su = Solution()
    test = [
        [1,2,3,0,2]
    ]
    for i in test:
        print(su.maxProfit(i))
