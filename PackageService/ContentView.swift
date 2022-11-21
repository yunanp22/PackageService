//
//  ContentView.swift
//  PackageService
//
//  Created by 이범준 on 11/15/22.
//

import SwiftUI

struct AuthView: View {
    @State var email = ""
    @State var pw = ""
    @ObservableObject var viewModel = AuthViewModel()
    var body: some View {
        VStack {
            TextField
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
