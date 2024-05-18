//
//  TopicsViewController.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit
import SnapKit

final class TopicsViewController: UIViewController {
    
    // MARK: Properties
    var arr:[String] = ["English","Intermediate","English","English","arr","UICollectionViewFlowLayoutFlowFlowFlow","English","UICollectionViewDelegate","English","Intermediate","UIViewController","viewDidLoad","Intermediate","String","Intermediate","arr","Intermediate","UIKit","Intermediate","English","columnLayout","English fsdfhksjd","languageLabel", "English","Intermediate","English","English","arr","UICollectionViewFlowLayoutFlowFlowFlow","English","UICollectionViewDelegate","English","Intermediate","UIViewController","viewDidLoad","Intermediate","String","Intermediate","arr","Intermediate","UIKit","Intermediate","English","columnLayout","English fsdfhksjd","languageLabel"]
    
    
    // MARK: Views
    private lazy var collectionView: UICollectionView = {
        let columnLayout = LeftAlignedFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: columnLayout)
        collectionView.backgroundColor = UIColor(hexString: "#EDEDF4")
        collectionView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 10, right: 5)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TopicsCollectionViewCell.self, forCellWithReuseIdentifier: TopicsCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    // MARK: Private methods
    private func configView() {
        view.backgroundColor = .systemBackground
        
        setConstraints()
    }
}


// MARK: - UICollectionViewDataSource
extension TopicsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicsCollectionViewCell.reuseIdentifier, for: indexPath) as? TopicsCollectionViewCell else { return UICollectionViewCell() }
        cell.topicLabel.text = arr[indexPath.row]
        return cell
    }
    
    
}


// MARK: - UICollectionViewDelegateFlowLayout
extension TopicsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let string = arr[indexPath.row]
        
        let font = UIFont.systemFont(ofSize: 16)
        let fontAttribute = [NSAttributedString.Key.font: font]
        
        let size = string.size(withAttributes: fontAttribute)
        
        let extraSpace : CGFloat = 8.0
        let width = size.width + extraSpace
        return CGSize(width:width, height: 45)
    }
}


// MARK: - UICollectionViewDelegate
extension TopicsViewController: UICollectionViewDelegate {
    
}

// MARK: - Layout
extension TopicsViewController {
    private func setConstraints() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
