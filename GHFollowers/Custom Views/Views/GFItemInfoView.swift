//
//  GFItemInfoView.swift
//  GHFollowers
//
//  Created by Chingiz on 21.03.24.
//

import UIKit

enum ItemInfoType {
    case repos, gists, followers, following
}

class GFItemInfoView: UIView {

    let symbolImage = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configure(){
        addSubviews(symbolImage, titleLabel, countLabel)
        symbolImage.translatesAutoresizingMaskIntoConstraints = false
        symbolImage.contentMode = .scaleAspectFill
        symbolImage.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolImage.topAnchor.constraint(equalTo: topAnchor),
            symbolImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            symbolImage.heightAnchor.constraint(equalToConstant: 20),
            symbolImage.widthAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolImage.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImage.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolImage.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func set(itemInfoType: ItemInfoType, with count: Int) {
        switch itemInfoType {
        case .repos:
            symbolImage.image = SFSymbols.repos
            titleLabel.text = "Public Repos"
        case .gists:
            symbolImage.image = SFSymbols.gists
            titleLabel.text = "Public Gists"
        case .followers:
            symbolImage.image = SFSymbols.followers
            titleLabel.text = "Followers"
        case .following:
            symbolImage.image = SFSymbols.following
            titleLabel.text = "Following"
        }
        countLabel.text = String(count)
    }
}
