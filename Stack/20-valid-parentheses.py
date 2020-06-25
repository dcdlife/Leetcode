"""
20. 有效的括号
简单
https://leetcode-cn.com/problems/valid-parentheses/
"""

class Solution:
    # 方法一: 利用栈，遇到左括号入栈，遇到右括号将栈中的栈顶元素出栈，并判断当前的括号和出栈的括号是否匹配。
    # 40 ms	    75.79%
    # 13.9 MB	5.22%
    def isValid(self, s: str) -> bool:
        if not s:
            return True

        parenthesisDict = {
            '(': ')',
            '[': ']',
            '{': '}'
        }
        keys = parenthesisDict.keys()
        stack = []

        for i in s:
            if i in keys:
                stack.append(i)
            else:
                if len(stack) == 0:
                    return False
                top = stack.pop()
                if i != parenthesisDict[top]:
                    return False
        
        return len(stack) == 0





