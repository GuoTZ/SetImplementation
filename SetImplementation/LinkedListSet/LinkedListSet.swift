//
//  LinkedListSet.swift
//  SetImplementation
//
//  Created by DingYD on 2019/5/14.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Cocoa

class LinkedListSet<E>: SetAble,CustomDebugStringConvertible where E:Equatable{
    private var data: LinkedList<E>
    init() {
        self.data = LinkedList<E>()
    }
    func add(e: E) {
        if !self.data.contains(e: e) {
            self.data.addFirst(e: e)
        }
    }
    
    func contains(e: E) -> Bool {
        return self.data.contains(e: e)
    }
    
    func remove(e: E) {
        self.data.removeElement(e: e)
    }
    
    func getSize() -> Int {
        return self.data.getSize()
    }
    
    func isEmpty() -> Bool {
        return self.data.isEmpty()
    }
    
    var debugDescription: String {
        return self.data.debugDescription
    }
}
