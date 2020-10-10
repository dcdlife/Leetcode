"""
66. 加一 (简单)
https://leetcode-cn.com/problems/plus-one/

给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。

最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。

你可以假设除了整数 0 之外，这个整数不会以零开头。

示例 1:

输入: [1,2,3]
输出: [1,2,4]
解释: 输入数组表示数字 123。
示例 2:

输入: [4,3,2,1]
输出: [4,3,2,2]
解释: 输入数组表示数字 4321。

"""

from typing import List

class Solution:
    # 题解优秀方法
    # 执行用时：40 ms, 在所有 Python3 提交中击败了70.88%的用户
    # 内存消耗：13.1 MB, 在所有 Python3 提交中击败了97.75%的用户
    def plusOne(self, digits: List[int]) -> List[int]:
        n = len(digits)
        for i in range(n - 1, -1, -1):
            digits[i] = (digits[i] + 1) % 10
            if digits[i] != 0:
                return digits
        digits.insert(0, 1)
        return digits

    # 根据一个标志是否进位的bool值，来判断是否需要进位。
    # 执行用时：36 ms, 在所有 Python3 提交中击败了89.00%的用户
    # 内存消耗：13.3 MB, 在所有 Python3 提交中击败了66.48%的用户
    def plusOne1(self, digits: List[int]) -> List[int]:
        if not digits:
            return []

        needCarry = True
        n = len(digits)
        for i in range(n - 1, -1, -1):
            if needCarry:
                newValue = digits[i] + 1
                digits[i] = newValue if newValue <= 9 else 10 - newValue
                needCarry = False if newValue <= 9 else True
            else:
                break
        return [1] + digits if needCarry else digits

if __name__ == "__main__":
    su = Solution()
    print(su.plusOne([1,2,4]))
    print(su.plusOne([9]))