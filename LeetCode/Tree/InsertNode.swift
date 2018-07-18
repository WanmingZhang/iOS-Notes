//
//  InsertNode.swift
//  Created by Zhang, Wanming - (p) on 7/18/18.

//Binary search tree: We start with a root node with value x, where the left subtree of x contains nodes with values < x and the right subtree contains nodes whose values are ≥ x. Each node follows the same rules with respect to nodes in their left and right subtrees.
//BSTs are of interest because they have operations which are favourably fast: insertion, look up, and deletion can all be done in O(log n) time.
/**
 * Insert node to a binary search tree.
 *
 **/

import Foundation

public class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    func insertNode(root: TreeNode?, value: Int) {
        if (root == nil) {
            root = TreeNode?.init(value)
        } else {
            
        }
    }
    
    
}
