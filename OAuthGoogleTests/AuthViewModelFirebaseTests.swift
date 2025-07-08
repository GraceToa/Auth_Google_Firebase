//
//  AuthViewModelFirebaseTests.swift
//  OAuthGoogleTests
//
//  Created by Grace Toa on 2/7/25.
//

import XCTest
@testable import OAuthGoogle

@MainActor
final class AuthViewModelFirebaseTests: XCTestCase {
    
    var viewModel : AuthViewModel!
    var mockFirebase: MockFirebaseAuthProvider!
    var mockGoogle: MockGoogleAuthProvider!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockFirebase = MockFirebaseAuthProvider()
        mockGoogle = MockGoogleAuthProvider()
        let combinedProvider = CombinedAuthProvider(firebaseProvider: mockFirebase, googleProvider: mockGoogle)
        viewModel = AuthViewModel(authProvider: combinedProvider)
    }

    override func tearDownWithError() throws {
        viewModel  = nil
        mockFirebase = nil
        mockGoogle = nil
        try super.tearDownWithError()
    }

    func testLoginWithFirebaseSuccess() async {
        
        await viewModel.loginWithFirebase(email: "mock@example.com", password: "123456")
        
        await MainActor.run {
            XCTAssertNotNil(viewModel.user)
            XCTAssertEqual(viewModel.user?.email, "mock@example.com")
            XCTAssertNil(viewModel.error)
        }
    }

    func testLoginWithFirebaseFailure() async {
        mockFirebase.shouldSucceed = false
        
        await viewModel.loginWithFirebase(email: "mock@example.com", password: "123456")
        
        await MainActor.run {
            XCTAssertNil(viewModel.user)
            XCTAssertEqual(viewModel.user?.email, nil)
            XCTAssertNotNil(viewModel.error, AuthError.loginFailed.localizedDescription)
        }
    }
    
    func testSignUpWithFirebaseSuccess() async {
        
        try? await viewModel.signUpWithFirebase(email: "mock@example.com", password: "123456")
        
        await MainActor.run {
            XCTAssertNotNil(viewModel.user)
            XCTAssertNil(viewModel.error)
            XCTAssertEqual(viewModel.user?.email, "mock@example.com")
        }
    }
    
    func testSignUpWithFirebaseFailure() async {
        mockFirebase.shouldSucceed = false
        
        try? await viewModel.signUpWithFirebase(email: "mock@example.com", password: "123456")
        
        await MainActor.run {
            XCTAssertNotNil(viewModel.error, AuthError.userNotFound.localizedDescription)
            XCTAssertNil(viewModel.user)
        }
    }
    
    func testRestoreSessionWithFirebaseSuccess() async {
        await viewModel.loginWithFirebase(email: "mock@example.com", password: "123456")
        await viewModel.restoreSession()
        
        await MainActor.run {
            XCTAssertNotNil(viewModel.user)
            XCTAssertNil(viewModel.error)
            XCTAssertEqual(viewModel.user?.email, "mock@example.com")
        }
    }
    
    func testRestoreSessionWithFirebaseFailure() async {
        await viewModel.loginWithFirebase(email: "mock@example.com", password: "123456")
        mockFirebase.shouldSucceed = false

        await viewModel.restoreSession()

        await MainActor.run {
            XCTAssertNil(viewModel.user)
            XCTAssertNotNil(viewModel.error, "sesion no valida")
        }
    }
    
    func testLogoutWithFirebaseSuccess() async throws {
        
        await viewModel.logout()
        
        await MainActor.run {
            XCTAssertNil(viewModel.error)
            XCTAssertNil(viewModel.user)
        }
    }
    
    func testLogoutWithFirebaseFailure() async throws {
        await viewModel.loginWithFirebase(email: "mock@example.com", password: "123456")
        mockFirebase.shouldSucceed = false
        await viewModel.logout()
        
        await MainActor.run {
            XCTAssertNotNil(viewModel.error, AuthError.logoutFailed.localizedDescription)
            XCTAssertNotNil(viewModel.user, "User should remain set if logout fails")
        }
    }
}
