//
//  CatalogPresenter.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import Foundation
import UIKit

class CatalogPresenter {
    weak var view: CatalogViewController?
    var interactor: CatalogInteractor?
    
    private let dataSource: CatalogDataSource = .init()
    
    func didFetchProducts(_ products: [Product]) {
        dataSource.load(products: products)
        view?.reloadView()
    }

    func viewLoaded() {
        interactor?.fetchProducts()
    }

    func subscribe(collectionView: UICollectionView) {
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
    }
}
