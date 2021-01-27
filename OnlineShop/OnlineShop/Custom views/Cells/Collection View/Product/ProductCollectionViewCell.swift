//
//  ProductCollectionViewCell.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import UIKit
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    @IBOutlet weak private var ratingLabel: UILabel!
    @IBOutlet private weak var button: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        button.layer.cornerRadius = 10
        imageView.layer.cornerRadius = 10
        layer.cornerRadius = 10

        ratingLabel.minimumScaleFactor = 0.2
        ratingLabel.adjustsFontSizeToFitWidth = true
    }

    func configure(by product: Product) {
        nameLabel.text = product.name
        priceLabel.text = "\(product.price ?? 0) ₽"
        ratingLabel.text = "Рейтинг продукта: \(product.rating ?? 0)"
        imageView.kf.setImage(with: URL(string: product.imageUrl ?? ""))
    }

}
