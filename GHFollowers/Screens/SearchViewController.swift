//
//  SearchViewController.swift
//  GHFollowers
//
//  Created by Chingiz on 14.03.24.
//

import UIKit

class SearchViewController: UIViewController {
    
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = Images.ghLogo
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
        usernameTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc
    private func pushFolloverListVC() {
        guard isUsernameEntered else {
            DispatchQueue.main.async {
                self.presentGFAlert(title: "Empty username", message: "Please enter a username. We need to know who to look for.", buttonTitle: "Ok")
            }
            return
        }
        usernameTextField.resignFirstResponder()
        
        let vc = FollowerListViewController(username: usernameTextField.text!)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    private func addConstraints(){
        let topConstraintConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 20 : 80
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstraintConstant),
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
