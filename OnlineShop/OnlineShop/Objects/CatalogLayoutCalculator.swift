//
//  CatalogLayoutCalculator.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import UIKit

struct CatalogLayoutCalculator {
    private let spacing: CGFloat
    private let numberOfColumns: CGFloat
    private let aspectRatio: CGFloat

    init(spacing: CGFloat, numberOfColumns: Int, aspectRatio: CGFloat) {
        self.spacing = spacing
        self.numberOfColumns = CGFloat(numberOfColumns)
        self.aspectRatio = aspectRatio
    }

    func calculateSize(for mainWidth: CGFloat) -> CGSize {
        let width = (mainWidth - spacing * 2 - spacing * (numberOfColumns - 1)) / numberOfColumns
        let height = width * aspectRatio

        let size: CGSize = .init(width: width, height: height)
        return size
    }
}
