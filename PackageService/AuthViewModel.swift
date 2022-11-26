//
//  FireStoreManager.swift
//  PackageService
//
//  Created by 이범준 on 11/21/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    init() {
        
    }
    func registerUser(_ id: String, _ password: String, _ nickName: String, _ address: String, _ email: String, _ name: String) {
        Auth.auth().createUser(withEmail: email, password: password)  { result, error in
            if let error = error {
                print("Error : \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            
            print(user.uid)
            
        }
    }
}
