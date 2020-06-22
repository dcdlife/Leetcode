"""
67. 二进制求和
简单
https://leetcode-cn.com/problems/add-binary/
"""

class Solution:
    # 48 ms	    46.63%
    # 13.6 MB   6.25%
    def addBinary(self, a: str, b: str) -> str:
        if not a or a == '0':
            return b
        if not b or b == '0':
            return a
        
        res = []
        lengthA = len(a)
        lengthB = len(b)
        if lengthA > lengthB:
            b = ('0' * (lengthA - lengthB)) + b
        elif lengthB > lengthA:
            a = ('0' * (lengthB - lengthA)) + a
        
        needCarry = 0
        for i in range(len(a) - 1, -1, -1):
            first = int(a[i])
            second = int(b[i])
            result = first + second + needCarry

            if result == 3:
                res.insert(0, '1')
                needCarry = 1
            elif result == 2:
                res.insert(0, '0')
                needCarry = 1
            else:
                needCarry = 0
                res.insert(0, str(result))
        if needCarry:
            res.insert(0, '1')

        return ''.join(res)


if __name__ == "__main__":
    su = Solution()
    print(su.addBinary('111', '111'))
    print(su.addBinary('11', '1'))
    print(su.addBinary('100', '1'))
    print(su.addBinary('1', '100'))


        