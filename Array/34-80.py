"""
80. 删除排序数组中的重复项 II
https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array-ii/

给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素最多出现两次，返回移除后数组的新长度。

不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。

示例 1:

给定 nums = [1,1,1,2,2,3],

函数应返回新长度 length = 5, 并且原数组的前五个元素被修改为 1, 1, 2, 2, 3 。

你不需要考虑数组中超出新长度后面的元素。
示例 2:

给定 nums = [0,0,1,1,1,1,2,3,3],

函数应返回新长度 length = 7, 并且原数组的前五个元素被修改为 0, 0, 1, 1, 2, 3, 3 。

你不需要考虑数组中超出新长度后面的元素。
说明:

为什么返回数值是整数，但输出的答案是数组呢?

请注意，输入数组是以“引用”方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。

你可以想象内部操作如下:

// nums 是以“引用”方式传递的。也就是说，不对实参做任何拷贝
int len = removeDuplicates(nums);

// 在函数里修改输入数组对于调用者是可见的。
// 根据你的函数返回的长度, 它会打印出数组中该长度范围内的所有元素。
for (int i = 0; i < len; i++) {
    print(nums[i]);
}

"""

from typing import List

class Solution:
    # 更优美的方法
    def removeDuplicates1(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        
        # Initialize the counter and the second pointer.
        j, count = 1, 1
        
        # Start from the second element of the array and process
        # elements one by one.
        for i in range(1, len(nums)):
            
            # If the current element is a duplicate, 
            # increment the count.
            if nums[i] == nums[i - 1]:
                count += 1
            else:
                # Reset the count since we encountered a different element
                # than the previous one
                count = 1
            
            # For a count <= 2, we copy the element over thus
            # overwriting the element at index "j" in the array
            if count <= 2:
                nums[j] = nums[i]
                j += 1
                
        return j

    # 单次循环。覆盖多余的重复项
    # 复杂度: 时间O(n), 空间O(1)
    # 执行用时：52 ms, 在所有 Python3 提交中击败了20.37%的用户
    # 内存消耗：13.3 MB, 在所有 Python3 提交中击败了76.92%的用户
    def removeDuplicates(self, nums: List[int]) -> int:
        if not nums:
            return 0
        n = len(nums)
        nextIndex = 1
        cur = nums[0]
        times = 1
        for i in nums[1:]:
            if i == cur and times == 1:
                times += 2
                nums[nextIndex] = cur # 提交是遗漏此行代码。第二次出现的值应该放到下一个索引的位置
                nextIndex += 1
            elif i != cur:
                cur = i
                nums[nextIndex] = cur
                times = 1
                nextIndex += 1
        return nextIndex

if __name__ == "__main__":
    su = Solution()
    print(su.removeDuplicates([0]))
    print(su.removeDuplicates([0,0]))
    print(su.removeDuplicates([0,0,0]))
    print(su.removeDuplicates([0,1]))
    print(su.removeDuplicates([0,0,1,1]))
    print(su.removeDuplicates([0,0,1,1,1,1,2,3,3]))
