//
//  API.swift
//  BikeCitizensAssessment
//
//  Created by Moaaz Ahmed Fawzy Taha on 03/02/2022.
//

import Foundation

enum API {
    case searchAdress(String)
}

extension API: Endpoint {
    
    var base: String {
        return Bundle.main.baseURL
    }
    
    var prefix: String {
            return "/api/v2"
    }
    
    var path: String {
        switch self {
        case .searchAdress:
            return "/search"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .searchAdress:
            return .get
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case let .searchAdress(query):
            return [URLQueryItem(name: "q", value: "\(query)")]
        }
    }
    
    
}
