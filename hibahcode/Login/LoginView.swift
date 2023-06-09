//
//  LoginView.swift
//  hibahcode
//
//  Created by vdotup on 09/06/2023.
//

import SwiftUI
import Firebase

struct LoginView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    private func login() {
        // email
        
        // Auth.auth().signIn(with: <#T##AuthCredential#>)
        // check if user exists
        // let snapshot = Firestore.firestore().collection("users").whereField("email", isEqualTo: email)
        
        
        //
        // Firestore.firestore().collection("users").addDocument(data: <#T##[String : Any]#>)
        // (
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
