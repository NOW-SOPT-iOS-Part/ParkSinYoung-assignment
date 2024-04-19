//
//  ViewController.swift
//  FootMark
//
//  Created by 박신영 on 3/21/24.
//

import UIKit
import SnapKit
import Then

class BaseViewController: UIViewController {
    // MARK: - Property
    
    weak var alertController: UIAlertController?
    
    override func loadView() {
        view = BaseView()
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        self.view.backgroundColor = .systemBackground
        self.view.setNeedsUpdateConstraints()
        self.setUI()
        self.setLayout()
        self.setAddTarget()
        self.setUpKeyboard()
    }
    
    
    // MARK: - UI Components
    func setUI() {}
    // MARK: - Layout Helper
    func setLayout() {}
    // MARK: - Add Target
    func setAddTarget() {}
   // MARK: - Add SetUpKeyboard
    func setUpKeyboard() {}
}

