"""
44. 通配符匹配
困难
https://leetcode-cn.com/problems/wildcard-matching/
"""

import YCUtil

class Solution:
    # 递归方法超时

    # 超时 1
    # "aaabbbaabaaaaababaabaaabbabbbbbbbbaabababbabbbaaaaba"
    # "a*******b"
    # 超时 2
    # "babbbbaabababaabbababaababaabbaabababbaaababbababaaaaaabbabaaaabababbabbababbbaaaababbbabbbbbbbbbbaabbb"
    # "b**bb**a**bba*b**a*bbb**aba***babbb*aa****aabb*bbb***a"

    def isMatch1(self, s: str, p: str) -> bool:
        length_s = len(s)
        length_p = len(p)
        if length_s == 0 and length_p == 0:
            return True
        elif length_s == 0:
            for i in p:
                if i == '?' or (i >= 'a' and i <= 'z'):
                    return False
            return True
        elif length_p == 0:
            return False

        firstPatternChar = p[0]
        if firstPatternChar == '?':
            return self.isMatch(s[1:], p[1:])
        elif firstPatternChar == '*': # 优化，如果*后面都是*可以直接忽略掉后面的左右挨着的*
            p_begin_index = 1
            while p_begin_index < length_p and p[p_begin_index] == '*':
                p_begin_index += 1
            index = 0
            while index <= length_s:
                if (self.isMatch(s[index:], p[p_begin_index:])):
                    return True
                else:
                    index += 1
            return False
        else:
            if firstPatternChar == s[0]:
                return self.isMatch(s[1:], p[1:])
            else:
                return False

    # 方法二：使用动态规划
    def isMatch(self, s: str, p: str) -> bool:
        m, n = len(s), len(p)

        dp = [[False] * (n + 1) for _ in range(m + 1)]
        dp[0][0] = True
        for i in range(1, n + 1):
            if p[i - 1] == '*':
                dp[0][i] = True
            else:
                break
        
        for i in range(1, m + 1):
            for j in range(1, n + 1):
                if p[j - 1] == '*':
                    dp[i][j] = dp[i][j - 1] | dp[i - 1][j]
                elif p[j - 1] == '?' or s[i - 1] == p[j - 1]:
                    dp[i][j] = dp[i - 1][j - 1]
                
        return dp[m][n]


if __name__ == "__main__":
    su = Solution()
    lines = YCUtil.readlines()
    for index in range(0, len(lines), 2):
        s = lines[index]
        p = lines[index + 1]
        print(s, p, su.isMatch(s, p))
        # break
        



# 测试用例
# "aa"
# "*"
# "acdcb"
# "a*c?b"
# ""
# "**"
# ""
# ""
# ""
# "sa"
# "sdf"
# ""
# "aa"
# "a"
# "aa"
# "*"
# "adceb"
# "*a*b"
# "cb"
# "?a"
# "aaabbbaabaaaaababaabaaabbabbbbbbbbaabababbabbbaaaaba"
# "a*******b"
