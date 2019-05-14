//
//  BSTSet.swift
//  SetImplementation
//
//  Created by DingYD on 2019/5/14.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Cocoa

class BSTSet<E>:SetAble where E:Comparable {
    private var data: BST<E>
    init() {
        self.data = BST<E>()
    }
    func add(e: E) {
        self.data.add(e: e)
    }
    
    func contains(e: E) -> Bool {
        return self.data.contains(e: e)
    }
    
    func remove(e: E) {
        self.data.remove(e: e)
    }
    
    func getSize() -> Int {
        return self.data.getSize()
    }
    
    func isEmpty() -> Bool {
        return self.data.isEmpty()
    }
    
    var debugDescription: String {
        self.data.preOrderRN()
        return ""
    }
}
