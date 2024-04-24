//
//  Colors.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 4/19/24.
//

import UIKit

extension UIColor {
   // Hex color 코드를 UIColor로 변환하는 메서드
   convenience init(fromHex: String, alpha: CGFloat = 1.0) {
      let v = fromHex.map { String($0) } + Array(repeating: "0", count: max(6 - fromHex.count, 0))
      
      let r = CGFloat(Int(v[0] + v[1], radix: 16) ?? 0) / 255.0
      let g = CGFloat(Int(v[2] + v[3], radix: 16) ?? 0) / 255.0
      let b = CGFloat(Int(v[4] + v[5], radix: 16) ?? 0) / 255.0
      
      self.init(red: r, green: g, blue: b, alpha: alpha)
   }
   
   static func black(alpha: CGFloat = 1.0) -> UIColor {
      return UIColor(fromHex: "000000", alpha: alpha)
   }
   static func white(alpha: CGFloat = 1.0) -> UIColor {
      return UIColor(fromHex: "ffffff", alpha: alpha)
   }
   static func mainColor(alpha: CGFloat = 1.0) -> UIColor {
      return UIColor(fromHex: "FF143C", alpha: alpha)
   }
   static func gray1(alpha: CGFloat = 1.0) -> UIColor {
      return UIColor(fromHex: "D6D6D6", alpha: alpha)
   }
   static func gray2(alpha: CGFloat = 1.0) -> UIColor {
      return UIColor(fromHex: "9C9C9C", alpha: alpha)
   }
   static func gray3(alpha: CGFloat = 1.0) -> UIColor {
      return UIColor(fromHex: "626262", alpha: alpha)
   }
   static func gray4(alpha: CGFloat = 1.0) -> UIColor {
      return UIColor(fromHex: "2E2E2E", alpha: alpha)
   }
   static func gray5(alpha: CGFloat = 1.0) -> UIColor {
      return UIColor(fromHex: "191919", alpha: alpha)
   }
   
}
