//: 1.两数之和（简单）
//: https://leetcode-cn.com/problems/two-sum

/*
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 的那 两个 整数，并返回它们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

 你可以按任意顺序返回答案。
 
 示例 1：

 输入：nums = [2,7,11,15], target = 9
 输出：[0,1]
 解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。
 示例 2：

 输入：nums = [3,2,4], target = 6
 输出：[1,2]
 示例 3：

 输入：nums = [3,3], target = 6
 输出：[0,1]
  

 提示：

 2 <= nums.length <= 103
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 只会存在一个有效答案
 */

/*
 思路：利用一个哈希表（里面存放为 key：元素，value：元素索引），依次遍历数组元素，以目标值减去当前元素的值为key，
 在哈希表中查找，如果找到，返回[当前遍历元素的索引, 哈希表中目标值减去当前元素的值为key所对应的value]
 
 时间复杂度：O(n)。花费在依次遍历nums数组时
 空间复杂度：O(n)。创建的哈希表
 */
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: Dictionary<Int, Int> = [:]
        let count = nums.count
        for index1 in 0..<count {
            if let index2 = dict[target - nums[index1]] {
                return [index1, index2]
            }
            dict[nums[index1]] = index1
        }
        return []
    }
}

let su = Solution()
su.twoSum([2,7,11,15], 9)

