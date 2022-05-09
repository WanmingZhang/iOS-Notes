
import Foundation

// https://leetcode.com/problems/move-zeroes/
/**
 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Note that you must do this in-place without making a copy of the array.
 
 Example 1:
 Input: nums = [0,1,0,3,12]
 Output: [1,3,12,0,0]
 
 Example 2:
 Input: nums = [0]
 Output: [0]
 */

/**
// 1. check length of the array,  if is empty array or only 1 element, return
// 2. 2 pointers, left and right, starts from zero, traverse throught the array,
// 3.  right pointer checks for 1st non-zero element (if zero, continue), left pointer follows
// 4.  left pointer points to 1st zero element
// 5. when right pointer reaches 1st non-zero element, swap values of left and right
// 6. after swapping, increment both left and right pointers by 1
// 7. repeat until right pointer reaches the end of the array
 */

// If change the problem to move all the zeros to the beginning of the array, traverse from end to beginning


class Solution {
    func moveZeros(_ nums: inout [Int]) {
        if nums.count <= 1 {
            return
        }
        var i = 0, j = 0
        while i < nums.count {
            if nums[i] == 0 {
                i += 1
            } else {
                let temp = nums[j]
                nums[j] = nums[i]
                nums[i] = temp
                
                i += 1
                j += 1
            }
        }
    }
}

let sol = Solution()
var arr1 = [0,1,0,3,12]
sol.moveZeros(&arr1)
print(arr1)

var arr2 = [0]
sol.moveZeros(&arr2)
print(arr2)


var arr3 = [1, 0, 0, 3, 0, 12]
sol.moveZeros(&arr3)
print(arr3)
