"""
剑指 Offer 05. 替换空格 (简单)
https://leetcode-cn.com/problems/ti-huan-kong-ge-lcof/

请实现一个函数，把字符串 s 中的每个空格替换成"%20"。

示例 1：

输入：s = "We are happy."
输出："We%20are%20happy."
"""

from typing import List


class Solution:
    # 定义一个空字符串，然后遍历原串，遇到空格加入%20
    # 执行用时：40 ms, 在所有 Python3 提交中击败了62.22%的用户
    # 内存消耗：13.5 MB, 在所有 Python3 提交中击败了13.25%的用户
    def replaceSpace(self, s: str) -> str:
        if not s:
            return ""

        newS = ''
        n = len(s)
        index = 0
        while index < n:
            if s[index] == ' ':
                newS += '%20'
            else:
                newS += s[index]
            index += 1
        return newS


if __name__ == "__main__":
    su = Solution()
    # 测试用例：
    # 1. 输入的字符串中包含空格
    #   1. 空格位于字符串的最前面
    #   2. 空格位于字符串的最后面
    #   3. 空格位于字符串的中间
    #   4. 字符串中有连续多个空格
    # 2. 输入的字符串中没有空格
    # 3. 特殊输入测试
    #   1. 字符串是一个nullptr指针
    #   2. 字符串是一个空字符串
    #   3. 字符串只有一个空格字符
    #   4. 字符串中有连续多个空格
    print(su.replaceSpace("We are happy."))
