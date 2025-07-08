//
//  AuthViewModelGoogleTests.swift
//  OAuthGoogleTests
//
//  Created by Grace Toa on 3/7/25.
//

import XCTest
@testable import OAuthGoogle

@MainActor
final class AuthViewModelGoogleTests: XCTestCase {
    
    var viewModel : AuthViewModel!
    var mockGoogle: MockGoogleAuthProvider!
    var mockFirebase: MockFirebaseAuthProvider!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockGoogle = MockGoogleAuthProvider()
        mockFirebase = MockFirebaseAuthProvider()
        let combinedProvider = CombinedAuthProvider(firebaseProvider: mockFirebase, googleProvider: mockGoogle)
        viewModel = AuthViewModel(authProvider: combinedProvider)    }

    override func tearDownWithError() throws {
        viewModel  = nil
        mockFirebase = nil
        mockGoogle = nil
        try super.tearDownWithError()
    }

    func testsLoginWithGoogleSuccess() async {
        let dummyVC = UIViewController()
        
        await viewModel.loginWithGoogle(from: dummyVC)
        
        await MainActor.run {
            XCTAssertNotNil(viewModel.user)
            XCTAssertEqual(viewModel.user?.email, "mock@example.com")
            XCTAssertNil(viewModel.error)
        }
    }
    
    func testsLoginWithGoogleFailure() async {
        mockGoogle.shouldSucceed = false
        let dummyVC = UIViewController()
        
        await viewModel.loginWithGoogle(from: dummyVC)
        
        await MainActor.run {
            XCTAssertNotNil(viewModel.error, AuthError.loginFailed.localizedDescription)
            XCTAssertNil(viewModel.user)
        }
    }
    
    func testLogoutWithGoogleSuccess() async throws {
        
        await viewModel.logout()
        
        await MainActor.run {
            XCTAssertNil(viewModel.error)
            XCTAssertNil(viewModel.user)
        }
    }
    
    func testLogoutWithGoogleFailure() async throws {
        let dummyVC = UIViewController()
        await viewModel.loginWithGoogle(from: dummyVC)
        mockFirebase.shouldSucceed = false
        
        await viewModel.logout()
        
        await MainActor.run {
            XCTAssertNotNil(viewModel.error, AuthError.logoutFailed.localizedDescription)
            XCTAssertNotNil(viewModel.user, "User should remain set if logout fails")
        }
    }
    
    func testRestoreSessionWithFirebaseSuccess() async {
        let dummyVC = UIViewController()
        await viewModel.loginWithGoogle(from: dummyVC)
        
        await viewModel.restoreSession()
        
        await MainActor.run {
            XCTAssertNotNil(viewModel.user)
            XCTAssertNil(viewModel.error)
            XCTAssertEqual(viewModel.user?.email, "mock@example.com")
        }
    }
    
    func testRestoreSessionWithFirebaseFailure() async {
        let dummyVC = UIViewController()
        await viewModel.loginWithGoogle(from: dummyVC)
        mockFirebase.shouldSucceed = false

        await viewModel.restoreSession()

        await MainActor.run {
            XCTAssertNil(viewModel.user)
            XCTAssertNotNil(viewModel.error, "sesion no valida")
        }
    }
}
