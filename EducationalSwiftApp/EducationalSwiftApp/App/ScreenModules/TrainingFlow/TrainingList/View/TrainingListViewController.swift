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
        SectionData(isOpen: false, data: [
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
        tableView.backgroundColor = UIColor(hexString: "#EDEDF4")
        tableView.separatorStyle = .none
        tableView.register(TrainingListTableViewCell.self, forCellReuseIdentifier: TrainingListTableViewCell.reuseIdentifier)
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
//        view.backgroundColor = UIColor(hexString: "#EDEDF4")
        
        setConstraints()
    }
    
    @objc fileprivate func openSection(button: UIButton) {
        let section = button.tag
//        let isOpen = sections[section].isOpen
        var indexPaths = [IndexPath]()
        for row in sections[section].data.indices {
            let indexPathToDelete = IndexPath(row: row, section: section)
            indexPaths.append(indexPathToDelete)
        }
        
        let isOpen = sections[section].isOpen
        sections[section].isOpen = !isOpen
        button.setTitle(isOpen ? "Open" : "Close", for: .normal)
//        tableView.reloadData()
        if isOpen {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
}


// MARK: - UITableViewDataSource
extension TrainingListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !sections[section].isOpen {
            return 0
        }
        return sections[section].data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TrainingListTableViewCell.reuseIdentifier, for: indexPath) as? TrainingListTableViewCell else { return UITableViewCell() }
        let section = sections[indexPath.section]
        let sectionData = section.data[indexPath.row]
        cell.configure(trainingListViewModel: TrainingListTableViewCellViewModel(trainingList: TrainingList(imageURL: "", typeOfTraining: "Урок", titleTraining: "Основы Swift", experience: "XP +10")))
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton()
        button.tag = section
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(openSection), for: .touchUpInside)
        return button
    }
    
}


// MARK: - UITableViewDelegate
extension TrainingListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator?.didSelectTaskCell(id: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
}


// MARK: - Layout
extension TrainingListViewController {
    private func setConstraints() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
