//
//  InsertIntoABST.swift
//  
//
//  Created by Zhang, Wanming - (p) on 8/3/18.

/**
  * Given the root node of a binary search tree (BST) and a value to be inserted into the tree, insert the value into the BST. Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.
  * Note that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. You can return any of them.
**/

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */

/**
class Solution {
    public TreeNode insertIntoBST(TreeNode root, int val) {
    if (root == null) {
    return new TreeNode(val);
    } else {
    if (val < root.val) {
    root.left = insertIntoBST(root.left, val);
    } else {
    root.right = insertIntoBST(root.right, val);
    }
    return root;
    }
    }
}
**/

public class TreeNode {
    var val : Int
    var left : TreeNode?
    var right : TreeNode?
    
    init(_ val : Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

public class Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var node = root
        return insertIntoABST(&node, val)
    }
    
    func insertIntoABST(_ node: inout TreeNode?, _ val: Int) -> TreeNode? {
        if node == nil {
            return node
        }
        
        if (val < node!.val) {
            node!.left = insertIntoABST(&node!.left, val)
        } else {
            node!.right = insertIntoABST(&node!.right, val)
        }
        return node
    }
}
