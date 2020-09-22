"""
55. 跳跃游戏 (中等)
https://leetcode-cn.com/problems/jump-game/

给定一个非负整数数组，你最初位于数组的第一个位置。

数组中的每个元素代表你在该位置可以跳跃的最大长度。

判断你是否能够到达最后一个位置。

示例 1:

输入: [2,3,1,1,4]
输出: true
解释: 我们可以先跳 1 步，从位置 0 到达 位置 1, 然后再从位置 1 跳 3 步到达最后一个位置。
示例 2:

输入: [3,2,1,0,4]
输出: false
解释: 无论怎样，你总会到达索引为 3 的位置。但该位置的最大跳跃长度是 0 ， 所以你永远不可能到达最后一个位置。

"""

from typing import List

class Solution:

    # 官方代码:
    def canJump(self, nums: List[int]) -> bool:
        n, rightmost = len(nums), 0
        for i in range(n):
            if i <= rightmost:
                rightmost = max(rightmost, i + nums[i])
                if rightmost >= n - 1:
                    return True
        return False

    # 贪心算法：遍历所有元素，记录可到达的最远索引，并每次判断当前索引是否在最远的范围内，然后根据最新的索引加上其能前进的距离，更新最远距离。
    # 最后判断，最后一个元素是否在最远距离内即可。
    # 复杂度： 时间O(n), 空间O(1)
    # 执行用时：52 ms, 在所有 Python3 提交中击败了69.04%的用户
    # 内存消耗：14.7 MB, 在所有 Python3 提交中击败了68.00%的用户
    def canJump1(self, nums: List[int]) -> bool:
        if not nums:
            return False
        
        size = len(nums)
        maxDistance = nums[0]
        for i in range(size):
            if maxDistance >= i:
                if i + nums[i] > maxDistance:
                    maxDistance = i + nums[i]
            if maxDistance >= size - 1:
                return True
        return False

if __name__ == "__main__":
    su = Solution()
    print(su.canJump([0]))
    print(su.canJump([0, 0]))
    print(su.canJump([1,2,3]))
    print(su.canJump([2,3,1,1,4]))
    print(su.canJump([3,2,1,0,4]))