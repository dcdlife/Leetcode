"""
96. 不同的二叉搜索树
中等
https://leetcode-cn.com/problems/unique-binary-search-trees/
"""

class Solution:
    # 方法一: 动态规划
    # dp[i] = dp[0] + dp[i] + ... + dp[i - 1]
    # dp[0] = 1, dp[1] = 1
    # F(i,n) = G(i−1)⋅G(n−i) i表示以i为根，n表示n个数
    
    # 40 ms	    65.73%
    # 13.7 MB   5.26%
    def numTrees(self, n: int) -> int:
        dp = [0] * (n + 1)
        dp[0] = dp[1] = 1
        for i in range(2, n + 1):
            for j in range(1, i + 1):
                dp[i] += dp[j - 1] * dp[i - j]
        return dp[n]