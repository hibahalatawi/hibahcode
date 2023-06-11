//
//  AuthViewModel.swift
//  hibahcode
//
//  Created by vdotup on 09/06/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import AuthenticationServices
import CryptoKit
import SwiftUI

class AuthViewModel: ObservableObject {
    
    let db = Firestore.firestore()
    let auth = Auth.auth()
    
    @AppStorage("tries") var tries: Int = 0
    
    @Published public var isLoggedIn: Bool = false
    @Published public var currentUser: User?
    @Published public var user: UserData?
    @Published public var nonce: String = ""
    @Published public var networking: Bool = false
    
    @MainActor
    public func check() {
        print("auth check")
        networking = true
        if let userObj = Auth.auth().currentUser {
            Task {
                do {
                    print("saved login", userObj.uid)
                    let snapshot = try await db.collection("users").whereField("uid", isEqualTo: userObj.uid).getDocuments(source: .server)
                    if snapshot.documents.isEmpty {
                        print("no user document found")
//                        try auth.signOut()
//                        try await auth.signInAnonymously()
                        print("Signed in")
                    } else {
                        if let doc = snapshot.documents.first {
                            user = try doc.data(as: UserData.self)
                        }
                    }
                    self.currentUser = userObj
                    self.isLoggedIn = true
                } catch {
                    print(error.localizedDescription)
                }
                networking = false
            }
        } else {
            Task {
                do {
                    let authResult = try await auth.signInAnonymously()
                    self.currentUser = authResult.user
                    self.isLoggedIn = true
                    networking = false
                } catch {
                    print(error.localizedDescription)
                    networking = false
                }
            }
            
        }
    }
    
    @MainActor
    public func login(credential: ASAuthorizationAppleIDCredential) {
        guard let token = credential.identityToken else { return }
        guard let tokenString = String(data: token, encoding: .utf8) else { return }
        let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com", idToken: tokenString, rawNonce: nonce)
        
        Task {
            do {
                networking = true
                let authResult: AuthDataResult = try await auth.signIn(with: firebaseCredential)
                let userObj = authResult.user
                let snapshot = try await db.collection("users").whereField("uid", isEqualTo: userObj.uid).getDocuments(source: .server)
                if snapshot.documents.isEmpty {
                    // no matched document. -> create new.
                    print("no matched document. -> create new")
                    let userData = UserData(uid: userObj.uid, tries: 0)
                    try await db.collection("users").addDocument(data: [
                        "uid": userData.uid,
                        "tries": 0
                    ])
                    user = userData
                } else {
                    // user document exists.
                    // we can't use user's email as unique id, because he can choose to hide email when signing in with apple.
                    print("user document exists")
                    if let doc = snapshot.documents.first {
                        user = try doc.data(as: UserData.self)
                    }
                }
                networking = false
            } catch {
                print(error.localizedDescription)
                networking = false
            }
        }
    }
}

extension AuthViewModel {
    public func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: [Character] = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError(
                        "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
                    )
                }
                return random
            }
            randoms.forEach { random in
                if remainingLength == 0 { return }
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        return result
    }
    
    public func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        return hashString
    }
}
