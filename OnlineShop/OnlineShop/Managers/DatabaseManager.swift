//
//  DatabaseManager.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import Foundation
import RealmSwift

class DatabaseManager {
    private init() {}
    static let shared = DatabaseManager()
    
    private lazy var realm = try! Realm()
    
    func add(_ objects: [Object]) {
        write {
            self.realm.add(objects, update: .all)
        }
    }
    
    func add(_ objects: Object) {
        write {
            self.realm.add(objects, update: .all)
        }
    }
    
    func fetch<T: Object>() -> [T] {
        return Array(realm.objects(T.self))
    }
    
    func delete(_ object: Object) {
        try! realm.write {
            self.realm.delete(object)
        }
    }
    
    func write(_ clouser: (() -> Void)?) {
        try! realm.write {
            clouser?()
        }
    }
    
    func configure() {
        Realm.Configuration.defaultConfiguration.deleteRealmIfMigrationNeeded = true
    }
}
