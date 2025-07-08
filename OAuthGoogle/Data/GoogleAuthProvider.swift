//
//  GoogleAuthProvider.swift
//  AuthGoogle
//
//  Created by Grace Toa on 22/6/25.
//

import Foundation
import GoogleSignIn

/// This class handles Google Sign-In authentication.
/// It uses a wrapper (`signInInstance`) to support dependency injection and testing.
/// After successful login, it converts the `GIDGoogleUser` into your app's `AuthUser` model.
public class GoogleAuthProvider: GoogleAuthProviderProtocol {
    
    private let clientID: String
    private var signInInstance: GIDSignInProtocol
    
    init(clientID: String, signInInstance: GIDSignInProtocol = GoogleSignInWrapper()) {
        self.clientID = clientID
        self.signInInstance = signInInstance
        self.signInInstance.configuration = GIDConfiguration(clientID: clientID)
    }
    
    public func login(from viewController: UIViewController) async throws -> AuthUser {
        guard let _ = signInInstance.configuration else {
            throw AuthError.notConfigured
        }
        
        let result = try await signInInstance.signIn(withPresenting: viewController)
        
        let user = result.user
        
        return AuthUser(
            id: user.userID ?? UUID().uuidString,
            name: user.profile?.name ?? "No Name",
            email: user.profile?.email ?? "No Email",
            profileImageURL: user.profile?.imageURL(withDimension: 100),
            accessToken: user.accessToken.tokenString,
            idToken: user.idToken?.tokenString
        )
    }
    
    ///_withCheckedThrowingContinuation converts a clousure-based API to asyn/await
    public func restoreSession() async throws -> AuthUser? {
        return try await withCheckedThrowingContinuation { continuation in
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                
                guard let user = user else {
                    continuation.resume(returning: nil)
                    return
                }
                
                let restoredUser = AuthUser(
                    id: user.userID ?? UUID().uuidString,
                    name: user.profile?.name ?? "No Name",
                    email: user.profile?.email ?? "No Email",
                    profileImageURL: user.profile?.imageURL(withDimension: 100),
                    accessToken: user.accessToken.tokenString,
                    idToken: user.idToken?.tokenString
                )
                
                continuation.resume(returning: restoredUser)
            }
        }
    }
    
    public func logout() async throws {
        signInInstance.signOut()
    }
}
