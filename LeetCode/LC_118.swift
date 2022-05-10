//
//  LC_118.swift
//  
//
//  Created by Zhang, Wanming on 5/9/22.
//

/**
 https://leetcode.com/problems/pascals-triangle/
 
 Given an integer numRows, return the first numRows of Pascal's triangle.

 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:
 
      1
     1 1
   1  2  1
 1     3      3      1
1    4     6      4     1
 
 */

import Foundation

class Solution {
    
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        if numRows <= 0 {
            return result
        }
        if numRows == 1 {
            return [[1]]
        }
        // numRows >= 2
        result.append([1])
        for i in 1..<numRows {
            var newRow = [1] // first 1
            let prevRow = result[i-1]
            for j in 1..<prevRow.count {
                let element = prevRow[j-1] + prevRow[j]
                newRow.append(element)
            }
            newRow.append(1) // last 1
            result.append(newRow)
        }
        return result
    }
}


let sol = Solution()
sol.generate(0)

