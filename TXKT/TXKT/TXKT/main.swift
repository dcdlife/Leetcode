//
//  main.swift
//  TXKT
//
//  Created by 尹冲 on 2021/2/28.
//

import Foundation

let list = ArrayList(capacity: 5)
print(list.elements)
print(list.size())
print(list.isEmpty())
list.add(10)
list.add(11)
print(list.elements)
print(list.size())
print(list.isEmpty())
print(list.contains(10), list.contains(11), list.contains(12))
list.add(0, 999)
print(list.elements, list.size())
print(list.get(0)!, list.get(1)!, list.get(2)!)
print(list.set(0, 999999999)!)
print(list.get(0)!, list.get(1)!, list.get(2)!)
print(list.indexOf(999999999), list.indexOf(10), list.indexOf(11))
print(list.elements)
list.remove(0)
print(list.elements, list.size())
print(list.get(2))
list.clear()
print(list.elements, list.size())
print(list.get(2))
