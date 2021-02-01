//
//  CartTableViewCell.swift
//  OnlineShop
//
//  Created by Arseniy on 28.01.2021.
//

import UIKit

class CartTableViewCell: UITableViewCell, NibLoadable {
    
    @IBOutlet private weak var productView: UIImageView!
    @IBOutlet private weak var nameLable: UILabel!
    @IBOutlet private weak var subtitleLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        productView.backgroundColor = .gray
        productView.layer.cornerRadius = 8
        productView.contentMode = .scaleAspectFill
        selectionStyle = .none
    }

    func configure(by product: Product) {
        let source = URL(string: product.imageUrl ?? "")
        productView.kf.setImage(with: source)
        nameLable.text = product.name ?? ""
        var subtitle = ""
        if let price = product.price {
            subtitle += "Цена: \(price)"
        }
        if let raiting = product.rating {
            if !subtitle.isEmpty {
                subtitle += "\n"
            }
            subtitle += "Рейтинг: \(Int(raiting * 100))%"
        }
        subtitleLable.text = subtitle
    }
    
}
