//
//  KakaoAuthViewModel.swift
//  PackageService
//
//  Created by 이범준 on 11/26/22.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser

class KakaoAuthViewModel: ObservableObject {
    
    @Published var isLoggedIn: Bool = false
    
    @MainActor
    func kakaoLogout(){
        Task { //asink, await은 task 블록에서 해야 함
            if await handleKakaoLogout(){
                isLoggedIn = false
            }
        }
    }
    
    func handleKakaoLogout() async -> Bool{
        await withCheckedContinuation { continuation in
            UserApi.shared.logout {(error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("logout() success.")
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    func handleLoginWithKakaoTalkApp() async -> Bool {
        
        await withCheckedContinuation{ continuation in
            //카카오 앱을 통해 로그인
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    func handleLoginWithKakaoAccount() async -> Bool {
        
        await withCheckedContinuation{ continuation in
            //카카오 웹뷰로 로그인
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    
                    //do something
                    _ = oauthToken
                    continuation.resume(returning: true)
                }
            }
            
        }
    }
    
    @MainActor
    func handleKakaoLogin() {
        Task {
            // 카카오톡 설치 여부 확인 - 설치 되어있을 때
            if (UserApi.isKakaoTalkLoginAvailable()) {
                isLoggedIn = await handleLoginWithKakaoTalkApp()
            } else { //카카오 설치 안되어있을 때
                isLoggedIn = await handleLoginWithKakaoAccount()
            }
        }
    }
}
