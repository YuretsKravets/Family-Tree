//
//  ContentView.swift
//  Family Tree
//
//  Created by Yurii Kravets on 01/04/2020.
//  Copyright © 2020 Yurii Kravets. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var loginManager: LoginManager
    
    var body: some View {
        Group {
            if (loginManager.isLoggedIn) {
            AppView()
          } else {
            AuthView()
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
