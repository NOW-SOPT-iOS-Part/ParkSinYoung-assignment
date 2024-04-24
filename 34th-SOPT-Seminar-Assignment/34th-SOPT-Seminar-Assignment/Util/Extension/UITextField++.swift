//
//  UITextField++.swift
//  FootMark
//
//  Created by 박신영 on 3/21/24.
//

import UIKit

extension UITextField {
   
   func setPlaceholderColor(placeholderColor: UIColor, _ text: String) {
      attributedPlaceholder = NSAttributedString(
         string: text,
         attributes: [
            .foregroundColor: placeholderColor,
            .font: font
         ].compactMapValues { $0 }
      )
   }
   
   func setLeftPaddingPoints(_ amount: CGFloat) { // 왼쪽에 여백 주기
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
      self.leftView = paddingView
      self.leftViewMode = .always
   }
   
   func setRightPaddingPoints(_ amount: CGFloat) { // 오른쪽에 여백 주기
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
      self.rightView = paddingView
      self.rightViewMode = .always
   }
}

