//
//  TrainingListViewController.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit
import SnapKit

protocol TrainingListViewControllerCoordinator: AnyObject {
    func didSelectTaskCell(id: Int)
}

final class TrainingListViewController: UIViewController {
    
    // MARK: Properties
    private weak var coordinator: TrainingListViewControllerCoordinator?
    
    
    // MARK: Views
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    
    // MARK: Initializers
    init(coordinator: TrainingListViewControllerCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    // MARK: Private methods
    private func configView() {
        view.backgroundColor = .systemBackground
        
        configTableView()
        setConstraints()
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}


// MARK: - UITableViewDataSource
extension TrainingListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Text"
        return cell
    }
    
}


// MARK: - UITableViewDelegate
extension TrainingListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator?.didSelectTaskCell(id: indexPath.row)
    }
}


// MARK: - Layout
extension TrainingListViewController {
    private func setConstraints() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
