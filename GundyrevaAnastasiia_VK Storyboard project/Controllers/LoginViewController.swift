//
//  ViewController.swift
//  GundyrevaAnastasiia_VK Storyboard project
//
//  Created by Asya Checkanar on 29.11.2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGR)
    }
    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
        
        @objc func willShowKeyboard(_ notification: Notification) {
            
            guard let info = notification.userInfo as NSDictionary?,
                  let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {return}
            let keyboardHeight = keyboardSize.cgRectValue.size.height
            
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        }
    @objc func willHideKeyboard(_ notification: Notification) {
        guard let info = notification.userInfo as NSDictionary?,
              let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {return}
        let keyboardHeight = keyboardSize.cgRectValue.size.height
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: -keyboardHeight, right: 0)
    }
    
    
    @IBAction func tapLoginButton(_ sender: UIButton) {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text,
              username == "",
              password == "" else {
            
            show(message: "Error wrong password")
            return
            
        }
        performSegue(withIdentifier: "Login", sender: nil)
    }
}

