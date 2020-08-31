"""
39. 组合总和 (中等)
https://leetcode-cn.com/problems/combination-sum/

给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。

candidates 中的数字可以无限制重复被选取。

说明：

所有数字（包括 target）都是正整数。
解集不能包含重复的组合。 
示例 1：

输入：candidates = [2,3,6,7], target = 7,
所求解集为：
[
  [7],
  [2,2,3]
]
示例 2：

输入：candidates = [2,3,5], target = 8,
所求解集为：
[
  [2,2,2,2],
  [2,3,3],
  [3,5]
]
 

提示：

1 <= candidates.length <= 30
1 <= candidates[i] <= 200
candidate 中的每个元素都是独一无二的。
1 <= target <= 500

"""

from typing import List

# 题解: https://leetcode-cn.com/problems/combination-sum/solution/hui-su-suan-fa-jian-zhi-python-dai-ma-java-dai-m-2/

class Solution:

    # 更简洁的代码
    # 执行用时：56 ms, 在所有 Python3 提交中击败了81.89%的用户
    # 内存消耗：13.9 MB, 在所有 Python3 提交中击败了13.33%的用户
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        length = len(candidates)
        if not length:
            return []

        # 先进行一次遍历，方便剪枝
        candidates.sort()

        ans = []

        def dfs(begin: int, used: list, remain: int):
            for i in range(begin, length):
                cur = candidates[i]
                # 如果剩余的数 == 当前遍历的数，增加一条结果
                if remain == cur:
                    ans.append(used + [cur])
                elif remain > cur:
                    dfs(i, used + [cur], remain - cur)
                else:
                    break

        dfs(0, [], target)

        return ans

    # 剪枝版。先进行一个排序，然后如果遍历到小于0的target便不再往后进行遍历。
    # 执行用时：44 ms, 在所有 Python3 提交中击败了99.28%的用户
    # 内存消耗：13.7 MB, 在所有 Python3 提交中击败了78.85%的用户
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        length = len(candidates)
        if not length:
            return []

        path = []
        res = []

        # 先进行排序，为了剪枝
        candidates.sort()

        def dfs(candidates: List[int], begin: int, length: int, target: int):
            # 当遇到target等于0，代表这条路径是合法的，记录到结果中。并不再往后遍历
            if target == 0:
                res.append(list(path))
                return

            # i为起始索引，然后递归再从i开始进行递归
            for i in range(begin, length):
                # 剪枝，target - candidates[i] < 0就没有遍历下去的必要了，因为越往后越大
                if target - candidates[i] < 0:
                    break

                path.append(candidates[i])
                dfs(candidates, i, length, target - candidates[i])
                path.pop()
                
        dfs(candidates, 0, length, target)

        return res

    # 未剪枝版
    # 执行用时：84 ms, 在所有 Python3 提交中击败了44.89%的用户
    # 内存消耗：13.7 MB, 在所有 Python3 提交中击败了60.41%的用户
    def combinationSum1(self, candidates: List[int], target: int) -> List[List[int]]:
        length = len(candidates)
        if not length:
            return []

        path = []
        res = []

        def dfs(candidates: List[int], begin: int, length: int, target: int):
            # 当遇到target小于0时，直接返回，不再往后遍历
            if target < 0:
                return
            
            # 当遇到target等于0，代表这条路径是合法的，记录到结果中。并不再往后遍历
            if target == 0:
                res.append(list(path))
                return

            # i为起始索引，然后递归再从i开始进行递归
            for i in range(begin, length):
                path.append(candidates[i])
                dfs(candidates, i, length, target - candidates[i])
                path.pop()
                
        dfs(candidates, 0, length, target)

        return res

    

if __name__ == "__main__":
    su = Solution()
    print(su.combinationSum([1,2,3,4], 3))
    print(su.combinationSum([2,3,6,7], 7))
