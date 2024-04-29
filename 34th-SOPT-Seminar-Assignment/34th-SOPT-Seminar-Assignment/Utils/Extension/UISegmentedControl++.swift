//
//  UISegmentedControl++.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 4/25/24.
//

import UIKit
import Then

final class UnderlineSegmentedControl: UISegmentedControl {
   
   // 세그먼트 컨트롤 UnderLine
   private lazy var underlineView = UIView()
   
   override init(items: [Any]?) {
      super.init(items: items)
      setUI()
      removeBackgroundAndDivider()
      setTitleFont()
   }
   
   required init?(coder: NSCoder) {
      fatalError()
   }
   
   // underline UI 세팅
   private func setUI() {
      let width = self.bounds.size.width / CGFloat(self.numberOfSegments)
      let height = 1.5
      let xPosition = CGFloat(self.selectedSegmentIndex * Int(width))
      let yPosition = self.bounds.size.height - 1.0
      self.addSubview(underlineView)
      
      underlineView.do {
         $0.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
         $0.backgroundColor = .white
      }
   }
   
   // 세그먼트 컨트롤 배경 및 구분석 삭제
   private func removeBackgroundAndDivider() {
      let image = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1)).image {_ in
         UIColor.clear.set()
      }
      self.setBackgroundImage(image, for: .normal, barMetrics: .default)
      self.setBackgroundImage(image, for: .selected, barMetrics: .default)
      self.setBackgroundImage(image, for: .highlighted, barMetrics: .default)
      
      self.setDividerImage(image, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
   }
   
   // 세그먼트 컨트롤 title 폰트 설정
   private func setTitleFont() {
      setTitleTextAttributes([.font: UIFont.pretendard(size: 12, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
      setTitleTextAttributes([.font: UIFont.pretendard(size: 14, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
      setTitleTextAttributes([.font: UIFont.pretendard(size: 14, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.white], for: .highlighted)
   }
   
   // underLine position 및 애니메이션 적용
   override func layoutSubviews() {
      super.layoutSubviews()
      let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments))*CGFloat(self.selectedSegmentIndex)
      UIView.animate(
         withDuration: 0.1,
         animations: {
            self.underlineView.frame.origin.x = underlineFinalXPosition
         }
      )
   }
}
