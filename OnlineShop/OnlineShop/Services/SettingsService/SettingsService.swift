//
//  SettingsService.swift
//  OnlineShop
//
//  Created by Arseniy on 01.02.2021.
//

import Foundation

protocol SettingsService {
    var hideCartScreena: ((Bool) -> Void)? { get set }
    var hideAddButton: ((Bool) -> Void)? { get set }
}
