//
//  CollectionViewCellWrapped.swift
//  OnlineShop
//
//  Created by Arseniy on 03.03.2021.
//

import UIKit

class CollectionViewCellWrapped<View: NibLoadable & UIView> {
    
    static func register(in tableView: UICollectionView) {
        tableView.register(WrappedCollectionViewCell<View>.self, forCellWithReuseIdentifier: View.nibName)
    }
    
    static func get(from collectionView: UICollectionView, in indexPath: IndexPath) -> WrappedCollectionViewCell<View> {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: View.nibName, for: indexPath) as! WrappedCollectionViewCell<View>
        
        return cell
    }
    
    static func forceGet(from collectionView: UICollectionView, in indexPath: IndexPath) -> WrappedCollectionViewCell<View> {
        let cell = collectionView.cellForItem(at: indexPath) as! WrappedCollectionViewCell<View>

        return cell
    }
}
