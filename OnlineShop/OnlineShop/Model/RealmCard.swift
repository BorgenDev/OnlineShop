//
//  RealmCard.swift
//  OnlineShop
//
//  Created by Arseniy on 28.01.2021.
//

import Foundation
import RealmSwift

class RealmCard: Object {
    var sessionID: String = ""
    var productIds: List<Int> = List()
    
    @objc override class func primaryKey() -> String? {
        return "sessionID"
    }
    
}
