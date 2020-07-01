"""
718. 最长重复子数组
中等
https://leetcode-cn.com/problems/maximum-length-of-repeated-subarray/
"""

class Solution:
    def findLength(self, A: List[int], B: List[int]) -> int:
        n, m = len(A), len(B)
        dp = [[0] * (m + 1) for _ in range(n + 1)]
        res = 0
        for i in range(n - 1, -1, -1):
            for j in range(m - 1, -1, -1):
                dp[i][j] = dp[i + 1][j + 1] + 1 if A[i] == B[j] else 0
                res = max(res, dp[i][j])
        return res