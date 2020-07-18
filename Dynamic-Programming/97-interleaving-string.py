"""
97.交错字符串
中等
https://leetcode-cn.com/problems/interleaving-string/
"""

class Solution:
    # 方法一: 动态规划
    # 规划方程: 
    # p = i + j - 1
    # dp[i][j] = (dp[i][j] = dp[i - 1][j] and s1[i - 1] == s3[p]) or (dp[i][j] = dp[i][j - 1] and s2[j - 1] == s3[p])

    # 52 ms	    60.92%
    # 13.8 MB   16.67%
    def isInterleave(self, s1: str, s2: str, s3: str) -> bool:
        m = len(s1)
        n = len(s2)
        o = len(s3)
        
        if m + n != o:
            return False

        dp = [[False] * (n + 1) for _ in range(m + 1)]
        dp[0][0] = True
        for i in range(m + 1):
            for j in range(n + 1):
                p = i + j - 1
                if i > 0 and dp[i][j] == False:
                    dp[i][j] = dp[i - 1][j] and s1[i - 1] == s3[p]
                if j > 0 and dp[i][j] == False:
                    dp[i][j] = dp[i][j - 1] and s2[j - 1] == s3[p]
        return dp[m][n]
