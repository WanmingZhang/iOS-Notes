//
//  BinaryTreeTilt.swift
//  
//
//  Created by Zhang, Wanming - (p) on 7/26/18.
//
/**
Given a binary tree, return the tilt of the whole tree.

The tilt of a tree node is defined as the absolute difference between the sum of all left subtree node values and the sum of all right subtree node values. Null node has tilt 0.

The tilt of the whole tree is defined as the sum of all nodes' tilt.

 Input:
      1
    /   \
   2     3
 Output: 1
 Explanation:
 Tilt of node 2 : 0
 Tilt of node 3 : 0
 Tilt of node 1 : |2-3| = 1
 Tilt of binary tree : 0 + 0 + 1 = 1
**/

import Foundation
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ value:Int) {
        self.val = value
        self.left = nil
        self.right = nil
    }
}
class Solution {
    var tilt = 0
    func findTilt(_ root: TreeNode?) -> Int {
        treeSum(root)
        return tilt
    }
    
    func treeSum(_ root: TreeNode?) -> Int {
        if (root == nil) {
            return 0
        }
        var leftSum = treeSum(root!.left)
        var rightSum = treeSum(root!.right)
        tilt += abs(leftSum - rightSum)
        return leftSum + rightSum + root!.val
    }
}
