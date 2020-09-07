"""
1. 两数之和 (简单)

给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。

示例:

给定 nums = [2, 7, 11, 15], target = 9

因为 nums[0] + nums[1] = 2 + 7 = 9
所以返回 [0, 1]

"""

class Solution:
    # 终极：一遍哈希表
    # 执行用时：72 ms, 在所有 Python3 提交中击败了59.92%的用户
    # 内存消耗：15.1 MB, 在所有 Python3 提交中击败了39.03%的用户
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        hashmap = {}
        for index, num in enumerate(nums):
            another_index = hashmap.get(target - num)
            if another_index != None:
                return [index, another_index]
            hashmap[num] = index
        return []

    # 两遍哈希表优化
    # 执行用时：60 ms, 在所有 Python3 提交中击败了92.02%的用户
    # 内存消耗：15.6 MB, 在所有 Python3 提交中击败了9.13%的用户
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        hashmap = {}
        for index, num in enumerate(nums):
            hashmap[num] = index
        for i, num in enumerate(nums):
            j = hashmap.get(target - num)
            if j != None and i != j:
                return [i, j]


    # 两遍哈希表
    # 执行用时：68 ms, 在所有 Python3 提交中击败了70.58%的用户
    # 内存消耗：15.7 MB, 在所有 Python3 提交中击败了7.45%的用户
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        length = len(nums)
        sumDict = {}
        for i in range(length): 
            sumDict[nums[i]] = i
        for first in range(length):
            second = sumDict.get(target - nums[first])
            if second != None and first != second:
                return [first, second]
        return []

    # 暴力法
    # 执行用时：5828 ms, 在所有 Python3 提交中击败了20.02%的用户
    # 内存消耗：14.5 MB, 在所有 Python3 提交中击败了94.92%的用户
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        length = len(nums)
        for i in range(0, length - 1):
            for j in range(i + 1, length):
                if nums[i] + nums[j] == target:
                    return [i, j]
        return []
