//
//  RootView.swift
//  AuthGoogle
//
//  Created by Grace Toa on 23/6/25.
//

import SwiftUI

public struct RootView: View {
    @StateObject private var viewModel: AuthViewModel
    
    /// When the  ViewModel has been injected (outside) use:
    /// _viewModel: with underscore accesses the property wrapper
    ///  StateObject(wrappedValue...) : use this object and keep it as a property of this view
    public init(viewModel: AuthViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        
        Group {
            if viewModel.isRestoringSession {
                ProgressView("Loading...")
            } else if let user = viewModel.user {
                HomeView(viewModel: viewModel, user: user)
            }else {
                LoginView(viewModel: viewModel)                
            }
        }
        .onAppear {
            Task {
                await viewModel.restoreSession()
            }
        }
    }
}

