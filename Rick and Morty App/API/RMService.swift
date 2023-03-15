//
//  RMService.swift
//  Rick and Morty App
//
//  Created by Tanner Rozier on 2/7/23.
//

import Foundation
///primary API service obect to get rick and morty data
final class RMService {
    
    /// shared singlton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: the type of object we expect to get back
    ///   - completion: Callback with data or error
    public func excecute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) {data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            // Decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    // MARK - Private
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
