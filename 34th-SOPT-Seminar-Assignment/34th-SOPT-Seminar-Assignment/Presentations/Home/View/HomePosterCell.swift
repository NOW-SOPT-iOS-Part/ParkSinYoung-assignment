//
//  HomePosterCell.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 4/30/24.
//

import UIKit
import SnapKit
import Then

class HomePosterCell: UICollectionViewCell {
   
   static let identifier = "PosterCell"
   
   //포스터 이미지
   private let posterImage = UIImageView()
   //포스터 제목
   private let titleLabel = UILabel()
   //포스터 설명
   private let contentLabel = UILabel()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .white
      setUI()
      setHierarchy()
      setLayout()
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   private func setUI() {
      titleLabel.do {
         $0.font = .pretendard(size: 24, weight: .bold)
         $0.textColor = .white
      }
      contentLabel.do {
         $0.font = .pretendard(size: 17, weight: .medium)
         $0.textColor = .white
         $0.numberOfLines = 2
      }
   }
   
   private func setHierarchy() {
      self.addSubviews(posterImage, titleLabel, contentLabel)
   }
   
   private func setLayout() {
      posterImage.snp.makeConstraints {
         $0.verticalEdges.horizontalEdges.equalToSuperview()
      }
      
      titleLabel.snp.makeConstraints {
         $0.leading.equalToSuperview().inset(20)
         $0.bottom.equalToSuperview().offset(-80)
      }
      
      contentLabel.snp.makeConstraints {
         $0.leading.equalTo(titleLabel)
         $0.top.equalTo(titleLabel.snp.bottom).offset(15)
      }
   }
   
   func dataBind(_ poster: PosterModel) {
      self.posterImage.image = poster.image
      self.titleLabel.text = poster.title
      self.contentLabel.text = poster.content
   }
   
}
