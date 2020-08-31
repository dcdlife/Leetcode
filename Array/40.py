"""
40. 组合总和 II (中等)
https://leetcode-cn.com/problems/combination-sum-ii/

给定一个数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。

candidates 中的每个数字在每个组合中只能使用一次。

说明：

所有数字（包括目标数）都是正整数。
解集不能包含重复的组合。 
示例 1:

输入: candidates = [10,1,2,7,6,1,5], target = 8,
所求解集为:
[
  [1, 7],
  [1, 2, 5],
  [2, 6],
  [1, 1, 6]
]
示例 2:

输入: candidates = [2,5,2,1,2], target = 5,
所求解集为:
[
  [1,2,2],
  [5]
]

"""

from typing import List

class Solution:

    # 排序剪枝
    # 执行用时：60 ms, 在所有 Python3 提交中击败了62.24%的用户
    # 内存消耗：13.7 MB, 在所有 Python3 提交中击败了78.51%的用户
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        if not candidates:
            return []

        length = len(candidates)
        candidates.sort()

        ans = []
        path = []
        def dfs(begin:int, length: int, target: int):
            if target == 0:
                ans.append(path[:])
                return

            for i in range(begin, length):
                cur = candidates[i]
                if cur > target:
                    return

                # 去重
                if i > begin and candidates[i - 1] == candidates[i]:
                    continue

                path.append(cur)
                dfs(i + 1, length, target - cur)
                path.pop()

        dfs(0, length, target)

        return ans
                
if __name__ == "__main__":
    su = Solution()

    print(su.combinationSum2([1,2,3,4], 3))
