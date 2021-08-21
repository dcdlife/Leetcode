//
//  146.lru-cache.swift
//  Leetcode-Swift
//
//  Created by devshiye on 2021/4/23.
//

import Foundation

/*
 146. LRU 缓存机制 (中等)
 https://leetcode-cn.com/problems/lru-cache/
 */

class Solution146 {
     class LRUCache {
         class DLinkedNode {
            var key: Int
            var value: Int
            var next: DLinkedNode?
            var prev: DLinkedNode?
            init() {
                self.key = 0
                self.value = 0
                self.next = nil
                self.prev = nil
            }
            init(_ key: Int, _ value: Int) {
                self.key = key
                self.value = value
                self.next = nil;
                self.prev = nil
            }
        }
        
        var head: DLinkedNode? = nil
        var tail: DLinkedNode? = nil
        var size: Int = 0
        var capacity: Int = 0
        var cache: [Int: DLinkedNode]

        init(_ capacity: Int) {
            self.capacity = capacity
            head = DLinkedNode()
            tail = DLinkedNode()
            head?.next = tail
            tail?.next = head
            cache = [Int: DLinkedNode]()
        }
        
        func get(_ key: Int) -> Int {
            guard let node = cache[key] else {
                return -1
            }
            moveToHead(node)
            return node.value
        }
        
        func put(_ key: Int, _ value: Int) {
            if let node = cache[key] {
                node.value = value
                moveToHead(node)
            } else {
                let node = DLinkedNode(key, value)
                cache[key] = node
                addToHead(node)
                size += 1
                if size > capacity {
                    let node = removeTail()
                    cache[node.key] = nil
                    size -= 1
                }
            }
        }
        
        func moveToHead(_ node: DLinkedNode) {
            removeNode(node)
            addToHead(node)
        }
        
        func addToHead(_ node: DLinkedNode) {
            node.prev = head
            node.next = head?.next
            head?.next?.prev = node
            head?.next = node
        }
        
        func removeNode(_ node: DLinkedNode) {
            node.next?.prev = node.prev
            node.prev?.next = node.next
        }
        
        func removeTail() -> DLinkedNode {
            let tailNode = tail!.prev!
            removeNode(tailNode)
            return tailNode
        }
    }

    /**
     * Your LRUCache object will be instantiated and called as such:
     * let obj = LRUCache(capacity)
     * let ret_1: Int = obj.get(key)
     * obj.put(key, value)
     */
    
    /*
     测试用例：
     1.
     */
    func test() {
        let obj = LRUCache(2)
        obj.put(1, 1)
        obj.put(2, 2)
        print(obj.get(1))
        obj.put(3, 3)
        print(obj.get(2))
        obj.put(4, 4)
        print(obj.get(1))
        print(obj.get(3))
        print(obj.get(4))
    }
}
