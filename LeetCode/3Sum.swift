//
//  3Sum.swift
//
//  Created by Zhang, Wanming - (p) on 5/3/18.

/**
 * Question Link: https://leetcode.com/problems/3sum/description/
 
 This problem is an extention of Two Sum where instead of looking for 2 numbers, we are looking for 3.

 The most naive apporach is to iterate through all possibilities of number triplets with 3 nested for loops. But what makes this difficult is that we can not have duplicate triplets, which means along with the 3 nested loops already taking O(n^3) time, we have to find a way to check if the triplet has already been found, slowing down the code even further.

 The best apporach here is to treat this problem similarly to Problem 167 - Two Sum II - Input Array is Sorted. We can start by sorting the array (you will see why in a second). Start by putting 1 pointer, say i at the start of the array. Since we are looking for a sum of 0, we can instead use the remainder of the array (from i + 1 to nums.length - 1) to find two numbers with a sum of-nums[i], essentially reducing the problem to Two Sum II. Then we create 2 new pointers, left starting at i+1, and right starting at nums.length - 1.

 The Two Sum II portion of this problem does have to be treated differently as we can not use duplicate triplets. In Two Sum II, if the sum of nums[left] and nums[right] was not equal to the target, then we would just increment/decrement one of the pointer accordingly. But in this case, doing so could result in duplicates. The reason for sorting the array to begin with is so that instead of just incrementing/decrementing the pointer by 1, we increment/decrement until we find a new number, ensuring we do not use a duplicate.

 After the Two Sum portion, to ensure we do not find more duplicates again, we have to set i to a new value. The code would look like:
 */


import Foundation

public class ThreeSum {
    let num0 = [0]
    let num1 = [0,0,0]
    let num2 = [0,0,0,0]
    let num4 = [-1, 0, 1, 2, -1, -4]
    let num5 = [-1,-1,-1,0,0,0,1,1,1,-2,-2,-2,-4,-4,-4,2,2,2]
    
    func threeSum(_ nums:[Int]) -> [[Int]] {
        var res = [[Int]]()
        if nums.count <= 2 {
            return res
        }
        var sorted = nums
        sorted = sorted.sorted(by: <)
        
        for i in 0..<sorted.count - 2 {
            if (i > 0 && sorted[i] == sorted[i-1]) {
                continue // remove duplicates
            }
            var start = i + 1
            var end = sorted.count - 1
            let target = 0 - sorted[i]
            
            while (start < end) {
                if (sorted[start] + sorted[end] == target) {
                    let element = [sorted[i], sorted[start], sorted[end]]
                    res.append(element)
                    // remove duplicates
                    while (start < end && sorted[start] == sorted[start+1]) {
                        start += 1
                    }
                    while (start < end && sorted[end] == sorted[end-1]) {
                        end -= 1
                    }
                    start += 1
                    end -= 1
                } else if (sorted[start] + sorted[end] < target) {
                    start += 1
                } else {
                    end -= 1
                }
            }
        }
        return res
    }
}
