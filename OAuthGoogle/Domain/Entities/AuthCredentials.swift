//
//  AuthCredentials.swift
//  OAuthGoogle
//
//  Created by Grace Toa on 25/6/25.
//

import Foundation

/// Represents user input credentials for authentication.
/// Typically used for email and password login.
public struct AuthCredentials {
    public let email: String
    public let password: String
}
