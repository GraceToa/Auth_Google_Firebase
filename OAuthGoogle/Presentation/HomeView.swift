//
//  HomeView.swift
//  AuthGoogle
//
//  Created by Grace Toa on 23/6/25.
//

import SwiftUI

public struct HomeView: View {
    
    @ObservedObject var viewModel: AuthViewModel
    let user: AuthUser
    
    public var body: some View {
        VStack(spacing: 20) {
            Text("Welcome")
                .font(.largeTitle)
                .bold()
                .padding(.top, 50)
            
            if let imageURL = user.profileImageURL {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                } placeholder: {
                    ProgressView()
                }
            }else {
                Image("Grace")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 140)
                    .clipShape(Circle())
            }
            
            Text(user.name)
                .font(.largeTitle)
                .bold()
           
            if let email = user.email {
                Text("Email: \(email)")
            }
            
            Button("Sign Out") {
                Task {
                    await viewModel.logout()
                }
            }
            Spacer()
        }
        .padding(.horizontal, 40)
    }
}
