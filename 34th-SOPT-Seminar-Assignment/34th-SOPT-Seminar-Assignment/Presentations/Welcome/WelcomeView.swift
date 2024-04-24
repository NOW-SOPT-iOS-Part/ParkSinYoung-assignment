//
//  WelcomeView.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 4/19/24.
//

import UIKit
import SnapKit
import Then

final class WelcomeView: BaseView {
   
   let logoImageView = UIImageView().then {
      $0.image = UIImage(named: "Logo")
      $0.contentMode = .scaleAspectFill
   }
   
   let welcomeTitleLabel = UILabel().then {
      $0.textColor = .gray1
      $0.textAlignment = .center
      $0.numberOfLines = 0
      $0.font = UIFont.pretendard(size: 23, weight: .bold)
   }
   
   let backToMainButton = UIButton().then {
      $0.setButtonTitle(StringLiterals.Login.backToMain, titleColor: .white, font: UIFont.pretendard(size: 14, weight: .semibold), for: .normal)
      $0.backgroundColor = .mainColor
      $0.layer.cornerRadius = 3
   }
   
   
   override func setHierarchy() {
      self.addSubviews(logoImageView, welcomeTitleLabel, backToMainButton)
   }
   
   override func setLayout() {
      logoImageView.snp.makeConstraints {
         $0.top.equalTo(safeAreaLayoutGuide).inset(14)
         $0.leading.trailing.equalToSuperview()
      }
      
      welcomeTitleLabel.snp.makeConstraints {
         $0.top.equalTo(logoImageView.snp.bottom).offset(67)
         $0.centerX.equalToSuperview()
      }
      
      backToMainButton.snp.makeConstraints {
         $0.height.equalTo(52)
         $0.horizontalEdges.equalToSuperview().inset(20)
         $0.bottom.equalToSuperview().offset(-66)
      }
   }
   
}
