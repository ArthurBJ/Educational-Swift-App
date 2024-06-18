//
//  EditProfileViewController.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

final class EditProfileViewController: UIViewController {
    
    var viewModel: EditProfileViewModel
    let detailPageView: EditProfileView = EditProfileView()
    
    init(viewModel: EditProfileViewModel) {
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = detailPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTable()
    }
    
    // MARK: - Setup View
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        // add navbarButtonItem
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow"), style: .plain, target: self, action: #selector(goToBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow"), style: .plain, target: self, action: #selector(addItem))
        
    }
    
    private func setupTable() {
        detailPageView.tableView.delegate = self
        detailPageView.tableView.dataSource = self
    }
    
    @objc func goToBack() {
        presenter.backToPreviousViewController()
    }
    
    @objc func addItem() {
        let alert = UIAlertController(title: "Add new task", message: "", preferredStyle: .alert)
        alert.addTextField()
        
        let addAction = UIAlertAction(title: "add", style: .default) { _ in
            guard let itemName = alert.textFields?.first?.text else { return }
            self.presenter.createItem(with: itemName)
        }
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

extension EditProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Resources.detailTableReuseId, for: indexPath)
        cell.textLabel.text = presenter?.items?[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") { _, _, _ in
            self.viewModel.deleteItem(indexPath: indexPath)
        }
        
        let actions = UISwipeActionsConfiguration(actions: [deleteAction])
        return actions
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "edit") { _, _, success in
            let alert = UIAlertController(title: "Enter new task name", message: "", preferredStyle: .alert)
            alert.addTextField()
            let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
                guard let newName = alert.textFields?.first?.text else { return }
                self.viewModel.editItem(with: newName, indexPath: indexPath)
                success(true)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true)
        }
        
        let actions = UISwipeActionsConfiguration(actions: [editAction])
        return actions
    }
}
