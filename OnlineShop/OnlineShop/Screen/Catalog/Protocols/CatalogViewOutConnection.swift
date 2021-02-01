//
//  CatalogViewOutConnection.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import Foundation
import UIKit

protocol CatalogViewOutConnection: class {
    func viewLoaded()
    func subscribe(collectionView: UICollectionView)
    func viewWillAppear()
}
