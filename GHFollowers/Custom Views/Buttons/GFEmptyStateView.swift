//
//  GFEmptyStateView.swift
//  GHFollowers
//
//  Created by Chingiz on 20.03.24.
//

import UIKit

class GFEmptyStateView: UIView {
    
    let messageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    convenience init(message: String){
        self.init(frame: .zero)
        messageLabel.text = message
    }
    
    private func configure(){
        
        addSubviews(messageLabel, logoImageView)
        
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        logoImageView.image = Images.emptyState
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let labelCenterYConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? -80 : -150
        
        let messageLabelCneterYConstraint = messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: labelCenterYConstant)
        messageLabelCneterYConstraint.isActive = true
        
        let logoBottomConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 80 : 40
        
        let logoImageViewBottomConstraint = logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: logoBottomConstant)
        logoImageViewBottomConstraint.isActive = true
        
        
        
        NSLayoutConstraint.activate([
            
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            
            logoImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 170),
        ])
    }
    
}

