"""
84. 柱状图中最大的矩形 (困难)
https://leetcode-cn.com/problems/largest-rectangle-in-histogram/

给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。

求在该柱状图中，能够勾勒出来的矩形的最大面积。

以上是柱状图的示例，其中每个柱子的宽度为 1，给定的高度为 [2,1,5,6,2,3]。

图中阴影部分为所能勾勒出的最大矩形面积，其面积为 10 个单位。

示例:

输入: [2,1,5,6,2,3]
输出: 10
"""

from typing import List

class Solution:
    # 单调栈思路：遍历每一个柱子，寻找当前柱子左/右两侧第一个小于当前柱子高度的柱子。每个柱子形成的最大矩形，为：(当前柱子右侧第一个小于当前柱子高度的柱子 - 当前柱子左侧第一个小于当前柱子高度的柱子 - 1) * 当前柱子高度
    # 复杂度: 时间O(n)， 空间O(n)
    # 执行用时：72 ms, 在所有 Python3 提交中击败了61.01%的用户
    # 内存消耗：15.5 MB, 在所有 Python3 提交中击败了19.51%的用户
    def largestRectangleArea(self, heights: List[int]) -> int:
        n = len(heights)
        left, right = [0] * n, [0] * n

        mono_stack = list()
        for i in range(n):
            while mono_stack and heights[mono_stack[-1]] >= heights[i]:
                mono_stack.pop()
            left[i] = mono_stack[-1] if mono_stack else -1
            mono_stack.append(i)
        
        mono_stack = list()
        for i in range(n - 1, -1, -1):
            while mono_stack and heights[mono_stack[-1]] >= heights[i]:
                mono_stack.pop()
            right[i] = mono_stack[-1] if mono_stack else n
            mono_stack.append(i)
        
        ans = max((right[i] - left[i] - 1) * heights[i] for i in range(n)) if n > 0 else 0
        return ans

if __name__ == "__main__":
    su = Solution()
