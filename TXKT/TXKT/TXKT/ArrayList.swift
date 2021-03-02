//
//  ArrayList.swift
//  TXKT
//
//  Created by 尹冲 on 2021/2/28.
//

import Foundation

/*
 ◼ int size(); // 元素的数量
 ◼ boolean isEmpty(); // 是否为空
 ◼ boolean contains(E element); // 是否包含某个元素
 ◼ void add(E element); // 添加元素到最后面
 ◼ void add(int index, E element) // 在index位置插入一个元素
 ◼ E get(int index); // 返回index位置对应的元素
 ◼ E set(int index, E element); // 设置index位置的元素
 ◼ void add(int index, E element); // 往index位置添加元素
 ◼ E remove(int index); // 删除index位置对应的元素
 ◼ int indexOf(E element); // 查看元素的位置
 ◼ void clear(); // 清除所有元素
 */

class ArrayList {
    /// 元素数量
    var itemSize: Int
    /// 所有的元素
    var elements: [Int] = []
    
    let DEFAULT_CAPACITY: Int = 10
    let ELEMENT_NOT_FOUND: Int = -1
    
    init(capacity: Int = 10) {
        itemSize = 0
        elements = Array(repeating: 0, count: (capacity < DEFAULT_CAPACITY) ? DEFAULT_CAPACITY : capacity)
    }
    
    /// 元素的数量
    func size() -> Int {
        return self.itemSize
    }
    
    /// 是否为空
    func isEmpty() -> Bool {
        return itemSize == 0
    }
    
    /// 是否包含某个元素
    func contains(_ e: Int) -> Bool {
        return indexOf(e) != ELEMENT_NOT_FOUND
    }
    
    /// 添加元素到最后面
    func add(_ e: Int) {
        add(itemSize, e)
    }
    
    /// 在index位置插入一个元素
    func add(_ index: Int, _ e: Int) {
        if !rangeCheckForAdd(index) {
            return
        }
        ensureCapacity(itemSize + 1)
        for i in stride(from:itemSize, through:index + 1, by: -1) {
            elements[i] =  elements[i - 1]
        }
        elements[index] = e
        itemSize += 1
    }
    
    /// 返回index位置对应的元素
    func get(_ index: Int) -> Int? {
        if !rangeCheck(index) {
            return nil
        }
        return elements[index]
    }
    
    /// 设置index位置的元素
    func set(_ index: Int, _ e: Int) -> Int? {
        if !rangeCheck(index) {
            return nil
        }
        let old = elements[index]
        elements[index] = e
        return old
    }
    
    /// 删除index位置对应的元素（思考：最后一个元素如何处理？）
    func remove(_ index: Int) -> Int? {
        if !rangeCheck(index) {
            return nil
        }
        let old = elements[index]
        for i in (index + 1)..<itemSize {
            elements[i - 1] = elements[i]
        }
        itemSize -= 1
        return old
    }
    
    /// 查看元素的位置
    func indexOf(_ e: Int) -> Int {
        for i in 0..<elements.count {
            if elements[i] == e {
                return i
            }
        }
        return ELEMENT_NOT_FOUND
    }
    
    /// 清除所有的元素
    func clear() {
        /// 如果元素是对象，需要打开下面的代码
//        for i in 0..<itemSize {
//            elements[i] = nil
//        }
        itemSize = 0
    }
    
    func rangeCheck(_ index: Int) -> Bool {
        if (index < 0 || index >= itemSize) {
            if itemSize == 0 {
                print("当前没有任何元素")
            } else {
                print("越界了，范围应该是[0,\(itemSize - 1)]")
            }
            return false
        }
        return true
    }
    
    func rangeCheckForAdd(_ index: Int) -> Bool {
        if (index < 0 || index > itemSize) {
            print("\(index)越界了，范围应该是[0,\(itemSize)]")
//            enum ArrayListError: Error {
//                case outOfBoundss(Int, Int)
//            }
//            throw ArrayListError.outOfBoundss(index, itemSize)
            return false
        }
        return true
    }
    
    func ensureCapacity(_ capacity: Int) {
        let curCapacity = elements.count
        if curCapacity >= capacity {
            return
        }
        // 新容量为旧容量的1.5倍
        let newCapacity = curCapacity + curCapacity >> 1
        var newElements: [Int] = Array(repeating: 0, count: newCapacity)
        for i in 0..<itemSize {
            newElements[i] = elements[i]
        }
        elements = newElements
        print("ArrayList：从\(curCapacity)扩容到\(newCapacity)")
    }
}
