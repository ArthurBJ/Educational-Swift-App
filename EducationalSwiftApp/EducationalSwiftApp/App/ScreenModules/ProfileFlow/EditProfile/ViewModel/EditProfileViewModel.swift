//
//  EditProfileViewModel.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 19.06.2024.
//

import Foundation

final class EditProfileViewModel {
    
    var selectedCategory: Category? {
        didSet {
            self.loadItems()
        }
    }
    var items: [User]?
    var dataManager: DataManagerProtocol
    
    required init(dataManager: DataManagerProtocol, selectedCategory: Category?) {
        self.dataManager = dataManager
        defer { self.selectedCategory = selectedCategory }
    }
    
    func loadUser() {
        dataManager.loadItems(category: selectedCategory) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let items):
                self.items = items
                self.dataManager.saveItem()
                self.view?.success()
            case .failure(let error):
                self.view?.failure(error: error)
            }
        }
    }
    
    func createUser(with name: String) {
        let item = dataManager.createItem(with: name, category: selectedCategory, isDone: false)
        items?.append(item)
    }
    
    func deleteItem(indexPath: IndexPath) {
        guard let item = items?[indexPath.row] else { return }
        dataManager.deleteItem(item: item)
        items?.remove(at: indexPath.row)
    }
    
    func editUser(with name: String, indexPath: IndexPath) {
        guard let item = items?[indexPath.row] else { return }
        dataManager.updateItem(with: name, item: item)
    }
    
    
}
