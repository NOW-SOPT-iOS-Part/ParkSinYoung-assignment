//
//  MainViewController.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 4/25/24.
//

import UIKit
import SnapKit
import Then

class MainViewController: BaseViewController, UIScrollViewDelegate {
   // 상단 TapBar (세그먼트 컨트롤)
   let segmentedControlScrollView = UIScrollView()
   let segmentedControlScrollContentView = UIView()
   lazy var segmentedControl = UnderlineSegmentedControl(items: [StringLiterals.Main.topTabBarTitle1, StringLiterals.Main.topTabBarTitle2, StringLiterals.Main.topTabBarTitle3, StringLiterals.Main.topTabBarTitle4, StringLiterals.Main.topTabBarTitle5, StringLiterals.Main.topTabBarTitle6])
   // 상단 nonSafeArea 영역 View
   let nonSafeAreaView = UIView()
   //home 컬렉션 뷰
   private var homeCollectionView: UICollectionView? = nil
   
   override func viewDidLoad() {
      super.viewDidLoad()
      configureNavigationBar()
      setCollectionView()
      setHierarchy()
      setLayout()
      requestMovieInfo()
   }
   
   override func setUI() {
      view.backgroundColor = .black
      navigationController?.navigationBar.backgroundColor = .clear
      navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
      
      segmentedControlScrollView.do {
         $0.showsHorizontalScrollIndicator = false
         $0.showsVerticalScrollIndicator = false
      }
      
      segmentedControl.do {
         $0.selectedSegmentIndex = 0
      }
      
      nonSafeAreaView.do {
         $0.backgroundColor = .black
      }
   }
   
   func setHierarchy() {
      self.view.addSubviews(segmentedControlScrollView, nonSafeAreaView)
      segmentedControlScrollView.addSubview(segmentedControlScrollContentView)
      segmentedControlScrollContentView.addSubview(segmentedControl)
   }
   
   func setLayout() {
      homeCollectionView?.snp.makeConstraints {
         $0.top.equalToSuperview().offset(-100)
         $0.bottom.horizontalEdges.equalToSuperview()
      }
      
      segmentedControlScrollView.snp.makeConstraints {
         $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
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
      
      nonSafeAreaView.snp.makeConstraints {
         $0.top.equalToSuperview()
         $0.leading.trailing.equalToSuperview()
         $0.bottom.equalTo(segmentedControlScrollView.snp.top)
      }
   }
   
   private func setCollectionView() {
      let config = UICollectionViewCompositionalLayoutConfiguration()
      config.scrollDirection = .horizontal
      
      let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in return self.createSection(for: sectionIndex) }
      self.homeCollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
      
      self.homeCollectionView!.delegate = self
      self.homeCollectionView!.dataSource = self
      self.homeCollectionView!.backgroundColor = .black
      
      setRegister()
      
      self.view.addSubview(homeCollectionView!)
   }
   
   private func setRegister() {
      self.homeCollectionView!.register(
         HomePosterCell.self,
         forCellWithReuseIdentifier: HomePosterCell.identifier
      )
      
      self.homeCollectionView!.register(
         HomeContentCell.self,
         forCellWithReuseIdentifier: HomeContentCell.identifier
      )
      
      self.homeCollectionView!.register(
         HomeHeaderView.self,
         forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
         withReuseIdentifier: HomeHeaderView.identifier
      )
   }
   
   internal func scrollViewDidScroll(_ scrollView: UIScrollView) {
      let offset = scrollView.contentOffset.y
      let navigationBarHidden = offset > 0
      
      if navigationBarHidden {
         navigationController?.setNavigationBarHidden(navigationBarHidden, animated: false)
         segmentedControlScrollView.backgroundColor = .black
         nonSafeAreaView.backgroundColor = .black
      } else {
         navigationController?.setNavigationBarHidden(navigationBarHidden, animated: false)
         segmentedControlScrollView.backgroundColor = .clear
         nonSafeAreaView.backgroundColor = .clear
      }
   }
   
   
}

extension MainViewController {
   private func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection {
      switch sectionIndex {
      case 0:
         return homePosterSection()
      case 1:
         return homeContentSection(weightConstant: sectionIndex)
      case 2:
         return homeContentSection(weightConstant: sectionIndex)
      case 3:
         return homeContentSection(weightConstant: sectionIndex)
      case 4:
         return homeContentSection(weightConstant: sectionIndex)
         
      default:
         return homeContentSection(weightConstant: 0)
      }
   }
   
   func homePosterSection() -> NSCollectionLayoutSection {
      let itemSize = NSCollectionLayoutSize(
         widthDimension: .fractionalWidth(1),
         heightDimension: .fractionalHeight(1)
      )
      let item = NSCollectionLayoutItem(layoutSize: itemSize)
      
      let groupSize = NSCollectionLayoutSize(
         widthDimension: .fractionalWidth(1),
         heightDimension: .fractionalHeight(0.7)
      )
      let group = NSCollectionLayoutGroup.horizontal(
         layoutSize: groupSize,
         subitems: [item]
      )
      
      let section = NSCollectionLayoutSection(group: group)
      section.orthogonalScrollingBehavior = .groupPaging
      section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
      return section
   }
   
   private func homeContentSection(weightConstant: Int) -> NSCollectionLayoutSection {
      let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(0.2))
      
      let item = NSCollectionLayoutItem(layoutSize: itemSize)
      
      let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(160))
      
      let group = NSCollectionLayoutGroup.horizontal(
         layoutSize: groupSize,
         subitems: [item]
      )
      group.interItemSpacing = .fixed(8)
      
      let headerSize = NSCollectionLayoutSize(
         widthDimension: .fractionalWidth(1.0),
         heightDimension: .absolute(50)
      )
      
      let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
         elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
      
      let section = NSCollectionLayoutSection(group: group)
      section.interGroupSpacing = 8.0
      section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 0)
      section.orthogonalScrollingBehavior = .continuous
      section.boundarySupplementaryItems = [sectionHeader]
      return section
   }
}


extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
   private func requestMovieInfo() {
      APIService.shared.getMovieInfo(date: "20240504") { [weak self] response in switch response {
      case .success(let data):
          guard let data = data as? BoxOfficeReponseModel else {
              return }
         print(data)
      case .requestErr:
          print("요청 오류 입니다")
      case .decodedErr:
          print("디코딩 오류 입니다")
      case .pathErr:
          print("경로 오류 입니다")
      case .serverErr:
          print("서버 오류입니다")
      case .networkFail:
          print("네트워크 오류입니다")
      }
  }
      
   }
   
   func collectionView(_ collectionView: UICollectionView,
                       viewForSupplementaryElementOfKind kind: String,
                       at indexPath: IndexPath) -> UICollectionReusableView {
      if kind == UICollectionView.elementKindSectionHeader {
         let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind, withReuseIdentifier: HomeHeaderView.identifier, for: indexPath)
         as! HomeHeaderView
         headerView.titleLabel.text = MockupDataModel.title[indexPath.section - 1]
         headerView.titleLabel.textColor = .white
         
         return headerView
      }
      else {
         return UICollectionReusableView()
      }
   }
   
   // 섹션 수
   func numberOfSections(in collectionView: UICollectionView) -> Int {
      return 5
   }
   
   // 각 섹션 row 수
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      switch section {
      case 0:
         return 5
      case 1:
         return 5
      case 2:
         return 5
      case 3:
         return 5
      case 4:
         return 5
      default:
         return 0
      }
   }
   
   //각 index 별 가져올 컬렉션 뷰 타입
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      var cell: UICollectionViewCell
      if indexPath.section == 0 {
         guard let posterCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomePosterCell.identifier,
            for: indexPath
         ) as? HomePosterCell
         else { return UICollectionViewCell() }
         posterCell.dataBind(MockupDataModel.poster[indexPath.row])
         cell = posterCell
      } else {
         guard let contentCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeContentCell.identifier,
            for: indexPath
         ) as? HomeContentCell
         else { return UICollectionViewCell() }
         contentCell.dataBind(
            image: MockupDataModel.programs[indexPath.row].0,
            title: MockupDataModel.programs[indexPath.row].1
         )
         cell = contentCell
      }
      return cell
   }
}
