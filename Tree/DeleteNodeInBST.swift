//
//  DeleteNodeFromBST.swift
//  Created by Zhang, Wanming - (p) on 7/20/18.

/**
 * Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.
 * Basically, the deletion can be divided into two stages:
 * Search for a node to remove.
 * If the node is found, delete the node.
 * Note: Time complexity should be O(height of tree).
**/

// http://www.algolist.net/Data_structures/Binary_search_tree/Removal

/**
 * Java Solution
 /**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
 class Solution {
     public TreeNode deleteNode(TreeNode root, int key) {
         if (root == null) {
            return root;
         }
    
         if (key < root.val) {
            root.left = deleteNode(root.left, key);
         } else if (key > root.val) {
            root.right = deleteNode(root.right, key);
         } else { // key == root.val
             if (root.left == null && root.right == null) { // leat node
                root = null;
             } else if (root.left == null) {
                root = root.right;
             } else if (root.right == null) {
                root = root.left;
             } else { // 2 children
                int minRight = minValue(root.right);
                root.val = minRight;
                root.right = deleteNode(root.right, minRight);
             }
             return root;
          }
          return root;
     }
 
     public int minValue(TreeNode root) {
         while (root.left != null) {
            root = root.left;
         }
         return root.val;
     }
 }
**/
import Foundation

public class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ value: Int) {
        self.val = value
        self.left = nil
        self.right = nil
    }
}

public class Solution {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        if (root == nil) {
            return root
        }
    }
        
}
