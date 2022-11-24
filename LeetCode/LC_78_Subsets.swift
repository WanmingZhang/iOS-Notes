//
//  LC_78_Subsets.swift
//  
//
//  Created by wanming zhang on 11/24/22.
//

import Foundation

/**
 * Given an integer array nums of unique elements, return all possible subsets (the power set).

 * The solution set must not contain duplicate subsets. Return the solution in any order.

 * Example1:
 * Input: nums = [1,2,3]
 * Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
 *
 * Example2:
 * Input: nums = [0]
 * Output: [[],[0]]

 * 1 <= nums.length <= 10
 * -10 <= nums[i] <= 10
 * All the numbers of nums are unique.
 */

/**
 * Solution: Use backtracking/recursion to solve the problem.
 * in the for loop,  idx is branches starts with each element in the array
 * i is the curr position in each branch 
 */
 

    

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var curr = [Int]()
        powerSets(nums, 0, &curr, &res)
        return res
    }
    
    func powerSets(_ nums: [Int], _ idx: Int, _ curr: inout [Int],
                   _ res: inout [[Int]]) {

        if idx > nums.count {
            return
        }
        let copy = curr
        res.append(copy)
        
        for i in idx..<nums.count { // idx is branches starts with 1, 2, 3, etc.
            curr.append(nums[i]) // nums[i] is curr ele to be added
            print("curr = \(curr), i = \(i), idx = \(idx)")
            powerSets(nums, i+1, &curr, &res)
            curr.removeLast()
        }
    
    }
}
