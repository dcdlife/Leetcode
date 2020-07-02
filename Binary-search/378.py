"""
378. 有序矩阵中第K小的元素
中等
https://leetcode-cn.com/problems/kth-smallest-element-in-a-sorted-matrix/
"""

from typing import List

class Solution:
    # 方法一：二分法

    # 200 ms    96.21%
    # 19.8 MB	50.00%
    def kthSmallest(self, matrix: List[List[int]], k: int) -> int:
        n = len(matrix)

        def check(mid):
            i, j = n - 1, 0
            num = 0
            while i >= 0 and j < n:
                if matrix[i][j] <= mid:
                    num += i + 1
                    j += 1
                else:
                    i -= 1
            return num >= k

        left, right = matrix[0][0], matrix[-1][-1]
        while left < right:
            mid = (left + right) // 2
            if check(mid):
                right = mid
            else:
                left = mid + 1
        
        return left

if __name__ == "__main__":
    su = Solution()
    test = [
        ([
            [1, 5, 9],
            [10, 11, 13],
            [12, 13, 15]
        ], 8),
        ([[1]], 1),
        ([
            [1,2],
            [2,3]
        ], 2)
    ]
    for (matrix, k) in test:
        print(su.kthSmallest(matrix, k))



