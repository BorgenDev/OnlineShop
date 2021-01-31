//
//  NewProductPresenter.swift
//  OnlineShop
//
//  Created by Arseniy on 31.01.2021.
//

import Foundation

class NewProductPresenter: NewProductViewOutConnection, NewProductPresenterInConnection {
        
    weak var view: NewProductViewInConnection?
    var interactor: NewProductPresenterOutConnection?
    
    func getInformationAdoutProduct(name: String?, price: Double?, raiting: Float?) {
        let product = Product(name: name, price: price, rating: raiting, imageUrl: "")
        interactor?.getProduct(product: product)
    }
    
    func viewDidLoad() {
        
    }
    

}
