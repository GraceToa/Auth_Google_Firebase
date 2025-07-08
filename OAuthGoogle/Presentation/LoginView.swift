//
//  LoginView.swift
//  AuthGoogle
//
//  Created by Grace Toa on 23/6/25.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: AuthViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        VStack {
            Image("Grace")
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 140)
                .clipShape(Circle())
                .padding(.top, 40)
                .padding(.bottom, 30)

            Group {
                HStack {
                    Image(systemName: "envelope.fill")
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                }
                HStack {
                    Image(systemName: "key.fill")
                    SecureField("Password", text: $password)
                }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(style: StrokeStyle(lineWidth: 1))
            )
            .padding(.horizontal, 80)
            
            
            Button("Sign in With Email") {
                presentLoginWithFirebase()
            }
            .disabled(email.isEmpty || password.isEmpty || viewModel.isLoading || viewModel.error == "not-registered")
            .padding(.top, 20)

            if viewModel.error == "not-registered" {
                Button("Create an account")
                {
                    Task {
                        await signUpUser()
                    }
                }
                .padding(.top, 10)
            }
            
            Button {
                presentLoginWithGoogle()
            }label: {
                Image("googleIcon")
                    .resizable()
                    .frame(width: 200, height: 50)
            }
            .disabled(viewModel.isLoading)
            .padding(.top, 40)
            
            if let error = viewModel.error, error != "not-registered" {
                Text(error)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
        }
        .onAppear {
            if viewModel.error != "not-registered" {
                viewModel.error = nil
            }
        }
    }
    
    private func presentLoginWithFirebase(){
        Task {
            await viewModel.loginWithFirebase(email: email.lowercased(), password: password)
        }
    }
    
    private func presentLoginWithGoogle() {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let rootVC = scene.windows.first?.rootViewController else {return}
        
        Task {
            await viewModel.loginWithGoogle(from: rootVC)
        }
    }
    
    private func signUpUser() async {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let _ = scene.windows.first?.rootViewController else {return}
        do {
            try await viewModel.signUpWithFirebase(email: email.lowercased(), password: password)
        }catch {
            viewModel.error = error.localizedDescription
        }
    }
}

struct PreviewAuthProvider: AuthProviderProtocol {
    func restoreSession() async throws -> AuthUser? {
        return AuthUser.mockAuthUser
    }
    
    func loginWithGoogle(from viewController: UIViewController) async throws -> AuthUser {
        return AuthUser.mockAuthUser
    }
    
    func loginWithFirebase(credentials: AuthCredentials?) async throws -> AuthUser {
        return AuthUser.mockAuthUser
    }
    
    func createUser(credentials: AuthCredentials) async throws {}
    func logout() async throws {}
}


#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView_PreviewWrapper()
    }
    
    struct LoginView_PreviewWrapper: View {
        var body: some View {
            let provider = PreviewAuthProvider()
            let viewModel = AuthViewModel(authProvider: provider)
            //            viewModel.simulateLogin(AuthUser.mockAuthUser)
            return LoginView(viewModel: viewModel)
        }
    }
}
#endif
