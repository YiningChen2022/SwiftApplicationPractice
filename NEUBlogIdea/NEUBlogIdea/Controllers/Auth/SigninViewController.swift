//
//  SigninViewController.swift
//  NEUBlogIdea
//
//  Created by Yining Chen on 10/4/21.
//

import UIKit

class SigninViewController: UITabBarController {
    
    //Header View
    private let headerView = SigninHeaderView()
    
    //Email Field
    private let emailField: UITextField = {
        let field=UITextField();
        field.keyboardType = .emailAddress
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="Email Address"
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        return field
    }()
    //password Field
    private let passwordField: UITextField = {
        let field=UITextField();
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="Password"
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.isSecureTextEntry=true
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        return field
    }()
    //sign in button
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Sign In", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    //Create Account
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Create Account", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"
        view.backgroundColor = .systemBackground
        view.addSubview(headerView)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signInButton)
        view.addSubview(createAccountButton)
        
        signInButton.addTarget(self, action:#selector(didTapSignIn),for: .touchUpInside)
        
        createAccountButton.addTarget(self, action:#selector(didTapCreateAccount),for: .touchUpInside)
        
        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            if !IAPManager.shared.isPremium(){
                let vc=PayWallViewController()
                let navVC = UINavigationController(rootViewController: vc)
                self.present(navVC,animated:true,completion:nil)
            }
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerView.frame=CGRect(x:0,y:view.safeAreaInsets.top,width: view.width, height: view.height/5)
        emailField.frame = CGRect(x:20, y:headerView.bottom, width:view.width-40,height:50)
        passwordField.frame = CGRect(x:20, y:emailField.bottom+10, width:view.width-40,height:50)
        signInButton.frame = CGRect(x:20, y:passwordField.bottom+10, width:view.width-40,height:50)
        createAccountButton.frame = CGRect(x:20, y:signInButton.bottom+40, width:view.width-40,height:50)
    }
    @objc func didTapSignIn(){
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty
        else{
            return
        }
        AuthManager.shared.signIn(email: email, password: password){[weak self ]
            success in
            guard success else {
                return
            }
            DispatchQueue.main.async {
                UserDefaults.standard.set (email, forKey:"email")
                let vc = TabBarViewController()
                vc.modalPresentationStyle = .fullScreen
                self?.present(vc, animated:true)
                
            }
            
        }
    }
    @objc func didTapCreateAccount(){
        let vc=SignUpViewController()
        vc.title="Create Account"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }


}
