//
//  733_Day20Plan.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/8/15.
//

import Foundation

/*
 733. 图像渲染 (简单)
 https://leetcode-cn.com/problems/flood-fill/
 */

class Solution_733_Day20Plan {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let rows = image.count
        let cols = image[0].count
        
        var image = image
        let pixelVal = image[sr][sc]
        
        if pixelVal == newColor {
            return image
        }
        
        var queue = [(sr, sc)]
        while !queue.isEmpty {
            let head = queue.removeFirst()
            let x = head.0
            let y = head.1
            
            image[x][y] = newColor
            
            if y - 1 >= 0 && image[x][y - 1] == pixelVal {
                queue.append((x, y - 1))
            }
            if y + 1 < cols && image[x][y + 1] == pixelVal {
                queue.append((x, y + 1))
            }
            if x - 1 >= 0 && image[x - 1][y] == pixelVal {
                queue.append((x - 1, y))
            }
            if x + 1 < rows && image[x + 1][y] == pixelVal {
                queue.append((x + 1, y))
            }
        }
        
        return image
    }
    
    func test() {
        print(floodFill([[1,1,1], [1,1,0],[1,0,1]], 1, 1, 2))
    }
}
