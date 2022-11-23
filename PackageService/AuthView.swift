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
    @ObservedObject var viewModel = AuthViewModel()
    var body: some View {
        VStack {
            TextField("id", text: $id)
            SecureField("PW", text: $password)
            TextField("email", text: $email)
            TextField("nickName", text: $nickName)
            TextField("name", text: $name)
            TextField("address", text: $address)
            Button {
                viewModel.registerUser(id, password, nickName, address, email, name)
            } label: {
                Text("등록")
            }
        }
        .padding()
    }
}
struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
