//
//  CatalogDataSource.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import UIKit

class CatalogDataSource: NSObject {
    private let spacing: CGFloat = 16
    private let numberOfColumns = 2

    private(set) var products: [Product] = []

    func load(products: [Product]) {
        self.products = products
    }
}

extension CatalogDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.nibName, for: indexPath) as! ProductCollectionViewCell
        let product = products[indexPath.row]
        cell.configure(by: product)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
}

extension CatalogDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let mainWidth = collectionView.frame.width
        let calculator = CatalogLayoutCalculator(spacing: spacing, numberOfColumns: numberOfColumns, aspectRatio: 3/2)
        return calculator.calculateSize(for: mainWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        var insets: UIEdgeInsets = .zero
        insets.left = spacing
        insets.right = spacing
        return insets
    }
}
