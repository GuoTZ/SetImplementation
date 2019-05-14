//
//  LinkedList.swift
//  SetImplementation
//
//  Created by DingYD on 2019/5/14.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Cocoa

class Node<E>:CustomDebugStringConvertible {
    var e:E?
    var node:Node<E>?
    init(e:E?, node:Node<E>?) {
        self.e = e
        self.node = node
    }
    init() {
        self.e = nil
        self.node = nil
    }
    var debugDescription: String {
        return "\(String(describing: e))"
    }
}


class LinkedList<E>:CustomDebugStringConvertible where E:Equatable {

    private var dummyHead:Node<E>
    private var size:Int
    
    init(){
        self.dummyHead = Node<E>()
        self.size = 0
    }
    
    // 获取链表中的元素个数
    public func getSize()->Int{
        return size
    }
    
    // 返回链表是否为空
    public func isEmpty()->Bool{
        return size == 0
    }
    
    // 在链表的index(0-based)位置添加新的元素e
    // 在链表中不是一个常用的操作，练习用：）
    public func add (index:Int,e:E) {
        if index>=0 && index<=size {
            var prev:Node<E>? = self.dummyHead
            for _ in 0..<index {
                if prev == nil {
                    return
                }
                prev = prev?.node
                
            }
            prev?.node = Node.init(e: e, node: prev?.node)
            self.size += 1
        }
    }

    // 在链表头添加新的元素e
    public func addFirst(e:E){
        self.add(index: 0, e: e)
    }
    
    // 在链表末尾添加新的元素e
    public func addLast(e:E){
            self.add(index: self.size, e: e)
    }
    
    // 获得链表的第index(0-based)个位置的元素
    // 在链表中不是一个常用的操作，练习用：）
    public func get(index:Int) -> E?{
    
        if(index < 0 || index >= size){
            
            return nil
        }
        
        var cur = dummyHead.node;
        for _ in 0..<index {
            cur = cur?.node
        }
        return cur?.e
    }
    
    // 获得链表的第一个元素
    public func getFirst()->E?{
        return get(index: 0)
    }
    
    // 获得链表的最后一个元素
    public func getLast()->E?{
        return get(index: self.size-1)
    }
    
    // 修改链表的第index(0-based)个位置的元素为e
    // 在链表中不是一个常用的操作，练习用：）
    public func set(index:Int, e:E){
        if(index < 0 || index >= size){
            return
        }
        
        
        var cur = dummyHead.node;
        for _ in 0..<index {
            cur = cur?.node
            cur?.e = e
        }
    }
    
    // 查找链表中是否有元素e
    public func contains(e:E)->Bool{
    var cur = dummyHead.node
        while cur != nil {
            if let cure = cur?.e {
                if cure == e {
                    return true
                }
            }
            cur = cur?.node
        }
        return false
    }
    
    // 从链表中删除index(0-based)位置的元素, 返回删除的元素
    // 在链表中不是一个常用的操作，练习用：）
    public func remove(index:Int) -> E?{
        if(index < 0 || index >= size){
            return nil
        }
        
        
        var prev:Node<E>? = dummyHead
        for _ in 0..<index {
            prev = prev?.node
        }
        
        let retNode = prev?.node
        prev?.node = retNode?.node
        retNode?.node = nil
        size -= 1
        
        return retNode?.e
    }
    
    // 从链表中删除第一个元素, 返回删除的元素
    public func removeFirst()->E?{
        return remove(index:0)
    }
    
    // 从链表中删除最后一个元素, 返回删除的元素
    public func removeLast()->E?{
        return remove(index:size - 1)
    }
    
    // 从链表中删除元素e
    public func removeElement(e:E){
    
        var prev:Node<E>? = dummyHead
        while(prev?.node != nil){
            if let prevnodee = prev?.node?.e {
                if(prevnodee==e){
                    break
                }
            }
            prev = prev?.node
        }
        
        if(prev?.node != nil){
            let delNode = prev!.node
            prev!.node = delNode!.node
            delNode?.node = nil
            size -= 1
        }
    }
    var debugDescription: String {
        var str = ""
        var node:Node<E>? = self.dummyHead
        for _ in 0..<self.getSize() {
            if let nodee = node?.node?.e {
                let nodeStr = String(describing: nodee)
                str.append("\(nodeStr)" + ",")
            }
            
            node = node?.node
        }
        return str
    }
}
