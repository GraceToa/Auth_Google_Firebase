//
//  EmailAuthProvider.swift
//  OAuthGoogle
//
//  Created by Grace Toa on 25/6/25.
//

import UIKit
import FirebaseAuth

/// FirebaseAuthProvider implements authentication using Firebase.
/// It complies with the FirebaseAuthProviderProtocol protocol and exposes methods
/// for creating users, logging in, restoring sessions, and logging out.
public class FirebaseAuthProvider: FirebaseAuthProviderProtocol {
    
    public func createUser(credentials: AuthCredentials) async throws {
        do {
            _ = try await Auth.auth().createUser(withEmail: credentials.email, password: credentials.password)
        }catch let error as NSError {
            if error.code == AuthErrorCode.emailAlreadyInUse.rawValue {
                throw AuthError.userNotFound
            }else {
                throw error
            }
        }
    }
    
    public func login(credentials: AuthCredentials? ) async throws -> AuthUser {
        guard let credentials = credentials else {
            throw AuthError.loginFailed
        }
        
        let result = try await Auth.auth().signIn(
            withEmail: credentials.email,
            password: credentials.password
        )
        
        let user = result.user
        let nameUser = getUserNameFromEmail(email: user.email ?? "") ?? ""
        
        return AuthUser(
            id: user.uid,
            name: nameUser.capitalized,
            email: user.email ?? "No Email",
            profileImageURL: user.photoURL,
            accessToken: nil,
            idToken: nil
        )
    }
    
    public func restoreSession() async throws -> AuthUser? {
        if let currentUser = Auth.auth().currentUser {
            let nameUser = getUserNameFromEmail(email: currentUser.email ?? "No Name") ?? "No Name"
            return AuthUser(
                id: currentUser.uid,
                name: nameUser.capitalized,
                email: currentUser.email ?? "No Email",
                profileImageURL: currentUser.photoURL,
                accessToken: nil,
                idToken: nil
            )
        }else {
            return nil
        }
    }
    
    public func logout() async throws {
        try Auth.auth().signOut()
    }
    
    private func getUserNameFromEmail(email: String) -> String? {
        guard let atIndex = email.firstIndex(of: "@") else {return nil}
        return String(email[..<atIndex])
    }
}
