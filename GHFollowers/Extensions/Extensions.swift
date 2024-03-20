//
//  Extensions.swift
//  GHFollowers
//
//  Created by Chingiz on 15.03.24.
//

import UIKit

extension UIView{
    func addSubviews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
