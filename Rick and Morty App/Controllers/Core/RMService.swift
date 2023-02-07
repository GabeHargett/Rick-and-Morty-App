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
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data or error
    public func excecute(_ request: RMRequest, completion: @escaping () -> Void) {
        return
    }
}
