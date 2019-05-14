//
//  main.swift
//  SetImplementation
//
//  Created by DingYD on 2019/5/14.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Foundation

// 链表集合
let list = ["wode","1","2","3","4","5","nide"]
var set = LinkedListSet<String>()
var bstSet = BSTSet<String>()
for item in list {
    set.add(e: item)
    bstSet.add(e: item)
}
print(set)
for i in 1...3 {
    set.remove(e: "\(i)")
    bstSet.remove(e: "\(i)")
}
print(set)
bstSet.debugDescription

/*
 nide,5,4,3,2,1,wode,
 nide,5,4,wode,
 Program ended with exit code: 0
 */

// 二分搜索树集合
