//
//  UIStackView++.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 4/19/24.
//

import UIKit

extension UIStackView {
   
   func addArrangedSubviews(_ views: UIView...) {
      for view in views {
         self.addArrangedSubview(view)
      }
   }
   
}
