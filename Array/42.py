"""
42. 接雨水 (困难)
https://leetcode-cn.com/problems/trapping-rain-water/

给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。



上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 感谢 Marcos 贡献此图。

示例:

输入: [0,1,0,2,1,0,1,3,2,1,2,1]
输出: 6

"""

class Solution:

    # 暴力优化1
    # 执行用时：900 ms, 在所有 Python3 提交中击败了5.19%的用户
    # 内存消耗：14 MB, 在所有 Python3 提交中击败了83.98%的用户
    def trap2(self, height: List[int]) -> int:
        if not height:
            return 0

        length = len(height)   

        if length < 3:
            return 0
        ans = 0
        max_left = height[0]
        for i in range(1, length - 1):
            max_left = max(max_left, height[i-1])
            max_right = max(height[i+1:])
            minInMaxHeights = min(max_left, max_right)
            if height[i] < minInMaxHeights:
                ans += minInMaxHeights - height[i]

        return ans


    # 暴力法: 
    # 执行用时：1712 ms, 在所有 Python3 提交中击败了5.01%的用户
    # 内存消耗：14.3 MB, 在所有 Python3 提交中击败了6.04%的用户
    def trap1(self, height: List[int]) -> int:
        if not height:
            return 0

        ans = 0
        for i in range(1, len(height) - 1):
            max_left = max(height[0:i])
            max_right = max(height[i+1:])
            minInMaxHeights = min(max_left, max_right)
            if height[i] < minInMaxHeights:
                ans += minInMaxHeights - height[i]

        return ans
