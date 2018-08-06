//
//  SameTree.swift
//  Created by Zhang, Wanming - (p) on 7/18/18.
/**
 * Given two binary trees, write a function to check if they are the same or not.
 * Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
**/

/**
 Java solution
 
 // Definition for a binary tree node.
 public class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;
    TreeNode(int x) {
        val = x;
    }
 }
 
 class Solution {
    public boolean isSameTree(TreeNode p, TreeNode q) {
        if (p == null && q == null) {
            return true;
        } else if (p == null || q == null) {
            return false;
        } else { // both p and q are non-null
            return (p.val == q.val)
                && isSameTree(p.left, q.left)
                && isSameTree(p.right, q.right);
        }
    }
 }
**/

import Foundation

public class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
}

class sulution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if (p == nil && q == nil) {
            return true
        } else if (p == nil || q == nil) {
            return false
        } else {
            return p!.val == q!.val
                && isSameTree(p!.left, q!.left)
                && isSameTree(p!.right, q!.right)
        }
    }
}
