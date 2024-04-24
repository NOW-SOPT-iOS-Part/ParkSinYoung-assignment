//
//  LoginViewController.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 4/19/24.
//

import UIKit
import SnapKit
import Then

final class LoginViewController: BaseViewController {
   
   private let loginView = LoginView()
   private var isLoginAble = false
   
   override func loadView() {
       view = loginView
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .black
      loginView.idTextField.delegate = self
      loginView.passwordTextField.delegate = self
   }
   
   override func setAddTarget() {
      loginView.loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
      loginView.clearButton.addTarget(self, action: #selector(didTapClearButton), for: .touchUpInside)
      loginView.eyeButton.addTarget(self, action: #selector(didTapEyeButton), for: .touchUpInside)
      
      let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
              self.view.addGestureRecognizer(tapGesture)
   }
   
}

extension LoginViewController: UITextFieldDelegate {
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      if textField == loginView.idTextField {
         loginView.passwordTextField.becomeFirstResponder()
      } else {
         loginView.passwordTextField.resignFirstResponder()
      }
      return true
   }
   
   func textFieldDidBeginEditing(_ textField: UITextField) {
      textField.makeBorderLine(width: 1, color: .gray2())
   }
   
   func textFieldDidEndEditing(_ textField: UITextField) {
      textField.makeBorderLine(width: 0, color: .clear)
   }
   
   func textFieldDidChangeSelection(_ textField: UITextField) {
      let loginBtn = loginView.loginButton
      
      if let idText = loginView.idTextField.text, let passwordText = loginView.passwordTextField.text {
         if passwordText.count != 0 {
            loginView.clearButton.isHidden = false
            loginView.clearButton.isEnabled = true
            loginView.eyeButton.isHidden = false
            loginView.eyeButton.isEnabled = true
//            $0
         }
         
         if !idText.isEmpty, !passwordText.isEmpty {
            loginBtn.isEnabled = true
            loginBtn.backgroundColor = .mainColor()
            loginBtn.setTitleColor(.white, for: .normal)
         } else {
            loginBtn.isEnabled = false
            loginBtn.backgroundColor = .black()
            loginBtn.setTitleColor(.gray2(), for: .normal)
         }
      }
   }
   
   @objc func didTapLoginButton() {
      if let idText = loginView.idTextField.text, let passwordText = loginView.passwordTextField.text {
         if !idText.isEmpty, !passwordText.isEmpty {
            let welcomeVC = WelcomeViewController()
            welcomeVC.nickname = loginView.idTextField.text
            self.navigationController?.pushViewController(welcomeVC, animated: true)
         }
      }
   }
   
   @objc func didTapClearButton(_ sender: UIButton) {
      print("지금 눌림")
      loginView.passwordTextField.text = ""
   }
   
   @objc func didTapEyeButton(_ sender: UIButton) {
      print("지금 didTapEyeButton눌림")
      if loginView.eyeButton.isSelected == false {
         loginView.eyeButton.isSelected = true
         loginView.passwordTextField.isSecureTextEntry = false
      } else {
         loginView.eyeButton.isSelected = false
         loginView.passwordTextField.isSecureTextEntry = true
      }
   }
   
}
   

