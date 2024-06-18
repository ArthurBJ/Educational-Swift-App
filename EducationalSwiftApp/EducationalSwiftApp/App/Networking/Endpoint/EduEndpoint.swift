//
//  SWEndpoint.swift
//  CoffeeSevenWinds
//
//  Created by Артур Байбиков on 03.05.2024.
//

import Foundation

public enum SWApi {
    case getOnboarding
    case postOnboarding(answer: Int)
    case trainingSection
    case traininglists(id: Int)
    case trainingtasks(id: Int)
    case postTrainingtasks(answer: String)
    case allTopics
}

extension SWApi: EndpointType {
    var baseURL: URL {
        guard let url = URL(string: "http://localhost:1337/") else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .getOnboarding:
            return "onboarding"
        case .postOnboarding:
            return "onboarding"
        case .trainingSection:
            return "trainingSection"
        case .traininglists(id: let id):
            return "trainingsections/\(id)"
        case .trainingtasks(id: let id):
            return "trainingtasks/\(id)"
        case .postTrainingtasks:
            return "trainingtasks"
        case .allTopics:
            return "allTopics"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getOnboarding:
            return .get
        case .postOnboarding:
            return .post
        case .trainingSection:
            return .get
        case .traininglists:
            return .get
        case .trainingtasks:
            return .get
        case .postTrainingtasks:
            return .post
        case .allTopics:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getOnboarding:
            return .requestParametersAndHeaders(bodyParameters: [:], urlParameters: [:], additionHeaders: headers)
        case .postOnboarding(answer: let answer):
            return .requestParameters(bodyParameters: ["answer": answer], urlParameters: [:])
        case .trainingSection:
            return .requestParametersAndHeaders(bodyParameters: [:], urlParameters: [:], additionHeaders: headers)
        case .traininglists:
            return .requestParametersAndHeaders(bodyParameters: [:], urlParameters: [:], additionHeaders: headers)
        case .trainingtasks:
            return .requestParametersAndHeaders(bodyParameters: [:], urlParameters: [:], additionHeaders: headers)
        case .postTrainingtasks(answer: let answer):
            return .requestParameters(bodyParameters: ["answer": answer], urlParameters: [:])
        case .allTopics:
            return .requestParametersAndHeaders(bodyParameters: [:], urlParameters: [:], additionHeaders: headers)
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .getOnboarding:
            return [:]
        case .postOnboarding:
            return [:]
        case .trainingSection:
            return [:]
        case .traininglists:
            return [:]
        case .trainingtasks:
            return [:]
        case .postTrainingtasks:
            return [:]
        case .allTopics:
            return [:]
        }
    }
    
}
