"""
66. 加一
简单
https://leetcode-cn.com/problems/plus-one/
"""

from typing import List

class Solution:
    # 方法一: 从后往前遍历，然后依次相加，如果大于10就进位，最后遍历完后，再判断是否有进位。
    # 如果有就在索引0处插入1.

    # 48 ms	    21.58%
    # 13.7 MB   6.82%

    def plusOne(self, digits: List[int]) -> List[int]:
        carry = 1
        for i in range(len(digits) - 1, -1, -1):
            res = digits[i] + carry
            carry = 0
            if res < 10:
                digits[i] = res
                break
            else:
                carry = 1
                digits[i] = res - 10
        if carry == 1:
            digits.insert(0, 1)
        return digits

if __name__ == "__main__":
    su = Solution()
    test = [
        [8],
        [9],
        [4,3,2,1],
        [1,2,3],
        [9,9,9]
    ]
    for i in test:
        print(su.plusOne(i))
        
