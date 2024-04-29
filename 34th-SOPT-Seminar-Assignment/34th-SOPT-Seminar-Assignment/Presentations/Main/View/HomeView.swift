//
//  MainView.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 4/25/24.
//

import UIKit
import SnapKit
import Then

protocol HomeViewDelegate: AnyObject {
    func scrollViewDidScroll(_ scrollView: UIScrollView)
}

final class HomeView: BaseView {
   
   weak var delegate: HomeViewDelegate?
   var navigationBarHeight: CGFloat = 0
   
   let scrollView = UIScrollView()
   let contentView = UIView()
   
   
   lazy var homePosterArr: [UIImageView] = [homePoster1, homePoster2, homePoster3, homePoster4]
   let homePoster1 = UIImageView(image: UIImage(resource: .homePoster1))
   let homePoster2 = UIImageView(image: UIImage(resource: .homePoster1))
   let homePoster3 = UIImageView(image: UIImage(resource: .homePoster1))
   let homePoster4 = UIImageView(image: UIImage(resource: .homePoster1))
   
   let pageNationStackView = UIStackView()
   let pageControl = UIPageControl()
   
   override func setUI() {
      scrollView.delegate = self
      
      scrollView.do {
         $0.showsVerticalScrollIndicator = false
      }
      
      homePoster1.do {
         $0.isUserInteractionEnabled = true
      }
      pageNationStackView.do {
         $0.spacing = 4
         $0.axis = .horizontal
         $0.alignment = .center
      }
   }
   
   override func setHierarchy() {
      addSubview(scrollView)
      scrollView.addSubview(contentView)
      contentView.addSubviews(homePoster1, pageNationStackView)
      
      for _ in homePosterArr {
         let pageNationCircle = UIView()
         
         pageNationCircle.do {
            $0.backgroundColor = .gray3
            $0.layer.cornerRadius = 6 / 2
            $0.clipsToBounds = true
         }
         
         pageNationCircle.snp.makeConstraints {
            $0.size.equalTo(6)
         }
         
         pageNationStackView.addArrangedSubview(pageNationCircle)
      }
      
   }
   
   override func setLayout() {
      scrollView.snp.makeConstraints {
         $0.leading.trailing.bottom.equalToSuperview()
         $0.top.equalToSuperview().offset(-98)
      }
      
      contentView.snp.makeConstraints {
         $0.edges.equalTo(scrollView)
         $0.width.equalTo(scrollView)
         $0.height.greaterThanOrEqualToSuperview().priority(.low)
      }
      
      homePoster1.snp.makeConstraints {
         $0.top.leading.trailing.equalToSuperview()
         $0.height.equalTo(550)
      }
      
      pageNationStackView.snp.makeConstraints {
         $0.top.equalTo(homePoster1.snp.bottom).offset(16)
         $0.leading.equalToSuperview().inset(21)
      }
      
   }
   
   private func setPageControl() {
      pageControl.numberOfPages = homePosterArr.count
   }
   
}

extension HomeView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidScroll(scrollView)
    }
}
