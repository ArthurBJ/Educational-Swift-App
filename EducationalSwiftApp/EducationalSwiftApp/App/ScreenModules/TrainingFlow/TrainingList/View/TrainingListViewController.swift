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
    fileprivate var sections: [SectionData] = [
        SectionData(isOpen: true,
                    data: [
                        TrainingListDTO(trainingImage: "pencil.line", typeOfTraining: "Теория", titleTraining: "Swift", experience: "+ 10xp"),
                        TrainingListDTO(trainingImage: "pencil.line", typeOfTraining: "Теория", titleTraining: "Swift", experience: "+ 10xp"),
                        TrainingListDTO(trainingImage: "pencil.line", typeOfTraining: "Теория", titleTraining: "Swift", experience: "+ 10xp")
                    ]),
        SectionData(isOpen: true, data: [
            TrainingListDTO(trainingImage: "newspaper", typeOfTraining: "Теория", titleTraining: "Swift", experience: "+ 10xp"),
            TrainingListDTO(trainingImage: "newspaper", typeOfTraining: "Теория", titleTraining: "Swift", experience: "+ 10xp")
        ]),
        SectionData(isOpen: true, data: [
            TrainingListDTO(trainingImage: "pencil.line", typeOfTraining: "Теория", titleTraining: "Swift", experience: "+ 10xp")
        ])
    ]
    
    
    // MARK: Views
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
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
        
        setConstraints()
    }
    
}


// MARK: - UITableViewDataSource
extension TrainingListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let section = sections[indexPath.section]
        let sectionData = section.data[indexPath.row]
        cell.textLabel?.text = sectionData.titleTraining
        cell.imageView?.image = UIImage(systemName: sectionData.trainingImage ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton()
        button.setTitle("Press", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
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
