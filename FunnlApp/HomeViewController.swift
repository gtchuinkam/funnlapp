//
//  ViewController.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/5/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let funnlLogo : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "funnl-logo-simple.png")
        imgView.contentMode = .scaleAspectFill
        
        return imgView
    }()
    
    let actionCallLabel : UILabel = {
        let label = UILabel()
        label.text = "Start your journey now!"
        label.textColor = UIColor(named: "secondary-text-color")
        label.font = UIFont(name: "Roboto", size: 24)
        label.textAlignment = .center
        
        return label
    }()
    
    let buttonContainer: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor(named: "background-text-icon-color"), for: .normal)
        button.backgroundColor = UIColor(named: "button-subheader-color")
        button.titleLabel?.font = UIFont(name: "Roboto", size: 32)
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor(named: "background-text-icon-color"), for: .normal)
        button.backgroundColor = UIColor(named: "button-subheader-color")
        button.titleLabel?.font = UIFont(name: "Roboto", size: 32)
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-text-icon-color")
        
        //Funnl Logo handlers
        self.view.addSubview(funnlLogo)
        setImgViewConstraints()
        
        //Button Container handlers
        self.view.addSubview(buttonContainer)
        setButtonContainterConstraints()
        
        //Label handlers
        self.view.addSubview(actionCallLabel)
        setLabelConstraints()
        
        //Sign-Up Button handlers
        buttonContainer.addSubview(signUpButton)
        setSignUpButtonConstraints()
        
        //Log-In Button handlers
        buttonContainer.addSubview(logInButton)
        setLogInButtonConstraints()
        
        //Set up button IB actions
        setIBActions()
        
    }
    
    // MARK: - Constraint Functions

    func setImgViewConstraints(){
        funnlLogo.translatesAutoresizingMaskIntoConstraints = false
        funnlLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        funnlLogo.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.60).isActive = true
        funnlLogo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        funnlLogo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    func setLabelConstraints(){
        actionCallLabel.translatesAutoresizingMaskIntoConstraints = false
        actionCallLabel.bottomAnchor.constraint(equalTo: buttonContainer.topAnchor).isActive = true
        actionCallLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        actionCallLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        actionCallLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05).isActive = true
    }
    
    func setButtonContainterConstraints(){
        buttonContainer.translatesAutoresizingMaskIntoConstraints = false
        buttonContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        buttonContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        buttonContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        buttonContainer.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.30).isActive = true
    }
    
    func setSignUpButtonConstraints() {
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.topAnchor.constraint(equalTo: buttonContainer.topAnchor).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: buttonContainer.leadingAnchor).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: buttonContainer.trailingAnchor).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setLogInButtonConstraints(){
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 10).isActive = true
        logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // MARK: - Segue Functions
    
    @objc func logInButtonClicked(sender: UIButton){
        let page = LogInViewController()
        page.modalPresentationStyle = .fullScreen
        present(page, animated: true, completion: nil)
    }
    
    @objc func signUpButtonClicked(sender: UIButton){
        let page = SignUpViewController()
        page.modalPresentationStyle = .fullScreen
        present(page, animated: true, completion: nil)
    }
    
    func setIBActions(){
        logInButton.addTarget(self, action: #selector(self.logInButtonClicked(sender:)), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(self.signUpButtonClicked(sender:)), for: .touchUpInside)
    }
}

