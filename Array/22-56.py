"""
56. 合并区间 (中等)
https://leetcode-cn.com/problems/merge-intervals/

给出一个区间的集合，请合并所有重叠的区间。

示例 1:

输入: intervals = [[1,3],[2,6],[8,10],[15,18]]
输出: [[1,6],[8,10],[15,18]]
解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
示例 2:

输入: intervals = [[1,4],[4,5]]
输出: [[1,5]]
解释: 区间 [1,4] 和 [4,5] 可被视为重叠区间。
注意：输入类型已于2019年4月15日更改。 请重置默认代码定义以获取新方法签名。

提示：

intervals[i][0] <= intervals[i][1]
"""

from typing import List

class Solution:

    # 官方精简版：先排序，再合并
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        intervals.sort(key=lambda x: x[0])

        merged = []
        for interval in intervals:
            # 如果列表为空，或者当前区间与上一区间不重合，直接添加
            if not merged or merged[-1][1] < interval[0]:
                merged.append(interval)
            else:
                # 否则的话，我们就可以与上一区间进行合并
                merged[-1][1] = max(merged[-1][1], interval[1])

        return merged

    # 先排序，再合并
    # 复杂度: 时间(O(nlogn))，空间O(logn)
    # 执行用时：56 ms, 在所有 Python3 提交中击败了44.47%的用户
    # 内存消耗：14.3 MB, 在所有 Python3 提交中击败了43.15%的用户
    def merge1(self, intervals: List[List[int]]) -> List[List[int]]:
        if not intervals or not intervals[0]:
            return []

        intervals.sort()
        size = len(intervals)
        res = [intervals[0]]
        for i in range(1, size):
            firstBegin, firstEnd = res[-1][0], res[-1][1]
            secondBegin, secondEnd = intervals[i][0], intervals[i][1]
            if firstEnd < secondBegin or secondEnd < firstBegin:
                res.append(intervals[i])
            else:
                res[-1] = [min(secondBegin, firstBegin), max(secondEnd, firstEnd)]
                
        return res

if __name__ == "__main__":
    su = Solution()
    print(su.merge([[2,3],[4,5],[6,7],[8,9],[1,10]]))
    # print(su.merge([[2,6],[1,3],[15,18],[8,10]]))
    # print(su.merge([[1,4],[4,5]]))
    # print(su.merge([[1,4],[0,4]]))
    # 出错用例 [[1,4],[0,4]]