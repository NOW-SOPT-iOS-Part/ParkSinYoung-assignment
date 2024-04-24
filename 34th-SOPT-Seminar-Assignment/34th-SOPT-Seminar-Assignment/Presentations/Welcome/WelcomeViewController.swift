//
//  WelcomeViewController.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 4/19/24.
//

import UIKit
import SnapKit
import Then

final class WelcomeViewController: BaseViewController {
   
   private let welcomeView = WelcomeView()
   var nickname: String?
   
   override func loadView() {
       view = welcomeView
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .black
      bindData(nickname: nickname ?? "")
   }
   
   override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       self.navigationController?.setNavigationBarHidden(true, animated: animated)
   }
   
   override func setAddTarget() {
      welcomeView.backToMainButton.addTarget(self, action: #selector(didTapBackToMainButton), for: .touchUpInside)
   }
   
   private func bindData(nickname: String) {
      welcomeView.welcomeTitleLabel.text = nickname + StringLiterals.Welcome.welcomeTitle
   }
   
   @objc private func didTapBackToMainButton() {
      self.navigationController?.popViewController(animated: true)
   }
   
}
