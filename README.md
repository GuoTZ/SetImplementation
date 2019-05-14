# SetImplementation

### 集合
- `集合（Set）是用来存储相同类型、没有确定顺序、且不重复的值。 `
- `也就是说当元素顺序不重要时，或者希望确保每个元素只出现一次时，可以使用集合而不是数组。`

### 链表实现集合
```swift

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
```
`由上图可看出 链表实现的集合添加元素的时间复杂度为O(n)`

### 搜索树实现集合
#### 二分搜索树实现集合
```swift

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
```
