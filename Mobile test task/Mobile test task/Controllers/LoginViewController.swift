//
//  LoginViewController.swift
//  Mobile Test Task
//
//  Created by Mac on 30/09/2022.
//

import UIKit

//MARK: - Objects Properties
class LoginViewController: UIViewController {
    
    lazy var loginTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 23, weight: .medium)
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.returnKeyType = .continue
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 8
        textField.backgroundColor = .systemGray5
        textField.placeholder = "email"
        
        return textField
    }()
    
    lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.returnKeyType = .continue
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 8
        textField.backgroundColor = .systemGray5
        textField.placeholder = "password"
        
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        var button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        return button
    }()
    //MARK: - The View
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .white
    }
    
    //MARK: - Regex Email Validation
    func isValidEmail(testStrEmail: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: testStrEmail)
    }
    
    //MARK: - Regex Password Validation
    func isValidPassword(testStrPassword: String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za\\d$@$#!%*?&]{6,17}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        let passwordResult = passwordTest.evaluate(with: testStrPassword)
        return passwordResult
    }
    
    //MARK: - The function the login to a new Viewcontroller tapped button
    @objc func loginButtonTapped() {
        let email = isValidEmail(testStrEmail: emailTextField.text!)
        let password = isValidPassword(testStrPassword: passwordTextField.text!)
        if email == true || password == true {
            let nextScreen = ShowDataViewController()
            nextScreen.modalPresentationStyle = .fullScreen
            self.present(nextScreen, animated: true, completion: nil)
        }else {
            errorLabel.text = "Invalid email and password format"
        }
    }
    
    //MARK: - Setting up the views and constraints
    func setupViews() {
        let subViews = [loginTitleLabel, emailTextField, errorLabel, passwordTextField, loginButton]
        for subView in subViews {
            view.addSubview(subView)
        }
        
        NSLayoutConstraint.activate([
            loginTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            emailTextField.topAnchor.constraint(equalTo: loginTitleLabel.bottomAnchor, constant: 80),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.widthAnchor.constraint(equalToConstant: 337),
            
            errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            errorLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5),
            
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            passwordTextField.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 13),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.widthAnchor.constraint(equalToConstant: 337),
            
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 18),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 337)
        ])
    }
}
