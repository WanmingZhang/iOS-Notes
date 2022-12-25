//
//  LC_286_WallsAndGates.swift
//  
//
//  Created by wanming zhang on 12/25/22.
//

/**
You are given a m x n 2D grid initialized with these three possible values.
-1 - A wall or an obstacle.
0 - A gate.
INF - Infinity means an empty room. We use the value 2^31 - 1 = 2147483647 to represent INF as you may assume that the distance to a gate is less than 2147483647.
Fill each empty room with the distance to its nearest gate. If it is impossible to reach a gate, it should be filled with INF.
*/
// INF  -1  0  INF
// INF INF INF  -1
// INF  -1 INF  -1
//   0  -1 INF INF

// 3  -1   0   1
// 2   2   1  -1
// 1  -1   2  -1
// 0  -1   3   4


class Solution {
    func wallsAndGates(_ grid: [[Int]]) -> [[Int]] {
        let rows = grid.count
        let cols = grid[0].count
        var visited = Set<[Int]>()
        var q = [[Int]]()

        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 0 {
                    q.append([i,j])
                }
            }
        }
        print("q = \(q)")
        var newGrid = grid
        var dis = 1
        while !q.isEmpty {
            for pos in q  {
                q.removeFirst()
                addToQueue(&newGrid, &q, &visited, pos, dis)
            }
            dis += 1
        }
        print("newGrid = \(newGrid)")
        return newGrid
    }

    func addToQueue(_ grid: inout [[Int]], _ q: inout [[Int]], _ visited: inout Set<[Int]>, _ pos: [Int], _ dis:Int) {
        let row = pos[0], col = pos[1]
        let up = [row-1, col]
        let down = [row+1, col]
        let left = [row, col-1]
        let right = [row, col+1]
        let adjacents = [up, down, left, right]
        for adjacent in adjacents {
            let newRow = adjacent[0]
            let newCol = adjacent[1]

            if newRow < 0 || newRow >= grid.count || newCol < 0
                || newCol >= grid[0].count || grid[newRow][newCol] == -1 || grid[newRow][newCol] == 0 || visited.contains([newRow, newCol]) {
                    continue
            }
            q.append([newRow, newCol])
            grid[newRow][newCol] = dis
            visited.insert([newRow, newCol])
        }
    }

}

let min = 2147483647
let grid = [
    [min, -1, 0, min],
    [min, min, min, -1],
    [min, -1, min, -1],
    [0, -1, min, min]
]

let sol = Solution()
let res = sol.wallsAndGates(grid)
print("res = \(res)")

