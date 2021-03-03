//
//  CatalogViewController.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import UIKit
import SystemConfiguration

class CatalogViewController: UIViewController, CatalogViewInConnection {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    var presenter: CatalogViewOutConnection?
    
    private var internalAlert = InternalAlert(text: "Товар успешно добавлен в корзину!")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionViewCellWrapped<CartProductView>.register(in: collectionView)
        collectionView.contentInset.top = 16
        
        presenter?.viewLoaded()
        presenter?.subscribe(collectionView: collectionView)
        
        title = "Каталог"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func reloadView() {
        collectionView.reloadData()
    }
    
    func showAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.internalAlert = self.internalAlert
                .animated()
                .show()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.internalAlert = self.internalAlert
                .hide()
        }
    }
    
}
