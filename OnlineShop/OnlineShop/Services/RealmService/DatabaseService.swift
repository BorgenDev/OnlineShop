//
//  DatabaseManager.swift
//  OnlineShop
//
//  Created by Arseniy on 30.01.2021.
//

import Foundation
import RealmSwift

protocol DatabaseService {
    func add(_ objects: [Object])
    func add(_ objects: Object)
    func fetch<T: Object>() -> [T]
    func delete(_ object: Object)
    func write(_ clouser: (() -> Void)?)
    func configure()
}
