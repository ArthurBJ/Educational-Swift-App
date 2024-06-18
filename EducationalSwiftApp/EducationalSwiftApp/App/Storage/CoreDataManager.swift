//
//  CoreDataManager.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 19.06.2024.
//

import Foundation
import CoreData

protocol DataManagerProtocol {
    func saveUser()
    func createUser(with name: String) -> User
    func loadUser(completion: @escaping (Result<[User]?, Error>) -> Void)
}

final class DataManager: DataManagerProtocol {
    
    private var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveUser() {
        do {
            try context.save()
        } catch let error {
            print("Error saving context \(error.localizedDescription)")
        }
    }
    
    func createUser(with name: String) -> User {
        let user = User(context: context)
        user.name = name
        self.saveUser()
        return user
    }
    
    func loadUser(completion: @escaping (Result<[User]?, Error>) -> Void) {
        let request: NSFetchRequest<User> = User.fetchRequest()
        do {
            let user = try context.fetch(request)
            completion(.success(user))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    func updateItem(with name: String, item: User?) {
        guard let item = item else { return }
        item.name = name
        self.saveUser()
    }
    
}
