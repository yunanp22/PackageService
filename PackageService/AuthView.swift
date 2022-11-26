//
//  ContentView.swift
//  PackageService
//
//  Created by 이범준 on 11/15/22.
//

import SwiftUI

struct AuthView: View {
    @State var email = ""
    @State var password = ""
    @State var nickName = ""
    @State var address = ""
    @State var name = ""
    @State var id = ""
    @StateObject var kakaoAuthVM = KakaoAuthViewModel()
    @ObservedObject var viewModel = AuthViewModel()
    
    let loginStatusInfo: (Bool) -> String = { isLoggedIn in
        return isLoggedIn ? "로그인 상태" : "로그아웃 상태"
    }
    var body: some View {
        VStack(spacing: 20) {
            Text(loginStatusInfo(kakaoAuthVM.isLoggedIn)).padding()
//            TextField("id", text: $id)
//            SecureField("PW", text: $password)
//            TextField("email", text: $email)
//            TextField("nickName", text: $nickName)
//            TextField("name", text: $name)
//            TextField("address", text: $address)
//            Button {
//                viewModel.registerUser(id, password, nickName, address, email, name)
//            } label: {
//                Text("등록")
//            }
            Button("카카오 로그인", action: {
                kakaoAuthVM.handleKakaoLogin()
            })
            Button("카카오 로그아웃", action: {
                kakaoAuthVM.kakaoLogout()
            })
        }
        .padding()
    }
}
struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
