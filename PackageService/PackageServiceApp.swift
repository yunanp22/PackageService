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
    @StateObject var firestoreManager = FireStoreManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(firestoreManager)
        }
    }
}
