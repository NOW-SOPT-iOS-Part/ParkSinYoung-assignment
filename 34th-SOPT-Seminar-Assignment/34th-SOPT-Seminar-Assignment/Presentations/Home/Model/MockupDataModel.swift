//
//  MockData.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 4/30/24.
//

import UIKit

enum MockupDataModel {
   
   static let poster: [PosterModel] = [
      PosterModel(title: "너의 이름은", content: "너는 누구야?!\n나는 박신영", image: .homePoster1),
      PosterModel(title: "해리포터", content: "최현우님도 보고 배우신다는\n인강 총정리", image: .homePoster2),
      PosterModel(title: "시그널", content: "거긴 몇 년 도입니까..", image: .homePoster3),
      PosterModel(title: "반지의 제왕", content: "이거 안 봐서\n잘 모름..", image: .homePoster4),
      PosterModel(title: "스즈메의 문단속", content: "문 잠그는\n습관을 들입시다.", image: .homePoster5)
   ]
   
   static let title: [String] = [
      "신영Park님이 시청하는 콘텐츠",
      "Quick VOD",
      "1화 무료 파라마운트+ 인기 시리즈",
      "Tving Top 20"
   ]
   
   static let programs: [(UIImage, String)] = [
      (UIImage(resource: .homePoster1), "너의 이름은"),
      (UIImage(resource: .homePoster2), "해리포터"),
      (UIImage(resource: .homePoster3), "시그널"),
      (UIImage(resource: .homePoster4), "반지의 제왕"),
      (UIImage(resource: .homePoster5), "스즈메의 문단속")
   ]
   
}
