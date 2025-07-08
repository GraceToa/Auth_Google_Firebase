//
//  GIDSignInProtocol.swift
//  AuthGoogle
//
//  Created by Grace Toa on 22/6/25.
//

import UIKit
import GoogleSignIn


/// Defines the required interface from the Google Sign-In SDK.
/// Allows for multiple implementations:
/// - ✅ A real one (`GoogleSignInWrapper`)
/// - 🧪 A test/mock version (`MockGoogleSignIn`)
/// signIn(...) :
///  Starts the Google Sign-In flow.
/// - Parameter presentingViewController: The view controller used to present the sign-in UI.
/// - Returns: A `GIDSignInResult` on success.

public protocol GIDSignInProtocol {
    var configuration: GIDConfiguration? { get set}
    func signIn(withPresenting presentingViewController: UIViewController) async throws -> GIDSignInResult
    func signOut()
}

extension GIDSignIn: GIDSignInProtocol {}
