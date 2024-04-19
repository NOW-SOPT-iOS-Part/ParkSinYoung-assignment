//
//  UIButton++.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 4/19/24.
//

import UIKit

extension UIButton {
   
   func setButtonTitle(_ title: String, titleColor: UIColor, font: UIFont, for state: UIControl.State) {
      self.setTitle(title, for: state)
      self.setTitleColor(titleColor, for: state)
      self.titleLabel?.font = font
   }
   
   func addUnderlineToTitle() {
      guard let title = title(for: .normal) else { return }
      let attributedString = NSMutableAttributedString(string: title)
      attributedString.addAttribute(.underlineStyle,
                                    value: NSUnderlineStyle.single.rawValue,
                                    range: NSRange(location: 0, length: title.count)
      )
      setAttributedTitle(attributedString, for: .normal)
   }
   
}
