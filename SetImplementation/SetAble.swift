//
//  SetAble.swift
//  SetImplementation
//
//  Created by DingYD on 2019/5/14.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Foundation

/// 集合的协议
protocol SetAble {
    associatedtype E
    
    /// 添加到字典
    ///
    /// - Parameter e: e description
    /// - Returns: return value description
    func add(e:E)
    func contains(e:E) ->Bool
    func remove(e:E)
    func getSize() ->Int
    func isEmpty() -> Bool
}
