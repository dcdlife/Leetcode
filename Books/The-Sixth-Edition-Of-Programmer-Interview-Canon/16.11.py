"""
面试题 16.11. 跳水板
简单
https://leetcode-cn.com/problems/diving-board-lcci/
"""

from typing import List

class Solution:
    # 方法一: 先算所有都是最短的，然后依次减去一个短的，加上一个长的。但是注意k为0和（短木板和长木板相等的情况）

    # 80 ms	    62.37%
    # 17.7 MB   100.00%
    def divingBoard(self, shorter: int, longer: int, k: int) -> List[int]:
        if k == 0:
            return []
        if shorter == longer:
            return [shorter * k]
        res = []
        minLength = shorter * k
        res.append(minLength)
        last = minLength
        for i in range(k):
            last -= shorter
            last += longer
            res.append(last)
        return res


