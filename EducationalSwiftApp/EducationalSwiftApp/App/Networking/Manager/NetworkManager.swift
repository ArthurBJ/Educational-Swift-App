//
//  NetworkManager.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 03.05.2024.
//

import Foundation

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to authenticate"
    case badRequest = "Bad request"
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String> {
    case success
    case failure(String)
}

final class NetworkManager {
    
    private let router = Router<SWApi>()
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
    
    private func processResponse<T: Decodable>(
        data: Data?,
        response: URLResponse?,
        error: Error?,
        completion: @escaping (_ success: T?, _ error: String?) -> Void
    ) {
        if let error = error {
            completion(nil, "Please check your network connection. \(error.localizedDescription)")
            return
        }
        
        guard let response = response as? HTTPURLResponse else {
            completion(nil, NetworkResponse.failed.rawValue)
            return
        }
        
        let result = handleNetworkResponse(response)
        
        switch result {
        case .success:
            guard let responseData = data else {
                completion(nil, NetworkResponse.noData.rawValue)
                return
            }
            
            do {
                let apiResponse = try JSONDecoder().decode(T.self, from: responseData)
                print(apiResponse)
                completion(apiResponse, nil)
            } catch let error {
                print("Error in decode for: \(T.self)\nError: \(error)")
                completion(nil, NetworkResponse.unableToDecode.rawValue)
            }
        case .failure(let networkFailureError):
            completion(nil, networkFailureError)
        }
    }
    
    func getOnboarding(completion: @escaping (_ success: Onboarding?, _ error: String?) -> Void) {
        router.request(.getOnboarding) { data, response, error in
            self.processResponse(data: data, response: response, error: error, completion: completion)
        }
    }
    
    func postOnboarding(answer: Int,
               completion: @escaping (_ success: Onboarding?, _ error: String?) -> Void) {
        router.request(.postOnboarding(answer: answer)) { data, response, error in
            self.processResponse(data: data, response: response, error: error, completion: completion)
        }
    }
    
    func trainingSection(completion: @escaping (_ success: SectionData?, _ error: String?) -> Void) {
        router.request(.trainingSection) { data, response, error in
            self.processResponse(data: data, response: response, error: error, completion: completion)
        }
    }
    
    func traininglists(id: Int, completion: @escaping (_ success: TrainingListDTO?, _ error: String?) -> Void) {
        router.request(.traininglists(id: id)) { data, response, error in
            self.processResponse(data: data, response: response, error: error, completion: completion)
        }
    }
    
    func trainingtasks(id: Int, completion: @escaping (_ success: Practice?, _ error: String?) -> Void) {
        router.request(.trainingtasks(id: id)) { data, response, error in
            self.processResponse(data: data, response: response, error: error, completion: completion)
        }
    }
    
    func postTrainingtasks(answer: String,
               completion: @escaping (_ success: Practice?, _ error: String?) -> Void) {
        router.request(.postTrainingtasks(answer: answer)) { data, response, error in
            self.processResponse(data: data, response: response, error: error, completion: completion)
        }
    }
    
    func allTopics(completion: @escaping (_ success: Topic?, _ error: String?) -> Void) {
        router.request(.allTopics) { data, response, error in
            self.processResponse(data: data, response: response, error: error, completion: completion)
        }
    }
}
