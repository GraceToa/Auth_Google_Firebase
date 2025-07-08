//
//  AuthViewModelSwift6Tests.swift
//  OAuthGoogle
//
//  Created by Grace Toa on 2/7/25.
//
import UIKit
import Testing
@testable import OAuthGoogle

@MainActor
struct AuthViewModelSwift6Tests {
    let mockFirebase: MockFirebaseAuthProvider
    let dummyGoogle: MockGoogleAuthProvider
    let viewModel: AuthViewModel

    init() {
        mockFirebase = MockFirebaseAuthProvider()
        dummyGoogle = MockGoogleAuthProvider()
        let combinedProvider = CombinedAuthProvider(firebaseProvider: mockFirebase, googleProvider: dummyGoogle)
        viewModel = AuthViewModel(authProvider: combinedProvider)
    }

    //MARK: - FIREBASE
    @Test
    func testLoginWithFirebaseSuccess() async {
        await viewModel.loginWithFirebase(email: "mock@example.com", password: "password")

        #expect(viewModel.user?.email == "mock@example.com")
        #expect(viewModel.error == nil)
    }

    @Test
    func testLoginWithFirebaseFailure() async {
        mockFirebase.shouldSucceed = false
        await viewModel.loginWithFirebase(email: "mock@example.com", password: "wrong")

        #expect(viewModel.user == nil)
        #expect(viewModel.error != nil)
    }
    
    @Test
    func testSignUpWithFirebaseSuccess() async {
        try? await viewModel.signUpWithFirebase(email: "mock@example.com", password: "password")

        #expect(viewModel.user?.email == "mock@example.com")
        #expect(viewModel.error == nil)
    }
    
    @Test
    func testSignUpWithFirebaseFailure() async {
        mockFirebase.shouldSucceed = false
        try? await viewModel.signUpWithFirebase(email: "mock@example.com", password: "password")

        #expect(viewModel.user == nil)
        #expect(viewModel.error != nil)
    }
    
    @Test
    func testRestoreSessionWithFirebaseSuccess() async  {
        await viewModel.loginWithFirebase(email: "mock@example.com", password: "password")
        await viewModel.restoreSession()
        
        #expect(viewModel.user?.email == "mock@example.com")
        #expect(viewModel.error == nil)

    }
    
    @Test
    func testRestoreSessionWithFirebaseFailure() async  {
        await viewModel.loginWithFirebase(email: "mock@example.com", password: "password")
        await viewModel.logout()
        mockFirebase.shouldSucceed = false

        await viewModel.restoreSession()
        
        #expect(viewModel.user == nil)
        #expect(viewModel.error != nil)

    }
    
    @Test
    func testLogoutWithFirebaseSuccess() async throws {
        await viewModel.logout()
        
        #expect(viewModel.user == nil)
        #expect(viewModel.error == nil)
    }
    
    @Test
    func testLogoutWithFirebaseFailure() async throws {
        await viewModel.loginWithFirebase(email: "mock@example.com", password: "password")
        mockFirebase.shouldSucceed = false

        await viewModel.logout()
        
        #expect(viewModel.user != nil)
        #expect(viewModel.error == AuthError.logoutFailed.localizedDescription)
    }
  
    //MARK: - GOOGLE
    @Test
    func testLoginWithGoogleSuccess() async {
        let dummyVC = UIViewController()

        await viewModel.loginWithGoogle(from: dummyVC)

        #expect(viewModel.user?.email == "mock@example.com")
        #expect(viewModel.error == nil)
    }

    @Test
    func testLoginWithGoogleFailure() async {
        dummyGoogle.shouldSucceed = false
        let dummyVC = UIViewController()

        await viewModel.loginWithGoogle(from: dummyVC)

        #expect(viewModel.user == nil)
        #expect(viewModel.error != nil)
    }
    
    @Test
    func testLogoutWithGoogleSuccess() async throws {
        await viewModel.logout()
        
        #expect(viewModel.user == nil)
        #expect(viewModel.error == nil)
    }
    
    @Test
    func testLogoutWithGoogleFailure() async throws {
        let dummyVC = UIViewController()
        await viewModel.loginWithGoogle(from: dummyVC)   
        dummyGoogle.shouldSucceed = false

        await viewModel.logout()
        
        #expect(viewModel.user != nil)
        #expect(viewModel.error == AuthError.logoutFailed.localizedDescription)
    }

}

