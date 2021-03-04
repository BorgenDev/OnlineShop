//
//  CatalogPresenter.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import Foundation
import UIKit

class CatalogPresenter: CatalogViewOutConnection, CatalogPresenterInConnection {
    weak var view: CatalogViewInConnection?
    var interactor: CatalogPresenterOutConnection?
    
    private let dataSource: CatalogDataSource = .init()
    
    func didFetchProducts(_ products: [Product]) {
        let filtredProducts = filteringProductsByPrice(products)
        DispatchQueue.main.async {
            self.dataSource.load(products: filtredProducts)
        }
        dataSource.productShouldBeAddedToCart = { [weak self] product in
            self?.interactor?.addProductToCart(product: product)
            self?.view?.showAlert()
        }
        interactor?.addButtonShouldBeHide()
        view?.reloadView()
    }

    func viewLoaded() {
        interactor?.fetchProducts()
    }
    
    func reloadCatalog() {
        view?.reloadView()
    }

    func subscribe(collectionView: UICollectionView) {
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
    }
    
    func viewWillAppear() {
        interactor?.addButtonShouldBeHide()
        view?.reloadView()
    }
    
    func statusOfAddButtonDidChange(indicator: Bool) {
        dataSource.buttonShouldBeHideFromScreen?(indicator)
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
