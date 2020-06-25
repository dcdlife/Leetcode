"""
224. 基本计算器
困难
https://leetcode-cn.com/problems/basic-calculator/
"""

class Solution:
    def calculate(self, s: str) -> int:
        def innerCalculate(symbol, first, second) -> int:
            if symbol == '+':
                return first + second
            else:
                return first - second

        stack = []
        res = 0
        num = 0
        for i in s:
            if i == '+' or i == '-':
                if len(stack):
                    res = stack.pop()
                    res = innerCalculate(i, res, num)
                    print('1 res', res, num)
                    num = 0
                stack.append(res)
            elif i >= '0' and i <= '9':
                num = 10 * num + int(i)
        if len(stack):
            res = innerCalculate(stack[-1], res, num)
            print('2 res', res)
    
        return res

if __name__ == "__main__":
    su = Solution()

    test = [
        '1 + 1',
        '2-1 + 2',
        '(1+(4+5+2)-3)+(6+8)'
    ]
    for i in test:
        print(su.calculate(i))