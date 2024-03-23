//
//  GFButton.swift
//  GHFollowers
//
//  Created by Chingiz on 15.03.24.
//

import UIKit

class GFButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
     convenience init(backgroundColor: UIColor, title: String){
        self.init(frame: .zero)
        set(color: backgroundColor, title: title)
    }
    
    private func configure(){
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(color: UIColor, title: String){
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.title = title
    }
}
