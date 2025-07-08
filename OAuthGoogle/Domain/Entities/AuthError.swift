//
//  AuthError.swift
//  AuthGoogle
//
//  Created by Grace Toa on 22/6/25.
//

import Foundation

/// Represents possible authentication-related errors.
public enum AuthError: Error {
    case unknown
    case loginFailed
    case logoutFailed
    case notConfigured
    case userNotFound
    case invalidSession
}
