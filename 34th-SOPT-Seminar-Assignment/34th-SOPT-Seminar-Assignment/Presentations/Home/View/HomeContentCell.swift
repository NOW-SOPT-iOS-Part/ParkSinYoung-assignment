//
//  HomeContentCell.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 4/30/24.
//

import UIKit
import SnapKit
import Then

class HomeContentCell: UICollectionViewCell {
   
   static let identifier = "ContentCell"
   
   //프로그램 이미지
   let contentImage = UIImageView()
   //프로그램 제목
   let titleLabel = UILabel()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      setUI()
      setHierarchy()
      setLayout()
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   private func setUI() {
      titleLabel.do {
         $0.font = .pretendard(size: 10, weight: .medium)
         $0.textColor = .gray2
         $0.textAlignment = .left
      }
   }
   
   private func setHierarchy() {
      self.addSubviews(contentImage, titleLabel)
   }
   
   private func setLayout() {
      contentImage.snp.makeConstraints {
         $0.top.horizontalEdges.equalToSuperview()
         $0.height.equalTo(150)
      }
      
      titleLabel.snp.makeConstraints {
         $0.top.equalTo(contentImage.snp.bottom).offset(5)
         $0.leading.equalToSuperview()
      }
   }
   
   func dataBind(image: UIImage, title: String) {
      self.contentImage.image = image
      self.titleLabel.text = title
   }
}
