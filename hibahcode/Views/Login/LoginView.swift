//
//  LoginView.swift
//  hibahcode
//
//  Created by vdotup on 09/06/2023.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    @EnvironmentObject private var auth: AuthViewModel
    
    var body: some View {
        ZStack {
            if auth.networking {
                ProgressView()
            } else {
                VStack(spacing: 16) {
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(14)
                    SignInWithAppleButton { request in
                        auth.nonce = auth.randomNonceString()
                        request.requestedScopes = []
                        request.nonce = auth.sha256(auth.nonce)
                    } onCompletion: { result in
                        switch result {
                        case .success(let user):
                            if let credential = user.credential as? ASAuthorizationAppleIDCredential {
                                auth.login(credential: credential)
                            }
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    .frame(height: 55)
                }
                .padding()
            }
        }
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
