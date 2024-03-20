//
//  SearchViewController.swift
//  GHFollowers
//
//  Created by Chingiz on 14.03.24.
//

import UIKit

class SearchViewController: UITabBarController {
    
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gh-logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")

    var isUsernameEntered: Bool {
        return !usernameTextField.text!.isEmpty
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(logoImageView, usernameTextField, callToActionButton)
        
        usernameTextField.delegate = self
        callToActionButton.addTarget(self, action: #selector(pushFolloverListVC), for: .touchUpInside)
        
        
        createDismissKeyboardTapGesture()
        addConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc
    private func pushFolloverListVC() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty username", message: "Please enter a username. We need to know who to look for.", buttonTitle: "Ok")
            return
        }
        
        let vc = FollowerListViewController()
        vc.username = usernameTextField.text
        vc.title = usernameTextField.text
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            usernameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            callToActionButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFolloverListVC()
        return true
    }
    
}