//
//  BST.swift
//  SetImplementation
//
//  Created by DingYD on 2019/5/14.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Cocoa

/// 二分上搜索树的节点
class BstNode<E> :CustomDebugStringConvertible{
    var e:E?
    var left:BstNode<E>?
    var right:BstNode<E>?
    init() {
        self.right = nil
        self.left = nil
        self.e = nil
    }
    init(e:E) {
        self.e = e
    }
    var debugDescription: String {
        guard let e = self.e else { return "nil" }
        return "\(e)"
    }
}

/// 二分搜索树
class BST<E> where E:Comparable {
    private var root: BstNode<E>?
    private var size: Int
    init() {
        self.root = nil
        self.size = 0
    }
    func getSize() -> Int {
        return self.size
    }
    func isEmpty() -> Bool {
        return self.size == 0
    }
    //MARK:添加元素
    /// 添加元素
    ///
    /// - Parameter e: e description
    func add(e:E) {
        self.root = self.add(node: self.root, e: e)
    }
    // 向以node为根的二分搜索树中插入元素e，递归算法
    // 返回插入新节点后二分搜索树的根
    private func add(node:BstNode<E>?, e:E)->BstNode<E>{
        guard let node = node else {
            self.size+=1
            return BstNode.init(e: e)
        }
        if e < node.e! {
            node.left = add(node: node.left, e: e)
        } else if e > node.e! {
            node.right = add(node: node.right, e: e)
        }
        return node
    }
    
    
    // MARK:查看是否存在元素e
    /// 查看是否存在元素e
    ///
    /// - Parameter e: 查询的元素
    /// - Returns: true表示存在，否则表示不存在
    func contains(e:E) -> Bool {
        return self.contains(e: e, node: self.root)
    }
    
    private func contains(e:E,node:BstNode<E>?) -> Bool {
        guard let node = node else { return false }
        if e < node.e! {
            return self.contains(e: e, node: node.left)
        } else if e > node.e! {
            return self.contains(e: e, node: node.right)
        }
        return true
    }
    //MARK:前序遍历
    /// 前序遍历
    func preOrder() {
        self.preOrder(node: self.root)
    }
    
    private func preOrder(node:BstNode<E>?) {
        guard let node = node else { return  }
        print(node)
        preOrder(node: node.left)
        preOrder(node: node.right)
    }
    
    //MARK:中序遍历
    /// 中序遍历
    func inOrder() {
        self.inOrder(node: self.root)
    }
    private func inOrder(node:BstNode<E>?) {
        guard let node = node else { return }
        preOrder(node: node.left)
        print(node)
        preOrder(node: node.right)
    }
    
    //MARK:后序遍历
    /// 后序遍历
    func postOrder() {
        self.postOrder(node: self.root)
    }
    private func postOrder(node:BstNode<E>?) {
        guard let node = node else { return }
        postOrder(node: node.left)
        postOrder(node: node.right)
        print(node)
    }
    
    //MARK:层序遍历
    /// 层序遍历
    func levelOrder() {
        let q = Queue<BstNode<E>>()
        guard let root = self.root else { return  }
        q.push(e: root)
        while !q.isEmpty() {
            let cur = q.pop()
            if let cur = cur {
                print(cur)
                if cur.left != nil{
                    q.push(e: cur.left!)
                }else if cur.right != nil{
                    q.push(e: cur.right!)
                }
            }
        }
    }
    
    //MARK:前序非递归遍历
    /// 前序非递归遍历
    func preOrderRN() {
        let stack = Stack<BstNode<E>>()
        guard let root = self.root else { return  }
        stack.push(e: root)
        while !stack.isEmpty() {
            let cur = stack.pop()
            if let cur = cur {
                print(cur)
                if cur.left != nil{
                    stack.push(e: cur.left!)
                }else if cur.right != nil{
                    stack.push(e: cur.right!)
                }
            }
        }
    }
    
    //MARK: 寻找最小元素
    /// 寻找最小元素
    ///
    /// - Returns: return value description
    func minimum() -> E? {
        if self.size==0 {
            return nil
        }
        return self.minimum(node: self.root)?.e
    }
    private func minimum(node:BstNode<E>?) -> BstNode<E>? {
        guard let node = node else { return nil }
        
        if node.left != nil {
            return self.minimum(node: node.left)
        }
        return node
    }
    //MARK: 寻找最大元素
    /// 寻找最大元素
    ///
    /// - Returns: return value description
    func maxmum() -> E? {
        if self.size==0 {
            return nil
        }
        return self.maxmum(node: self.root)?.e
    }
    private func maxmum(node:BstNode<E>?) -> BstNode<E>? {
        guard let node = node else { return nil }
        if node.right == nil {
            return node
        }
        return self.maxmum(node: node.right)
    }
    
    //MARK:删除最小值
    /// 删除x最小值
    ///
    /// - Returns: return value description
    func removeMin() -> E? {
        let data = self.minimum()
        self.root = removeMin(node: self.root)
        return data
    }
    
    private func removeMin(node:BstNode<E>?) -> BstNode<E>? {
        guard let node = node else { return nil }
        
        if node.left == nil {
            let rightNode = node.right
            node.right = nil
            size -= 1
            return rightNode
        }
        node.left = self.removeMin(node: node.left)
        return node
    }
    
    //MARK:移除最大值
    /// 移除最大值
    ///
    /// - Returns: return value description
    func removeMax() -> E? {
        let data = self.maxmum()
        self.root = self.removeMin(node: self.root)
        return data
        
    }
    private func removeMax(node:BstNode<E>?) -> BstNode<E>? {
        guard let node = node else { return nil }
        if node.right == nil {
            let leftnode = node.left
            node.left = nil
            self.size -= 1
            return leftnode
        }
        node.right = removeMax(node: node.right)
        return node
    }
    
    //MARK:移除任意值
    /// 移除任意值
    ///
    /// - Returns: return value description
    func remove(e:E) {
        self.root = remove(e: e, node: self.root)
    }
    private func remove(e:E,node:BstNode<E>?) -> BstNode<E>? {
        guard let node = node else { return nil }
        guard let eval = node.e else { return nil }
        if e < eval {
            node.left = remove(e: e, node: node.left)
            return node
        } else if e > eval {
            node.right = remove(e: e, node: node.right)
            return node
        } else {
            // 待删除节点左子树为空的情况
            if node.left == nil {
                let rightNode = node.right
                node.right = nil
                self.size -= 1
                return rightNode
            }
            // 待删除节点右子树为空的情况
            if node.right == nil {
                let leftNode = node.left
                node.left = nil
                self.size -= 1
                return leftNode
            }
            
            let successor = self.minimum(node: node.right)
            successor?.right = self.removeMin(node: node.right)
            successor?.left = node.left
            node.left = nil
            node.right = nil
            return successor
        }
    }
    
}
