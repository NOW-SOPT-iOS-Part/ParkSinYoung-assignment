//
//  LoginView.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 4/19/24.
//

import UIKit
import SnapKit
import Then

final class LoginView: BaseView {
   
   let titleLabel = UILabel().then {
      $0.text = StringLiterals.Login.title
      $0.textColor = .gray1
      $0.font = UIFont.pretendard(size: 23, weight: .medium)
   }
   
   let idTextField = UITextField().then {
      $0.backgroundColor = .gray4
      $0.textColor = .gray2
      $0.font = UIFont.pretendard(size: 15, weight: .semibold)
      $0.setPlaceholderColor(placeholderColor: .gray2, StringLiterals.Login.idTextField)
      $0.setLeftPaddingPoints(22)
      $0.layer.cornerRadius = 3
      $0.clearButtonMode = .whileEditing
      $0.autocorrectionType = .no
      $0.spellCheckingType = .no
   }
   
   let passwordTextField = UITextField().then {
      $0.backgroundColor = .gray4
      $0.textColor = .gray2
      $0.font = UIFont.pretendard(size: 15, weight: .semibold)
      $0.setPlaceholderColor(placeholderColor: .gray2, StringLiterals.Login.passwordTextField)
      $0.setLeftPaddingPoints(22)
      $0.layer.cornerRadius = 3
      $0.isSecureTextEntry = true
      $0.autocorrectionType = .no
      $0.spellCheckingType = .no
   }
   
   let loginButton = UIButton().then {
      $0.setButtonTitle(StringLiterals.Login.loginButton, titleColor: .gray2, font: UIFont.pretendard(size: 14, weight: .semibold), for: .normal)
      $0.backgroundColor = .black
      $0.layer.cornerRadius = 3
      $0.makeBorderLine(width: 1, color: .gray4)
      $0.isEnabled = false
   }
   
   let findIdButton = UIButton().then {
      $0.setButtonTitle(StringLiterals.Login.findIdButton, titleColor: .gray2, font: UIFont.pretendard(size: 14, weight: .semibold), for: .normal)
   }
   
   let findPasswordButton = UIButton().then {
      $0.setButtonTitle(StringLiterals.Login.findPasswordButton, titleColor: .gray2, font: UIFont.pretendard(size: 14, weight: .semibold), for: .normal)
   }
   
   let toFindIdPwStackView = UIStackView().then {
      $0.axis = .horizontal
      $0.spacing = 33
   }
   
   let divider: UIView = {
      let view = UIView()
      view.backgroundColor = .gray4
      return view
   }()
   
   let noAccountLabel = UILabel().then {
      $0.text = StringLiterals.Login.nonAccount
      $0.textColor = .gray3
      $0.font = UIFont.pretendard(size: 14, weight: .semibold)
   }
   
   let nicknameCreationButton = UIButton().then {
      $0.setButtonTitle(StringLiterals.Login.nicknameCreation, titleColor: .gray2, font: UIFont.pretendard(size: 14, weight: .regular), for: .normal)
      $0.addUnderlineToTitle()
   }
   
   let accountStackView = UIStackView().then {
      $0.axis = .horizontal
      $0.spacing = 33
   }
   
   
   lazy var clearButton = UIButton().then {
      $0.setImage(UIImage(named: "x-circle"), for: .normal)
      $0.imageView?.snp.makeConstraints{
         $0.size.equalTo(20)
      }
      $0.contentMode = .scaleAspectFit
      $0.isHidden = true
   }
   
   lazy var eyeButton = UIButton().then {
      $0.setImage(UIImage(named: "eye-slash"), for: .normal)
      $0.setImage(UIImage(named: "eye"), for: .selected)
      $0.imageView?.snp.makeConstraints{
         $0.size.equalTo(20)
      }
      $0.isHidden = true
   }
   
   let stackView = UIStackView().then {
      $0.axis = .horizontal
      $0.spacing = 16
   }
   
   
   override func setHierarchy() {
      self.addSubviews(titleLabel, idTextField, passwordTextField, loginButton, toFindIdPwStackView, accountStackView)
      
      
      toFindIdPwStackView.addArrangedSubviews(findIdButton, divider, findPasswordButton)
      
      accountStackView.addArrangedSubviews(noAccountLabel, nicknameCreationButton)
      passwordTextField.addSubviews(clearButton, eyeButton)
   }
   
   override func setLayout() {
      titleLabel.snp.makeConstraints {
         $0.top.equalTo(safeAreaLayoutGuide).inset(50)
         $0.centerX.equalToSuperview()
      }
      
      idTextField.snp.makeConstraints {
         $0.height.equalTo(52)
         $0.top.equalTo(titleLabel.snp.bottom).offset(31)
         $0.horizontalEdges.equalToSuperview().inset(20)
      }
      
      passwordTextField.snp.makeConstraints {
         $0.height.equalTo(idTextField)
         $0.top.equalTo(idTextField.snp.bottom).offset(7)
         $0.horizontalEdges.equalTo(idTextField)
      }
      
      loginButton.snp.makeConstraints {
         $0.height.equalTo(idTextField)
         $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
         $0.horizontalEdges.equalTo(idTextField)
      }
      
      toFindIdPwStackView.snp.makeConstraints {
         $0.top.equalTo(loginButton.snp.bottom).offset(31)
         $0.centerX.equalToSuperview()
      }
      
      divider.snp.makeConstraints {
         $0.width.equalTo(1)
         $0.height.equalTo(12)
         $0.centerY.equalToSuperview()
      }
      
      accountStackView.snp.makeConstraints {
         $0.top.equalTo(findIdButton.snp.bottom).offset(28)
         $0.centerX.equalToSuperview()
      }
      
      eyeButton.snp.makeConstraints {
         $0.centerY.equalToSuperview()
         $0.trailing.equalToSuperview().offset(-14)
      }
      
      clearButton.snp.makeConstraints {
         $0.centerY.equalToSuperview()
         $0.trailing.equalTo(eyeButton.snp.leading).offset(-16)
      }
   }
   
}
