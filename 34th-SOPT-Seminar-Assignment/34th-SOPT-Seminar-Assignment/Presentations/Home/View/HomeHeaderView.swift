//
//  HomeHeaderView.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 4/30/24.
//

import UIKit
import SnapKit
import Then

class HomeHeaderView: UICollectionReusableView {
   
   static let identifier = "HeaderView"
   
   //프로그램 헤더 제목
   let titleLabel = UILabel()
   // 전체보기 버튼
   let fullViewBtn = UIButton()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      setUI()
      setHierarchy()
      setLayout()
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder: ) has not been implemented")
   }
   
   private func setUI() {
      titleLabel.do {
         $0.font = .pretendard(size: 15, weight: .bold)
         $0.textColor = .white
      }
      
      fullViewBtn.do {
         $0.setButtonTitle(StringLiterals.Main.fullViewBtn, titleColor: .white, font: .pretendard(size: 11, weight: .semibold), for: .normal)
      }
      
   }
   
   private func setHierarchy() {
      self.addSubviews(titleLabel, fullViewBtn)
   }
   
   private func setLayout() {
      titleLabel.snp.makeConstraints {
         $0.leading.equalToSuperview()
         $0.centerY.equalToSuperview()
      }
      
      fullViewBtn.snp.makeConstraints {
         $0.trailing.equalToSuperview()
         $0.centerY.equalToSuperview()
      }
   }
   
   func dataBind(title: String) {
      self.titleLabel.text = title
   }
}
