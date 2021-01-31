//
//  CatalogViewController.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import UIKit

class CatalogViewController: UIViewController, CatalogViewInConnection {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    var presenter: CatalogViewOutConnection?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ProductCollectionViewCell.nib, forCellWithReuseIdentifier: ProductCollectionViewCell.nibName)
        collectionView.contentInset.top = 16
        
        presenter?.viewLoaded()
        presenter?.subscribe(collectionView: collectionView)
        
        title = "Каталог"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func reloadView() {
        collectionView.reloadData()
    }

}
