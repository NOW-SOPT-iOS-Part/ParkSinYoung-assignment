//
//  MainViewController.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 4/25/24.
//

import UIKit
import SnapKit
import Then

class MainViewController: BaseViewController {
   
   let homeView = HomeView()
   
   let segmentedControlScrollView = UIScrollView()
   let segmentedControlScrollContentView = UIView()
   lazy var segmentedControl = UnderlineSegmentedControl(items: [StringLiterals.Main.topTabBarTitle1, StringLiterals.Main.topTabBarTitle2, StringLiterals.Main.topTabBarTitle3, StringLiterals.Main.topTabBarTitle4, StringLiterals.Main.topTabBarTitle5, StringLiterals.Main.topTabBarTitle6])
   
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .clear
      configureNavigationBar()
      navigationController?.navigationBar.backgroundColor = .clear
      navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
   }
   
   override func loadView() {
      view = homeView
      homeView.delegate = self
   }
   
   override func setUI() {
      segmentedControlScrollView.do {
         $0.showsHorizontalScrollIndicator = false
         $0.showsVerticalScrollIndicator = false
      }
      
      segmentedControl.do {
         $0.selectedSegmentIndex = 0
      }
   }
   
   override func setHierarchy() {
      self.view.addSubview(segmentedControlScrollView)
      segmentedControlScrollView.addSubview(segmentedControlScrollContentView)
      segmentedControlScrollContentView.addSubview(segmentedControl)
   }
   
   override func setLayout() {
      segmentedControlScrollView.snp.makeConstraints {
         $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
         $0.leading.trailing.equalToSuperview()
         $0.height.equalTo(40)
      }
      
      segmentedControlScrollContentView.snp.makeConstraints {
         $0.edges.equalToSuperview()
         $0.height.equalToSuperview()
         $0.width.greaterThanOrEqualToSuperview().priority(.low)
      }
      
      segmentedControl.snp.makeConstraints {
         $0.leading.equalTo(segmentedControlScrollContentView.snp.leading)
         $0.trailing.equalTo(segmentedControlScrollContentView.snp.trailing)
         $0.height.equalTo(35)
         $0.centerY.equalToSuperview()
      }
   }
   
}

// ScrollView 일정 높이 화면에서 내려갈 때 상단 NavagationBar hidden 적용
extension MainViewController: HomeViewDelegate {
   func scrollViewDidScroll(_ scrollView: UIScrollView) {
      let offset = scrollView.contentOffset.y
      let navigationBarHidden = offset > 0
      navigationController?.setNavigationBarHidden(navigationBarHidden, animated: false)
   }
}
