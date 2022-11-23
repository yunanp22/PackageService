//
//  PackageServiceApp.swift
//  PackageService
//
//  Created by 이범준 on 11/15/22.
//

import SwiftUI
import Firebase

@main
struct PackageServiceApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
