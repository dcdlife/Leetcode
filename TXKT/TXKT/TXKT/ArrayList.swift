//
//  ArrayList.swift
//  TXKT
//
//  Created by 尹冲 on 2021/2/28.
//

import Foundation

class ArrayList {
    /// 元素数量
    var itemSize: Int
    /// 所有的元素
    var elements: [Int] = []
    
    let DEFAULT_CAPACITY: Int = 10
    let ELEMENT_NOT_FOUND: Int = -1
    
    init(capacity: Int = 10) {
        itemSize = (capacity < DEFAULT_CAPACITY) ? DEFAULT_CAPACITY : capacity
        elements = Array(repeating: 0, count: itemSize)
    }
    
    /// 元素的数量
    func size() -> Int {
        return self.itemSize
    }
    
    func isEmpty() -> Bool {
        return false
    }
}
