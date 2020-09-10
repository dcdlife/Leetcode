"""
45. 跳跃游戏 II (困难)
https://leetcode-cn.com/problems/jump-game-ii/

给定一个非负整数数组，你最初位于数组的第一个位置。

数组中的每个元素代表你在该位置可以跳跃的最大长度。

你的目标是使用最少的跳跃次数到达数组的最后一个位置。

示例:

输入: [2,3,1,1,4]
输出: 2
解释: 跳到最后一个位置的最小跳跃数是 2。
     从下标为 0 跳到下标为 1 的位置，跳 1 步，然后跳 3 步到达数组的最后一个位置。
说明:

假设你总是可以到达数组的最后一个位置。

"""

from typing import List

class Solution:
    # 使用贪心算法
    # 题解: https://leetcode-cn.com/problems/jump-game-ii/solution/tiao-yue-you-xi-ii-by-leetcode-solution/
    def jump(self, nums: List[int]) -> int:
        n = len(nums)
        maxPos, end, step = 0, 0, 0
        for i in range(n - 1):
            if maxPos >= i:
                maxPos = max(maxPos, i + nums[i])
                if i == end:
                    end = maxPos
                    step += 1
        return step


if __name__ == "__main__":
    # 测试用例
    # 1. 一步可达 [3,2] [1,1]
    # 2. 最后一步达 [1,2,1,1,1] [1,1,1]
    # 3. 中间达 [1,1,3,1,1,1]
    # 4. 有0 [0]
    # 5. 单个数字 [1]
    # 6. 出错用例: [10,9,8,7,6,5,4,3,2,1,1,0]
    su = Solution()
    print(su.jump([2,3,1,1,4]))
    print(su.jump([10,9,8,7,6,5,4,3,2,1,1,0]))
