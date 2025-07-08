//
//  GoogleSignInWrapper.swift
//  AuthGoogle
//
//  Created by Grace Toa on 22/6/25.
//

import UIKit
import GoogleSignIn

///Google gives you a final, static class called: GIDSignIn.sharedInstance, this is difficult to test and replace.
///This wrapper takes the final GIDSignIn.sharedInstance class and encapsulates it within a class that we can inject.
///✅ Saves an instance of GIDSignIn.sharedInstance.
///✅ Implements the GIDSignInProtocol protocol.
///✅ We delegate everything to instances, but we do so through the protocol interface.
public final class GoogleSignInWrapper: GIDSignInProtocol {
    
    private let instance = GIDSignIn.sharedInstance
    
    public var configuration: GIDConfiguration? {
        get {instance.configuration}
        set {instance.configuration = newValue}
    }
    
    public func signIn(withPresenting presentingViewController: UIViewController) async throws -> GIDSignInResult {
        try await instance.signIn(withPresenting: presentingViewController)
    }
    
    public func signOut() {
        instance.signOut()
    }
}
