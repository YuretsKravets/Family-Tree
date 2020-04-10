//
//  AppView.swift
//  Family Tree
//
//  Created by Yurii Kravets on 01/04/2020.
//  Copyright © 2020 Yurii Kravets. All rights reserved.
//

import SwiftUI

struct AppView: View {
    
    @State var treeIsPresented: Bool = true
    @State var signOutError: Bool = false
    
    @EnvironmentObject var loginManager: LoginManager
    
    func signOut() {
        if loginManager.signOut() {
            treeIsPresented = false
        } else {
            signOutError = true
        }
    }
    var body: some View {
        TabView {
            TreeView(isPresented: $treeIsPresented, viewModel: TreeView.DemoData())
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Tree")
                }
            Button(action: signOut) {
                Text("Sign Out")
                if signOutError {
                    Text("ahh crap")
                }
            }
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Account")
                }
        }
        .edgesIgnoringSafeArea(.top)
        .font(.headline)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
