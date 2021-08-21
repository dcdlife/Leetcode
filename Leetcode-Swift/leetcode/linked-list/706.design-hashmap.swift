//
//  706.design-hashmap.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/7/3.
//

import Foundation

/*
 706. 设计哈希映射 (简单)
 https://leetcode-cn.com/problems/design-hashmap/
 */

class Solution_706 {
    class MyHashMap {

        class LinkNode {
            var val: Int
            var key: Int
            var next: LinkNode?
            init(_ key: Int, _ val: Int) {
                self.key = key
                self.val = val
            }
        }
        
        var data: [LinkNode?] = [LinkNode?](repeating: nil, count: 100)
        /** Initialize your data structure here. */
        init() {
            
        }
        
        /** value will always be non-negative. */
        func put(_ key: Int, _ value: Int) {
            let index = key % 100
            let head = data[index]
            let node = LinkNode(key, value)
            if head == nil {
                data[index] = node
            } else {
                var pre = head
                var end = head
                while end != nil {
                    if end?.key == key {
                        end?.val = value
                        return
                    }
                    pre = end
                    end = end?.next
                }
                pre?.next = node
            }
        }
        
        /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
        func get(_ key: Int) -> Int {
            let index = key % 100
            let head = data[index]
            var node = head
            while node != nil {
                if node!.key == key {
                    return node!.val
                }
                node = node?.next
            }
            return -1
        }
        
        /** Removes the mapping of the specified value key if this map contains a mapping for the key */
        func remove(_ key: Int) {
            let index = key % 100
            let head = data[index]
            if head?.key == key {
                data[index] = head?.next
            }
            var pre = head
            while pre?.next != nil {
                let next = pre?.next
                if next!.key == key {
                    pre?.next = pre?.next?.next
                    return
                }
                pre = pre?.next
            }
        }
    }

    func test() {
        print("fda")
        
        
        /**
         * Your MyHashMap object will be instantiated and called as such:
         * let obj = MyHashMap()
         * obj.put(key, value)
         * let ret_2: Int = obj.get(key)
         * obj.remove(key)
         */
    }
}
