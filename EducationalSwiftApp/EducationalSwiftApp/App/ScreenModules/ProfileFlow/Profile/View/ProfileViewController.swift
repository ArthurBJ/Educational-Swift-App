//
//  ProfileViewController.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit
import SnapKit

protocol ProfileViewControllerCoordinator: AnyObject {
    func didSelectNavigationButton(profileViewNavigation: ProfileViewNavigation)
}

final class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    private weak var coordinator: ProfileViewControllerCoordinator?
    private var contentSize: CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height + 60)
    }
    
    
    // MARK: - Views
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = UIColor(hexString: "#1565C0").withAlphaComponent(194/255)
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    // MARK: Info block
    private lazy var infoContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        //        imageView.image = UIImage(systemName: "character")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var avatarLetterLabel: UILabel = {
        let label = UILabel()
        label.text = "AB"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 70, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "Arthur"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.text = "Здесь ваша краткая биография"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private lazy var experienceLabel: UILabel = {
        let label = UILabel()
        label.text = "20 XP"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    // MARK: Strick block
    private lazy var strickContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#EDEDF4")
        return view
    }()
    
    private lazy var strickView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5.0
        return view
    }()
    
    private lazy var strickLabel: UILabel = {
        let label = UILabel()
        label.text = "СТРИК"
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.textColor = .gray
        return label
    }()
    
    private lazy var strickCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(StrickCollectionViewCell.self, forCellWithReuseIdentifier: StrickCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    // MARK: - Initializers
    init(coordinator: ProfileViewControllerCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        avatarImageView.layoutIfNeeded()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height / 2
    }
    
    // MARK: - Private methods
    private func configView() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(didTapSetting))
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        setConstraints()
    }
    
    @objc private func didTapSetting() {
        coordinator?.didSelectNavigationButton(profileViewNavigation: .changeTheme)
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StrickCollectionViewCell.reuseIdentifier, for: indexPath) as? StrickCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
}

extension ProfileViewController: UICollectionViewDelegate {
    
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 7
        let paddingWidth = 10 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
}


// MARK: - Layout
extension ProfileViewController {
    private func setConstraints() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(view.snp.height)
        }
        
        containerView.addSubview(infoContainerView)
        infoContainerView.snp.makeConstraints { make in
            make.top.equalTo(scrollView)
            make.height.equalTo(view).multipliedBy(0.5)
            make.width.equalTo(scrollView)
        }
        
        infoContainerView.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { make in
            make.centerX.equalTo(infoContainerView)
            make.top.equalTo(infoContainerView).offset(30)
            make.width.height.equalTo(infoContainerView.snp.width).multipliedBy(0.4)
        }
        
        avatarImageView.addSubview(avatarLetterLabel)
        avatarLetterLabel.snp.makeConstraints { make in
            make.centerX.equalTo(avatarImageView.snp_centerXWithinMargins)
            make.centerY.equalTo(avatarImageView.snp_centerYWithinMargins)
        }
        
        let stackView = UIStackView(arrangedSubviews: [nicknameLabel, bioLabel, experienceLabel], axis: .vertical, spacing: 13)
        stackView.alignment = .center
        infoContainerView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp_bottomMargin).offset(20)
            make.centerX.equalTo(infoContainerView).inset(20)
        }
        
        containerView.addSubview(strickContainer)
        strickContainer.snp.makeConstraints { make in
            make.top.equalTo(infoContainerView.snp_bottomMargin)
            make.bottom.equalTo(view.snp.bottom)
            make.width.equalTo(scrollView)
        }
        
        strickContainer.addSubview(strickView)
        strickView.snp.makeConstraints { make in
            make.top.equalTo(strickContainer.snp_topMargin).offset(20)
            make.leading.equalTo(strickContainer).offset(10)
            make.trailing.equalTo(strickContainer).offset(-10)
            make.height.equalTo(view).multipliedBy(0.25)
        }
        
        strickView.addSubview(strickLabel)
        strickLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(12)
        }
        
        strickView.addSubview(strickCollectionView)
        strickCollectionView.snp.makeConstraints { make in
            make.top.equalTo(strickLabel.snp_bottomMargin).offset(35)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
    }
}
