//
//  ProductCollectionViewCell.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import UIKit
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell, NibLoadable {
    
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

        ratingLabel.minimumScaleFactor = 0.4
        ratingLabel.adjustsFontSizeToFitWidth = true
        
        nameLabel.minimumScaleFactor = 0.4
        nameLabel.adjustsFontSizeToFitWidth = true
        
        priceLabel.minimumScaleFactor = 0.2
        priceLabel.adjustsFontSizeToFitWidth = true
    }

    func configure(by product: Product) {
        nameLabel.text = product.name
        priceLabel.text = "\(product.price ?? 0) ₽"
        ratingLabel.text = "Рейтинг продукта: \(product.rating?.rounded() ?? 0)"
        imageView.kf.setImage(with: URL(string: product.imageUrl ?? ""))
    }

}
