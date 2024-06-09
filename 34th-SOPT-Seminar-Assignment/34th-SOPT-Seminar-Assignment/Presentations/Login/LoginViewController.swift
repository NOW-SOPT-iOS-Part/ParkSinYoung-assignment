//
//  LoginViewController.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 4/19/24.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

final class LoginViewController: BaseViewController {
   
   private let loginView = LoginView()
   private var isLoginAble = false
   private let disposeBag = DisposeBag()
   
   override func loadView() {
      view = loginView
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .black
      bindUI()
   }
   
   private func bindUI() {
      // 텍스트 필드의 이벤트 바인딩
      bindTextFieldEvents()
      
      // 텍스트 필드 입력 내용으로 로그인 버튼 상태 관리
      bindTextFieldsForLoginButton()
      
      // 로그인 버튼 탭 이벤트 처리
      bindLoginButtonTap()
      
      // Clear 버튼 탭 이벤트 처리
      bindClearButtonTap()
      
      // Eye 버튼 탭 이벤트 처리
      bindEyeButtonTap()
   }
   
   private func bindTextFieldEvents() {
      // DidEndOnExit 이벤트 바인딩
      loginView.idTextField.rx.controlEvent(.editingDidEndOnExit)
         .subscribe(onNext: { [weak self] in
            self?.loginView.passwordTextField.becomeFirstResponder()
         })
         .disposed(by: disposeBag)
      
      loginView.passwordTextField.rx.controlEvent(.editingDidEndOnExit)
         .subscribe(onNext: { [weak self] in
            self?.loginView.passwordTextField.resignFirstResponder()
         })
         .disposed(by: disposeBag)
      
      // BeginEditing 이벤트 바인딩
      loginView.idTextField.rx.controlEvent(.editingDidBegin)
         .subscribe(onNext: { [weak self] in
            self?.loginView.idTextField.makeBorderLine(width: 1, color: .gray2)
         })
         .disposed(by: disposeBag)
      
      loginView.passwordTextField.rx.controlEvent(.editingDidBegin)
         .subscribe(onNext: { [weak self] in
            self?.loginView.passwordTextField.makeBorderLine(width: 1, color: .gray2)
         })
         .disposed(by: disposeBag)
      
      // EndEditing 이벤트 바인딩
      loginView.idTextField.rx.controlEvent(.editingDidEnd)
         .subscribe(onNext: { [weak self] in
            self?.loginView.idTextField.makeBorderLine(width: 0, color: .clear)
         })
         .disposed(by: disposeBag)
      
      loginView.passwordTextField.rx.controlEvent(.editingDidEnd)
         .subscribe(onNext: { [weak self] in
            self?.loginView.passwordTextField.makeBorderLine(width: 0, color: .clear)
         })
         .disposed(by: disposeBag)
   }
   
   private func bindTextFieldsForLoginButton() {
      let idTextObservable = loginView.idTextField.rx.text.orEmpty.asObservable()
      let passwordTextObservable = loginView.passwordTextField.rx.text.orEmpty.asObservable()
      
      Observable.combineLatest(idTextObservable, passwordTextObservable)
         .subscribe(onNext: { [weak self] idText, passwordText in
            guard let self = self else { return }
            
            self.updateLoginButtonState(idText: idText, passwordText: passwordText)
            self.updateClearAndEyeButtonsState(passwordText: passwordText)
         })
         .disposed(by: disposeBag)
   }
   
   private func updateLoginButtonState(idText: String, passwordText: String) {
      let loginButton = loginView.loginButton
      if !idText.isEmpty && !passwordText.isEmpty {
         loginButton.isEnabled = true
         loginButton.backgroundColor = .mainColor
         loginButton.setTitleColor(.white, for: .normal)
      } else {
         loginButton.isEnabled = false
         loginButton.backgroundColor = .black
         loginButton.setTitleColor(.gray2, for: .normal)
      }
   }
   
   private func updateClearAndEyeButtonsState(passwordText: String) {
      let clearButton = loginView.clearButton
      let eyeButton = loginView.eyeButton
      
      if !passwordText.isEmpty {
         clearButton.isHidden = false
         clearButton.isEnabled = true
         eyeButton.isHidden = false
         eyeButton.isEnabled = true
      } else {
         clearButton.isHidden = true
         clearButton.isEnabled = false
         eyeButton.isHidden = true
         eyeButton.isEnabled = false
      }
   }
   
   private func bindLoginButtonTap() {
      loginView.loginButton.rx.tap
         .subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.handleLogin()
         })
         .disposed(by: disposeBag)
   }
   
   private func handleLogin() {
      if let idText = loginView.idTextField.text, let passwordText = loginView.passwordTextField.text {
         if !idText.isEmpty && !passwordText.isEmpty {
            let welcomeVC = WelcomeViewController()
            welcomeVC.nickname = idText
            self.navigationController?.pushViewController(welcomeVC, animated: true)
         }
      }
   }
   
   private func bindClearButtonTap() {
      loginView.clearButton.rx.tap
         .subscribe(onNext: { [weak self] in
            self?.loginView.passwordTextField.text = ""
         })
         .disposed(by: disposeBag)
   }
   
   private func bindEyeButtonTap() {
      loginView.eyeButton.rx.tap
         .subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.loginView.eyeButton.isSelected.toggle()
            self.loginView.passwordTextField.isSecureTextEntry.toggle()
         })
         .disposed(by: disposeBag)
   }
}
