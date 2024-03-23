//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by Chingiz on 18.03.24.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let identifier = "FollowerCell"
    
    let padding: CGFloat = 8
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        contentView.addSubviews(avatarImageView, usernameLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            avatarImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding),
            avatarImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding),
            usernameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configure(follower: Follower){
        usernameLabel.text = follower.login
        avatarImageView.downloadImage(fromURL: follower.avatarUrl)
    }
}
