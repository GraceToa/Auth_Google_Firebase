//
//  AuthUser.swift
//  AuthGoogle
//
//  Created by Grace Toa on 22/6/25.
//

import Foundation

/// Represents an authenticated user in the app.
public struct AuthUser {
    public let id: String
    public let name: String
    public let email: String?
    public let profileImageURL: URL?
    public let accessToken: String?
    public let idToken: String?
    
    init(
        id: String,
        name: String,
        email: String?,
        profileImageURL: URL?,
        accessToken: String?,
        idToken: String?
    ) {
        self.id = id
        self.name = name
        self.email = email
        self.profileImageURL = profileImageURL
        self.accessToken = accessToken
        self.idToken = idToken
    }   
}

extension AuthUser {
    static let mockAuthUser = AuthUser(
        id: "mock-id",
        name: "Mock User",
        email: "mock@example.com",
        profileImageURL: nil,
        accessToken: "mock-access-token",
        idToken: "mock-id-token"
    )
}
