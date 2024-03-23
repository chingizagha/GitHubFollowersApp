//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Chingiz on 23.03.24.
//

import UIKit

extension UITableView {
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
