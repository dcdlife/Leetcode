"""
42. 接雨水 (困难)
https://leetcode-cn.com/problems/trapping-rain-water/

给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。



上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 感谢 Marcos 贡献此图。

示例:

输入: [0,1,0,2,1,0,1,3,2,1,2,1]
输出: 6

"""

from typing import List

class Solution:

    # 双指针比较难想：
    def trap(self, height: List[int]) -> int:
        # 边界条件
        if not height: return 0
        n = len(height)

        left,right = 0, n - 1  # 分别位于输入数组的两端
        maxleft,maxright = height[0],height[n - 1]
        ans = 0

        while left <= right:
            maxleft = max(height[left],maxleft)
            maxright = max(height[right],maxright)
            if maxleft < maxright:
                ans += maxleft - height[left]
                left += 1
            else:
                ans += maxright - height[right]
                right -= 1

        return ans

    # 栈的应用 时间O(n) 空间O(n)
    # 执行用时：52 ms, 在所有 Python3 提交中击败了56.60%的用户
    # 内存消耗：14.2 MB, 在所有 Python3 提交中击败了30.31%的用户
    def trap3(self, height: List[int]) -> int:
        if not height:
            return 0

        length = len(height) 
        if length < 3:
            return 0

        ans = 0
        current = 0
        stack = []
        while current < length:
            while len(stack) and height[current] > height[stack[-1]]:
                top = stack.pop()
                if len(stack) == 0:
                    break
                h = min(height[stack[-1]], height[current]) - height[top]
                distance = current - stack[-1] - 1
                ans += h * distance
            stack.append(current)
            current += 1

        return ans

    # 暴力优化之动态编程: 时间O(n) 空间O(n)。
    # 先通过两次for循环分别找出索引左侧的最大值和右侧的最大值
    # 执行用时：44 ms, 在所有 Python3 提交中击败了89.34%的用户
    # 内存消耗：14.2 MB, 在所有 Python3 提交中击败了22.68%的用户
    # 注意: [2,0,2]
    def trap2(self, height: List[int]) -> int:
        if not height:
            return 0

        length = len(height) 
        if length < 3:
            return 0

        max_lefts = [0] * length
        max_lefts[0] = height[0]
        for i in range(1, length):
            max_lefts[i] = max(height[i], max_lefts[i - 1])

        max_rights = [0] * length
        max_rights[length - 1] = height[length - 1]
        for i in range(length - 2, -1, -1):
            max_rights[i] = max(height[i], max_rights[i + 1])
        
        ans = 0
        for i in range(1, length - 1):
            ans += max(0, min(max_lefts[i], max_rights[i]) - height[i])
        
        return ans


    # 暴力法 时间O(n^2) 空间O(1): 
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


if __name__ == "__main__":
    su = Solution()
    print(su.trap([2,0,2]))
    print(su.trap([0,1,0,2,1,0,1,3,2,1,2,1]))
