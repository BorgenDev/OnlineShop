//
//  RealmCard.swift
//  OnlineShop
//
//  Created by Arseniy on 28.01.2021.
//

import Foundation
import RealmSwift

class RealmCard: Object {
    @objc dynamic var sessionID: String = ""
    var productIds: List<String> = List()
    
    @objc override class func primaryKey() -> String? {
        return "sessionID"
    }
    
}
