//
//  CartProduct.swift
//  OnlineShop
//
//  Created by Arseniy on 03.03.2021.
//

import UIKit
import Kingfisher

class CartProductView: UIView, NibLoadable {
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    @IBOutlet weak private var ratingLabel: UILabel!
    @IBOutlet private weak var button: UIButton!

    var buttonClocked: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        button.layer.cornerRadius = 10
        imageView.layer.cornerRadius = 10
        layer.cornerRadius = 10

        ratingLabel.minimumScaleFactor = 0.1
        ratingLabel.adjustsFontSizeToFitWidth = true
        
        nameLabel.minimumScaleFactor = 0.1
        nameLabel.adjustsFontSizeToFitWidth = true
        
        priceLabel.minimumScaleFactor = 0.1
        priceLabel.adjustsFontSizeToFitWidth = true

        addTargets()
    }

    func configure(by product: Product, isButtonHidden: Bool) {
        nameLabel.text = product.name
        priceLabel.text = "\(product.price ?? 0) ₽"
        ratingLabel.text = "Рейтинг продукта: \(product.rating?.rounded() ?? 0)"
        imageView.kf.setImage(with: URL(string: product.imageUrl ?? ""))
        
        self.button.isHidden = !isButtonHidden
    }
    
    private func addTargets() {
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    @objc private func buttonAction() {
        buttonClocked?()
    }
}
