//
//  SignUpViewController.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/6/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let topContainerView: UIView = {
        let view  = UIView()
        
        return view
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back-arrow.png"), for: .normal)
        
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = UIFont(name: "Roboto", size: 100)
        label.textColor = UIColor(named: "secondary-text-color")
        
        //Resizing attributes
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.25
        label.adjustsFontSizeToFitWidth = true;
        
        return label
    }()
    
    let textFieldsContainer: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let buttonContainer: UIView = {
        let view  = UIView()
        
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
    
    let questionLabel : UILabel = {
        let label = UILabel()
        label.text = "Have an account?"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Roboto", size: 18)
        label.textAlignment = .right
        
        return label
    }()
    
    let linkLabel : UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString.init(string: "Log In")
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
            NSRange.init(location: 0, length: attributedString.length));
        label.attributedText = attributedString
        label.textColor = UIColor(named: "navbar-header-color")
        label.font = UIFont(name: "Roboto", size: 18)
        label.textAlignment = .left
        
        return label
    }()
    
    let usernameTextFieldContainer: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let emailTextFieldContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        
        return view
    }()
    
    let passwordTextFieldContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        
        return view
    }()
    
    let usernameImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "user-icon.png")
        imgView.contentMode = .scaleAspectFill
        
        return imgView
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.clearButtonMode = .whileEditing
        textField.textColor = UIColor(named: "black")
        textField.font = UIFont(name: "Roboto", size: 24)
        textField.textAlignment = .left
        
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-text-icon-color")
        
        //Top Container handlers
        view.addSubview(topContainerView)
        setTopContainerViewConstraints()
        
        //Back Button handlers
        topContainerView.addSubview(backButton)
        setBackButtonConstraints()
        
        //Title Label Handlers
        topContainerView.addSubview(titleLabel)
        setTitleLabelConstraints()
        
        //Text Feild Container View handlers
        view.addSubview(textFieldsContainer)
        setTextFieldsContainerConstraints()
        
        //Button Container View handler
        view.addSubview(buttonContainer)
        setButtonContainerConstraints()
        
        //Sign Up Button handlers
        buttonContainer.addSubview(signUpButton)
        setSignUpButtonConstraints()
        
        //Label handlers
        buttonContainer.addSubview(questionLabel)
        buttonContainer.addSubview(linkLabel)
        setQuestionLabelConstraints()
        setLinkLabelConstraints()
        
        //Textfield Container handlers
        textFieldsContainer.addSubview(usernameTextFieldContainer)
        setUsernameTextFieldContainerConstraints()
        textFieldsContainer.addSubview(emailTextFieldContainer)
        setEmailTextFieldContainerConstraints()
        textFieldsContainer.addSubview(passwordTextFieldContainer)
        setPasswordTextFieldContainerConstraints()
        
        //Username Elements handlers
        usernameTextFieldContainer.addSubview(usernameImage)
        setUsernameImageConstraints()
        usernameTextFieldContainer.addSubview(usernameTextField)
        setUsernameTextFieldConstraints()
    }
    
    func setTopContainerViewConstraints(){
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        topContainerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.25).isActive = true
    }
    
    func setBackButtonConstraints(){
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: topContainerView.topAnchor, constant: 40).isActive = true
        backButton.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor).isActive = true
        backButton.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.3).isActive = true
        backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor).isActive = true
    }
    
    func setTitleLabelConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: topContainerView.widthAnchor, multiplier: 0.5).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.33).isActive = true
    }
    
    func setTextFieldsContainerConstraints(){
        textFieldsContainer.translatesAutoresizingMaskIntoConstraints = false
        textFieldsContainer.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        textFieldsContainer.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        textFieldsContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        textFieldsContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        textFieldsContainer.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    func setButtonContainerConstraints(){
        buttonContainer.translatesAutoresizingMaskIntoConstraints = false
        buttonContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        buttonContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        buttonContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        buttonContainer.topAnchor.constraint(equalTo: textFieldsContainer.bottomAnchor).isActive = true
    }
    
    func setSignUpButtonConstraints(){
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.topAnchor.constraint(equalTo: buttonContainer.topAnchor).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: buttonContainer.leadingAnchor).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: buttonContainer.trailingAnchor).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setQuestionLabelConstraints(){
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor).isActive = true
        questionLabel.leadingAnchor.constraint(equalTo: buttonContainer.leadingAnchor).isActive = true
        questionLabel.widthAnchor.constraint(equalTo: buttonContainer.widthAnchor, multiplier: 0.6).isActive = true
        
    }
    
    func setLinkLabelConstraints(){
        linkLabel.translatesAutoresizingMaskIntoConstraints = false
        linkLabel.leadingAnchor.constraint(equalTo: questionLabel.trailingAnchor).isActive = true
        linkLabel.trailingAnchor.constraint(equalTo: buttonContainer.trailingAnchor, constant: 5).isActive = true
        linkLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor).isActive = true
    }
    
    func setUsernameTextFieldContainerConstraints(){
        usernameTextFieldContainer.translatesAutoresizingMaskIntoConstraints = false
        usernameTextFieldContainer.centerXAnchor.constraint(equalTo: textFieldsContainer.centerXAnchor).isActive = true
        usernameTextFieldContainer.centerYAnchor.constraint(equalTo: textFieldsContainer.centerYAnchor).isActive = true
        usernameTextFieldContainer.leadingAnchor.constraint(equalTo: textFieldsContainer.leadingAnchor).isActive = true
        usernameTextFieldContainer.trailingAnchor.constraint(equalTo: textFieldsContainer.trailingAnchor).isActive = true
        usernameTextFieldContainer.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    }
    
    func setEmailTextFieldContainerConstraints(){
        emailTextFieldContainer.translatesAutoresizingMaskIntoConstraints = false
        emailTextFieldContainer.leadingAnchor.constraint(equalTo: textFieldsContainer.leadingAnchor).isActive = true
        emailTextFieldContainer.trailingAnchor.constraint(equalTo: textFieldsContainer.trailingAnchor).isActive = true
        emailTextFieldContainer.bottomAnchor.constraint(equalTo: usernameTextFieldContainer.topAnchor, constant: -15).isActive = true
        emailTextFieldContainer.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    }
    
    func setPasswordTextFieldContainerConstraints(){
        passwordTextFieldContainer.translatesAutoresizingMaskIntoConstraints = false
        passwordTextFieldContainer.leadingAnchor.constraint(equalTo: textFieldsContainer.leadingAnchor).isActive = true
        passwordTextFieldContainer.trailingAnchor.constraint(equalTo: textFieldsContainer.trailingAnchor).isActive = true
        passwordTextFieldContainer.topAnchor.constraint(equalTo: usernameTextFieldContainer.bottomAnchor, constant: 20).isActive = true
        passwordTextFieldContainer.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    }
    
    func setUsernameImageConstraints(){
        usernameImage.translatesAutoresizingMaskIntoConstraints = false
        usernameImage.leadingAnchor.constraint(equalTo: usernameTextFieldContainer.leadingAnchor).isActive = true
        usernameImage.topAnchor.constraint(equalTo: usernameTextFieldContainer.topAnchor).isActive = true
        usernameImage.bottomAnchor.constraint(equalTo: usernameTextFieldContainer.bottomAnchor).isActive = true
        usernameImage.widthAnchor.constraint(equalTo: usernameImage.heightAnchor).isActive = true
    }
    
    func setUsernameTextFieldConstraints(){
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.leadingAnchor.constraint(equalTo: usernameImage.trailingAnchor).isActive = true
        usernameTextField.trailingAnchor.constraint(equalTo: usernameTextFieldContainer.trailingAnchor).isActive = true
        usernameTextField.topAnchor.constraint(equalTo: usernameTextFieldContainer.topAnchor).isActive = true
        usernameTextField.bottomAnchor.constraint(equalTo: usernameTextFieldContainer.bottomAnchor).isActive = true
    }

}
