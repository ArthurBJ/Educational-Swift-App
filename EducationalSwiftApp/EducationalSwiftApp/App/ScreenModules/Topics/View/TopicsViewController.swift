//
//  TopicsViewController.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit
import SnapKit
import Combine

final class TopicsViewController: UIViewController {
    
    // MARK: Properties
    private let viewModel: TopicsViewModel
    private var cancellable = Set<AnyCancellable>()
    
    
    // MARK: - Initializers
    init(viewModel: TopicsViewModel, cancellable: Set<AnyCancellable> = Set<AnyCancellable>()) {
        self.viewModel = viewModel
        self.cancellable = cancellable
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
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
    
    private func stateController() {
        viewModel
            .state
            .sink { [weak self] state in
            switch state {
            case .success:
                self?.collectionView.reloadData()
            case .loading:
                self?.showSpinner()
            case .fail(error: let error):
                self?.presentAlert(message: error, title: error)
            }
        }.store(in: &cancellable)
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
        return viewModel.menuItemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicsCollectionViewCell.reuseIdentifier, for: indexPath) as? TopicsCollectionViewCell else { return UICollectionViewCell() }
        cell.topicLabel.text = viewModel.getTopicItem(indexPath: indexPath).title
        return cell
    }
    
    
}


// MARK: - UICollectionViewDelegateFlowLayout
extension TopicsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let string = viewModel.getTopicItem(indexPath: indexPath).title
        
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
