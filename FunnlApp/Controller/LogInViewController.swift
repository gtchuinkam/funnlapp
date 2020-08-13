//
//  LogInViewController.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/6/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    //MARK:- UI Elements initialization
    
    let topContainerView: UIView = {
        let view  = UIView()
        
        return view
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "back-arrow.png"), for: .normal)
        button.tintColor = UIColor(named: "button-subheader-color")
        
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Log In"
        label.font = UIFont(name: "Roboto", size: 100)
        label.textColor = UIColor(named: "secondary-text-color")
        
        //Resizing attributes
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.25
        label.adjustsFontSizeToFitWidth = true;
        
        return label
    }()
    
    let buttonContainer: UIView = {
        let view  = UIView()
        
        return view
    }()
    
    let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor(named: "background-text-icon-color"), for: .normal)
        button.backgroundColor = UIColor(named: "button-subheader-color")
        button.titleLabel?.font = UIFont(name: "Roboto", size: 32)
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    let questionLabel : UILabel = {
        let label = UILabel()
        label.text = "New User?"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Roboto", size: 18)
        label.textAlignment = .right
        
        return label
    }()
    
    let linkLabel : UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString.init(string: "Sign Up")
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
            NSRange.init(location: 0, length: attributedString.length));
        label.attributedText = attributedString
        label.textColor = UIColor(named: "navbar-header-color")
        label.font = UIFont(name: "Roboto", size: 18)
        label.textAlignment = .left
        
        return label
    }()
    
    let textFieldsContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let usernameTextFieldContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let passwordTextFieldContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let usernameImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "user-icon")
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
    
    let passwordImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "lock-icon")
        imgView.contentMode = .scaleAspectFill
        
        return imgView
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.clearButtonMode = .whileEditing
        textField.textColor = UIColor(named: "black")
        textField.font = UIFont(name: "Roboto", size: 24)
        textField.textAlignment = .left
        
        return textField
    }()
    
    //MARK: - ViewDidLoad Function
    
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
        
        //Text Fields Container handler
        view.addSubview(textFieldsContainer)
        setTextFieldsContainerConstraints()
        
        //Button container handlers
        view.addSubview(buttonContainer)
        setButtonContainerConstraints()
        
        //Log In Button handlers
        buttonContainer.addSubview(logInButton)
        setLogInButtonConstraints()
        
        //Button Label handlers
        buttonContainer.addSubview(questionLabel)
        setQuestionLabelConstraints()
        buttonContainer.addSubview(linkLabel)
        setLinkLabelConstraints()
        
        //Divider View handlers
        textFieldsContainer.addSubview(dividerView)
        setDividerViewConstraints()
        
        //Username Text Field Container handlers
        textFieldsContainer.addSubview(usernameTextFieldContainer)
        setUsernameTextFieldContainerContraints()
        
        //Password Text Field Container handlers
        textFieldsContainer.addSubview(passwordTextFieldContainer)
        setPasswordTextFieldContainerContraints()
        
        //Username Elements handlers
        usernameTextFieldContainer.addSubview(usernameImage)
        usernameTextFieldContainer.addSubview(usernameTextField)
        setUsernameImageConstraints()
        setUsernameTextFieldConstraints()
        
        //Password Elements handlers
        passwordTextFieldContainer.addSubview(passwordImage)
        passwordTextFieldContainer.addSubview(passwordTextField)
        setPasswordImageContraints()
        setPasswordTextFieldConstraints()
        
        //Segue handler
        setUpIBActions()
        
    }
    
    //MARK: - Contraint Functions
    
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
    
    func setButtonContainerConstraints(){
        buttonContainer.translatesAutoresizingMaskIntoConstraints = false
        buttonContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        buttonContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        buttonContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        buttonContainer.topAnchor.constraint(equalTo: textFieldsContainer.bottomAnchor).isActive = true
    }
    
    func setLogInButtonConstraints(){
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.topAnchor.constraint(equalTo: buttonContainer.topAnchor).isActive = true
        logInButton.leadingAnchor.constraint(equalTo: buttonContainer.leadingAnchor).isActive = true
        logInButton.trailingAnchor.constraint(equalTo: buttonContainer.trailingAnchor).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setQuestionLabelConstraints(){
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.topAnchor.constraint(equalTo: logInButton.bottomAnchor).isActive = true
        questionLabel.leadingAnchor.constraint(equalTo: buttonContainer.leadingAnchor).isActive = true
        questionLabel.widthAnchor.constraint(equalTo: buttonContainer.widthAnchor, multiplier: 0.5).isActive = true
        
    }
    
    func setLinkLabelConstraints(){
        linkLabel.translatesAutoresizingMaskIntoConstraints = false
        linkLabel.leadingAnchor.constraint(equalTo: questionLabel.trailingAnchor).isActive = true
        linkLabel.trailingAnchor.constraint(equalTo: buttonContainer.trailingAnchor, constant: 5).isActive = true
        linkLabel.topAnchor.constraint(equalTo: logInButton.bottomAnchor).isActive = true
    }
    
    func setTextFieldsContainerConstraints(){
        textFieldsContainer.translatesAutoresizingMaskIntoConstraints = false
        textFieldsContainer.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        textFieldsContainer.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        textFieldsContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        textFieldsContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        textFieldsContainer.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    func setDividerViewConstraints(){
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.leadingAnchor.constraint(equalTo: textFieldsContainer.leadingAnchor).isActive = true
        dividerView.trailingAnchor.constraint(equalTo: textFieldsContainer.trailingAnchor).isActive = true
        dividerView.centerYAnchor.constraint(equalTo: textFieldsContainer.centerYAnchor).isActive = true
        dividerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.06).isActive = true
    }
    
    func setUsernameTextFieldContainerContraints(){
        usernameTextFieldContainer.translatesAutoresizingMaskIntoConstraints = false
        usernameTextFieldContainer.bottomAnchor.constraint(equalTo: dividerView.topAnchor).isActive = true
        usernameTextFieldContainer.leadingAnchor.constraint(equalTo: textFieldsContainer.leadingAnchor).isActive = true
        usernameTextFieldContainer.trailingAnchor.constraint(equalTo: textFieldsContainer.trailingAnchor).isActive = true
        usernameTextFieldContainer.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    }
    
    func setPasswordTextFieldContainerContraints(){
        passwordTextFieldContainer.translatesAutoresizingMaskIntoConstraints = false
        passwordTextFieldContainer.topAnchor.constraint(equalTo: dividerView.bottomAnchor).isActive = true
        passwordTextFieldContainer.leadingAnchor.constraint(equalTo: textFieldsContainer.leadingAnchor).isActive = true
        passwordTextFieldContainer.trailingAnchor.constraint(equalTo: textFieldsContainer.trailingAnchor).isActive = true
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
    
    func setPasswordImageContraints(){
        passwordImage.translatesAutoresizingMaskIntoConstraints = false
        passwordImage.leadingAnchor.constraint(equalTo: passwordTextFieldContainer.leadingAnchor).isActive = true
        passwordImage.topAnchor.constraint(equalTo: passwordTextFieldContainer.topAnchor).isActive = true
        passwordImage.bottomAnchor.constraint(equalTo: passwordTextFieldContainer.bottomAnchor).isActive = true
        passwordImage.widthAnchor.constraint(equalTo: passwordImage.heightAnchor).isActive = true
    }
    
    func setPasswordTextFieldConstraints(){
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.leadingAnchor.constraint(equalTo: passwordImage.trailingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldContainer.trailingAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldContainer.topAnchor).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldContainer.bottomAnchor).isActive = true
    }
    
    //MARK: - Segue Functions
    @objc func backButtonClicked(){
        let page = HomeViewController()
        page.modalPresentationStyle = .fullScreen
        present(page, animated: true, completion: nil)
    }
    
    @objc func linkLabelClicked(){
        let page = SignUpViewController()
        page.modalPresentationStyle = .fullScreen
        present(page, animated: true, completion: nil)
    }
    
    @objc func logInButtonClicked(sender: UIButton){
        let navController = UINavigationController(rootViewController: DashboardViewController())
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
    }
    
    func setUpIBActions(){
        //Link Label Set-Up
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.linkLabelClicked))
        linkLabel.isUserInteractionEnabled = true
        linkLabel.addGestureRecognizer(tap)
        
        //Back Button Set-Up
        backButton.addTarget(self, action: #selector(self.backButtonClicked), for: .touchUpInside)
        
        //LogIn Button Set-Up
        logInButton.addTarget(self, action: #selector(self.logInButtonClicked(sender:)), for: .touchUpInside)
        
    }

}
