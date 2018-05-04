//
//  3Sum.swift
//
//  Created by Zhang, Wanming - (p) on 5/3/18.

/**
 * Question Link: https://leetcode.com/problems/3sum/description/
 * Steps:
 *  Sort the array.
 *  Substract 1st element from the sum to break down the problem into a 2 sum problem.
 *  Use two pointers to traverse through the array from front to end and from end to front.
 *  Remove duplicates.
 * Time Complexity: O(n^2), Space Complexity: O(nC3)
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
