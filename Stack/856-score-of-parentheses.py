"""
856. 括号的分数
中等
https://leetcode-cn.com/problems/score-of-parentheses/
"""

class Solution:
    # 方法一: 栈
    # 初始化一个栈，默认里面有一个为0的元素，代表顶层的得分
    # 遍历字符串。并用last记录上一个遍历的字符。
    # 如果遍历到'('将0压入栈，代表这一层的得分暂时为0。
    # 如果遍历到')'，判断last:
        # 1. 如果last为'(', 那么就pop栈顶元素(即弹出子层)，并将弹出后的栈顶元素(即弹出的子层的父层)+1，代表这次遍历，为父层增加了1个得分。
        # 2. 如果last为')', 这是就需要先获取栈顶元素temp，然后再将其弹出，再然后为父层做贡献，即将刚刚栈顶元素temp乘以2，加到现在的栈顶元素上(即刚刚弹出元素的父层)
    # 最后，栈中唯一存留的一个元素，就是括号字符串的总得分

    # 40 ms	    69.39%
    # 13.7 MB   50%
    def scoreOfParentheses(self, S: str) -> int:
        stack = [0]
        last = ''
        for i in S:
            if i == '(':
                stack.append(0)
            else:
                if last == '(':
                    stack.pop()
                    stack[-1] += 1
                else:
                    temp = stack.pop()
                    stack[-1] += (temp * 2)
            last = i    
        return stack[-1]

if __name__ == "__main__":
    test = [
        '()',
        '()()',
        '(())',
        '(()(()))'
    ]
    su = Solution()
    for i in test:
        print(su.scoreOfParentheses(i))
