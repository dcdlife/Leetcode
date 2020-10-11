"""
79. 单词搜索 (中等)
https://leetcode-cn.com/problems/word-search/

给定一个二维网格和一个单词，找出该单词是否存在于网格中。

单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。

示例:

board =
[
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]

给定 word = "ABCCED", 返回 true
给定 word = "SEE", 返回 true
给定 word = "ABCB", 返回 false
 

提示：

board 和 word 中只包含大写和小写英文字母。
1 <= board.length <= 200
1 <= board[i].length <= 200
1 <= word.length <= 10^3

"""

from typing import List

class Solution:
    # 使用递归。创建标记数组，遍历过就标记为True，递归结束后，重置当前标记。根据中心点，依次向四个方向递归求解。
    # 复杂度: 
    # 时间复杂度：
        # 一个非常宽松的上界为 O(MN \cdot 3^L)O(MN⋅3 L )，其中 M, NM,N 为网格的长度与宽度，LL 为字符串 \text{word}word 的长度。
        # 在每次调用函数 \text{check}check 时，除了第一次可以进入 44 个分支以外，其余时间我们最多会进入 33 个分支（因为每个位置只能使用一次，所以走过来的分支没法走回去）。
        # 由于单词长为 LL，故 \text{check(i, j, 0)}check(i, j, 0) 的时间复杂度为 O(3^L)O(3 L )，而我们要执行 O(MN)O(MN) 次检查。
        # 然而，由于剪枝的存在，我们在遇到不匹配或已访问的字符时会提前退出，终止递归流程。因此，实际的时间复杂度会远远小于 \Theta(MN \cdot 3^L)Θ(MN⋅3 L )。, 
    # 空间: O(mn)
    # 执行用时：280 ms, 在所有 Python3 提交中击败了32.40%的用户
    # 内存消耗：16.3 MB, 在所有 Python3 提交中击败了6.81%的用户
    def exist(self, board: List[List[str]], word: str) -> bool:
        if not board or not board[0]:
            return False
        visits = [[False] * len(board[0]) for _ in range(len(board))]
        def findNext(row: int, col: int, word: str) -> bool:
            if not word:
                return True
            top = None if row - 1 < 0 else (row - 1, col)
            bottom = None if row + 1 > len(board) - 1 else (row + 1, col)
            left = None if col - 1 < 0 else (row, col - 1)
            right = None if col + 1 > len(board[0]) - 1 else (row, col + 1)
            def innerFindNext(x: int, y: int, word: str) -> bool:
                if word[0] == board[x][y] and not visits[x][y]:
                    visits[x][y] = True
                    if findNext(x, y, word[1:]):
                        return True
                    visits[x][y] = False
                return False
            if top:
                x, y = top[0], top[1]
                if innerFindNext(x, y, word):
                    return True
            if bottom:
                x, y = bottom[0], bottom[1]
                if innerFindNext(x, y, word):
                    return True
            if left:
                x, y = left[0], left[1]
                if innerFindNext(x, y, word):
                    return True
            if right:
                x, y = right[0], right[1]
                if innerFindNext(x, y, word):
                    return True
            return False
        for i in range(len(board)):
            for j in range(len(board[0])):
                if board[i][j] == word[0]:
                    visits[i][j] = True
                    if findNext(i,j, word[1:]):
                        return True
                    visits[i][j] = False
        return False

if __name__ == "__main__":
    su = Solution()
    print(su.exist(
        [
            ['A','B','C','E'],
            ['S','F','C','S'],
            ['A','D','E','E']
        ],
        "ABCCED"
    ))
    print(su.exist(
        [
            ['A','B','C','E'],
            ['S','F','C','S'],
            ['A','D','E','E']
        ],
        "SEE"
    ))
    print(su.exist(
        [
            ['A','B','C','E'],
            ['S','F','C','S'],
            ['A','D','E','E']
        ],
        "ABCB"
    ))
