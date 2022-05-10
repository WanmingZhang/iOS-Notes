
import Foundation

// https://leetcode.com/problems/container-with-most-water/

/**
 You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

 Find two lines that together with the x-axis form a container, such that the container contains the most water.

 Return the maximum amount of water a container can store.

 Notice that you may not slant the container.
 
 Input: height = [1,8,6,2,5,4,8,3,7]
 Output: 49
 Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
 
 Input: height = [1,1]
 Output: 1
 */

/**
 * Solve the problem with 2 pointers, left (0) and right(count - 1)
 * Maintain a maxArea variable, compute maxArea dynamically
 * Move left and right pointers accordingly
 */


class Solution {
    func maxArea(_ height: [Int]) -> Int {
        if height.count <= 1 {
            return -1
        }
        
        var left = 0, right = height.count - 1
        var maxArea = 0
        while (left < right) {
            // compute area
            let minHeight = min(height[left], height[right])
            let area = minHeight * (right - left)
            if maxArea < area {
                maxArea = area
            }
            // move pointers
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return maxArea
    }
}
let arr1 = [1,1]
let sol = Solution()
sol.maxArea(arr1) // 1
