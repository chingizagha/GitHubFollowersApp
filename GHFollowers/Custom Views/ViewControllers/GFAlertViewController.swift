//
//  GFAlertViewController.swift
//  GHFollowers
//
//  Created by Chingiz on 17.03.24.
//

import UIKit

class GFAlertViewController: UIViewController {
    
    let containerView = GFAlertContainerView()
    let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let actionButton = GFButton(backgroundColor: .systemPink, title: "Ok")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    let padding: CGFloat = 20
    
    init(alertTitle: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)

        view.addSubview(containerView)
        containerView.addSubviews(titleLabel, messageLabel, actionButton)
        addConstraints()
    }
    
    @objc
    private func dismissVC() {
        dismiss(animated: true)
    }
    
    private func addConstraints(){
        titleLabel.text = alertTitle ?? "Something went wrong"
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        messageLabel.text = message ?? "Unabel to complete request"
        messageLabel.numberOfLines = 4
        
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -padding),
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
            
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -padding),
            actionButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -padding),
            messageLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12),
        ])
    }
}
