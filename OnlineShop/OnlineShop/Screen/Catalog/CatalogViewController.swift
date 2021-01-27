//
//  CatalogViewController.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import UIKit

class CatalogViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    var presenter: CatalogPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ProductCollectionViewCell.nib, forCellWithReuseIdentifier: ProductCollectionViewCell.nibName)
    }

}
