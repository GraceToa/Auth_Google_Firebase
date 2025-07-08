//
//  OAuthGoogleApp.swift
//  OAuthGoogle
//
//  Created by Grace Toa on 23/6/25.
//

import SwiftUI
import Firebase

@main
struct OAuthGoogleApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            
            let clientID = "767870657617-43kar4edgi7d6899t255fc067ujjstmv.apps.googleusercontent.com"
            
            let combinedProvider = CombinedAuthProvider(
                firebaseProvider: FirebaseAuthProvider(),
                googleProvider: GoogleAuthProvider(clientID: clientID)
            )
            
            let viewModel = AuthViewModel(authProvider: combinedProvider)
            RootView(viewModel: viewModel)
        }
    }
}
