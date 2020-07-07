"""
32. 最长有效括号
困难
https://leetcode-cn.com/problems/longest-valid-parentheses/
"""

class Solution:
    def longestValidParentheses(self, s: str) -> int:
        stack = []
        dp = []
        zeroIndex = -1
        last = ''
        for index in range(len(s)):
            i = s[index]
            if i == '(':
                dp.append(0)
                zeroIndex += 1
                stack.append(zeroIndex)
            else:
                if len(stack):
                    dp[stack[-1]] = 2
                    stack.pop()
                else:
                    if last == ')' or last == '':
                        dp.append(-1)
                        zeroIndex += 1
            last = i
        res = 0
        temp = 0
        for i in dp:
            if i != 2:
                res = max(res, temp)
                temp = 0
            else:
                temp += i
        res = max(temp, res)
        return res

if __name__ == "__main__":
    su = Solution()
    test = [
        ")()())()()("
        "(()())", # 6
        "(()()", # 4
        "()(())", # 6
        ")()())", # 4
        '(()', # 2
        ')()())', # 4
        '()()()', # 6
        '()', # 2
        '(',
        ')',
        ')((()))()', # 8
        "()(()", # 2
        '((()(()' # 2
    ]
    for i in test:
        print(su.longestValidParentheses(i))
                

# "(()"
# "(()"
# ")()())"
# "()()()"
# "()"
# "("
# ")"
# ")((()))()"
# "()(()"
# ")()())"
# "()(())"
# "(()()"
# "(()())"
# ")()())()()("


