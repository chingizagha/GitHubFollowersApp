//
//  UIHelper.swift
//  GHFollowers
//
//  Created by Chingiz on 18.03.24.
//

import UIKit

struct UIHelper {
    
    
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        return layout
    }
}
