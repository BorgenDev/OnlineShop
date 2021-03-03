//
//  WrappedTableViewCell.swift
//  OnlineShop
//
//  Created by Arseniy on 03.03.2021.
//

import UIKit

@dynamicMemberLookup
class WrappedTableViewCell<View: NibLoadable & UIView>: UITableViewCell {
    private(set) var view: View = View.fromNib()
    
    subscript<T> (dynamicMember keyPath: KeyPath<View, T>) -> T {
        return self.view[keyPath: keyPath]
    }
    
    subscript(dynamicMemmber member: String) -> String {
        return member
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        let cell = self
        cell.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            view.topAnchor.constraint(equalTo: cell.topAnchor),
            view.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: cell.trailingAnchor)]
        cell.addConstraints(constraints)
    }
}
