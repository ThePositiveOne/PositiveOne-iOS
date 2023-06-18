//
//  LocalKey.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/18.
//

import Foundation

public enum LocalKey: String {
    case userIdentifier
}

public protocol LocalStorageService: AnyObject {
    func read(key: LocalKey) -> Any?
    func write(key: LocalKey, value: Any)
    func delete(key: LocalKey)
}

extension UserDefaults: LocalStorageService {
    public func read(key: LocalKey) -> Any? {
        return Self.standard.object(forKey: key.rawValue)
    }
    
    public func write(key: LocalKey, value: Any) {
        Self.standard.setValue(value, forKey: key.rawValue)
        Self.standard.synchronize()
    }
    
    public func delete(key: LocalKey) {
        Self.standard.setValue(nil, forKey: key.rawValue)
        Self.standard.synchronize()
    }
}

