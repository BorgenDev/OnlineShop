//
//  InternalAlertView.swift
//  OnlineShop
//
//  Created by Arseniy on 03.03.2021.
//

import UIKit

class InternalAlertView: UIView, NibLoadable {
    @IBOutlet private weak var nameLable: UILabel!
    @IBOutlet private weak var backView: UIView!
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        backView.layer.cornerRadius = 20
    }
    
    func setup(with text: String) {
        nameLable.text = text
    }
}
