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
   }
   
   override func setAddTarget() {
      let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
      self.view.addGestureRecognizer(tapGesture)
      
      
      // MARK: - DidEndOnExit 파트
      // id 텍스트 필드 에디팅이 끝났을 때 - 컨트롤 이벤트
      loginView.idTextField.rx.controlEvent(.editingDidEndOnExit)
      // 해당 컨트롤 이벤트를 구독
         .subscribe({ [weak self] _ in
            // 해당 이벤트에서 진행하는 내용
            // pw 텍스트필드가 첫번째 responder로 설정됨
            self?.loginView.passwordTextField.becomeFirstResponder()
         })
         .disposed(by: disposeBag) // 위 구독 내용 disposeBag 묶어주기
      
      loginView.passwordTextField.rx.controlEvent(.editingDidEndOnExit)
         .subscribe({ [weak self] _ in
            self?.loginView.passwordTextField.resignFirstResponder()
         })
         .disposed(by: disposeBag)
      
      // MARK: - BeginEditing 파트
      loginView.idTextField.rx.controlEvent(.editingDidBegin)
         .subscribe({ [weak self] _ in
            self?.loginView.idTextField.makeBorderLine(width: 1, color: .gray2)
         })
         .disposed(by: disposeBag)
      
      loginView.passwordTextField.rx.controlEvent(.editingDidBegin)
         .subscribe({ [weak self] _ in
            self?.loginView.passwordTextField.makeBorderLine(width: 1, color: .gray2)
         })
         .disposed(by: disposeBag)
      
      // MARK: - EndEditing 파트
      loginView.idTextField.rx.controlEvent(.editingDidEnd)
         .subscribe({ [weak self] _ in
            self?.loginView.idTextField.makeBorderLine(width: 0, color: .clear)
         })
         .disposed(by: disposeBag)
      
      loginView.passwordTextField.rx.controlEvent(.editingDidEnd)
         .subscribe({ [weak self] _ in
            self?.loginView.passwordTextField.makeBorderLine(width: 0, color: .clear)
         })
         .disposed(by: disposeBag)
      
      
      let idTextObservable = loginView.idTextField.rx.text.orEmpty.asObservable()
      let passwordTextObservable = loginView.passwordTextField.rx.text.orEmpty.asObservable()
      
      // 두 텍스트 필드의 텍스트를 합성하여 버튼 상태를 업데이트
      Observable.combineLatest(idTextObservable, passwordTextObservable) { idText, passwordText in
         return (idText, passwordText)
      }
      .subscribe(onNext: { [weak self] idText, passwordText in
         guard let self = self else { return }
         let loginBtn = self.loginView.loginButton
         
         // 패스워드 텍스트필드가 안비었을 때
         if !passwordText.isEmpty {
            self.loginView.clearButton.isHidden = false
            self.loginView.clearButton.isEnabled = true
            self.loginView.eyeButton.isHidden = false
            self.loginView.eyeButton.isEnabled = true
         } else {
            self.loginView.clearButton.isHidden = true
            self.loginView.clearButton.isEnabled = false
            self.loginView.eyeButton.isHidden = true
            self.loginView.eyeButton.isEnabled = false
         }
         
         // 로그인 버튼 상태 업데이트
         if !idText.isEmpty, !passwordText.isEmpty {
            loginBtn.isEnabled = true
            loginBtn.backgroundColor = .mainColor
            loginBtn.setTitleColor(.white, for: .normal)
         } else {
            loginBtn.isEnabled = false
            loginBtn.backgroundColor = .black
            loginBtn.setTitleColor(.gray2, for: .normal)
         }
      })
      .disposed(by: disposeBag)
      
      // 로그인 버튼 탭 이벤트 처리
      loginView.loginButton.rx.tap
         .subscribe(onNext: { [weak self] in
            guard let self = self else { return } //text가 있을 경우 가정이기에 옵셔널 체이닝
            if let idText = self.loginView.idTextField.text, let passwordText = self.loginView.passwordTextField.text {
               if !idText.isEmpty, !passwordText.isEmpty {
                  let welcomeVC = WelcomeViewController()
                  welcomeVC.nickname = idText
                  self.navigationController?.pushViewController(welcomeVC, animated: true)
               }
            }
         })
         .disposed(by: disposeBag)
      
      // Clear 버튼 탭 이벤트 처리
      loginView.clearButton.rx.tap
         .subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            print("지금 눌림")
            self.loginView.passwordTextField.text = ""
         })
         .disposed(by: disposeBag)
      
      // Eye 버튼 탭 이벤트 처리
      loginView.eyeButton.rx.tap
         .subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            print("지금 didTapEyeButton눌림")
            self.loginView.eyeButton.isSelected.toggle()
            self.loginView.passwordTextField.isSecureTextEntry.toggle()
         })
         .disposed(by: disposeBag)
      
   }
   
}
