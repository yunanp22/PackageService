//
//  PackageServiceApp.swift
//  PackageService
//
//  Created by 이범준 on 11/15/22.
//

import SwiftUI
import Firebase
import KakaoSDKAuth
import KakaoSDKCommon

@main
struct PackageServiceApp: App {
    @UIApplicationDelegateAdaptor var appDelegate: AppDelegate
    init() {
        FirebaseApp.configure()
    }

    
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
