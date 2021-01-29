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
        let filtredProducts = filteringProductsByPrice(products)
        dataSource.load(products: filtredProducts)
        dataSource.productShouldBeAddedToCart = { [weak self] product in
            self?.interactor?.addProductToCart(product)
        }
        view?.reloadView()
    }

    func viewLoaded() {
        interactor?.fetchProducts()
    }

    func subscribe(collectionView: UICollectionView) {
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
    }
    
    private func filteringProductsByPrice(_ products: [Product]) -> [Product] {
        let filtredProduct = products.compactMap { $0.price }
        let countOfProducts = filtredProduct.count
        guard filtredProduct.count != 0 else {
            return []
        }
        let sum = filtredProduct.reduce(0) { $0 + $1 }
        let averageСost = Int(sum) / countOfProducts
        
        let finalProduct = products.filter { Int($0.price ?? 0.0) < averageСost }
        
        return finalProduct
    }
}
