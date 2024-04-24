//
//  ++UIView.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 4/19/24.
//

import UIKit

extension UIView {
   
   func addSubviews(_ views: UIView...) {
      views.forEach {
         self.addSubview($0)
      }
   }
   
   func makeCornerRadius(radius: CGFloat) {
      layer.cornerRadius = radius
      layer.masksToBounds = true
   }
   
   func makeBorderLine(width: CGFloat, color: UIColor) {
      layer.borderWidth = width
      layer.borderColor = color.cgColor
   }
   
}
