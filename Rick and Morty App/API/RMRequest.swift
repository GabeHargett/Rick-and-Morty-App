//
//  RMRequest.swift
//  Rick and Morty App
//
//  Created by Tanner Rozier on 2/7/23.
//

import Foundation

/// object that represents a single API call
final class RMRequest {
    /// API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoin
    private let endpoint: RMEndpoint
    
    /// Path components for API, if any
    private let pathComponents: [String]
    
    /// Constructed url for the api request in string format
    private let queryParameters: [URLQueryItem]
    
    ///Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString

        }
        

        
        return string
    }
    
    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// desered http method
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    
    
    /// Contruct request
    /// - Parameters:
    ///   - endpoint: Target endpoin
    ///   - pathComponents: Collection of Path Components
    ///   - queryParameter: Collection of query parameters
    init(endpoint: RMEndpoint,
         pathComponents: [String] = [],
         queryParameter: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameter
    }
}

extension RMRequest {
    static let listCharactersRequests = RMRequest(endpoint: .character)
}
