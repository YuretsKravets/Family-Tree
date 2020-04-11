//
//  ContentView.swift
//  Family Tree
//
//  Created by Yurii Kravets on 01/04/2020.
//  Copyright © 2020 Yurii Kravets. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var session: SessionStore
    
    func getUser () {
        session.listen()
    }
    
    var body: some View {
        Group {
            if (session.session != nil) {
                NavigationView{
                    AppView()
                        .navigationBarItems(trailing: Button(action: {
                            self.session.signOut()
                        }) {
                            Text("LogOut")
                                .foregroundColor(.red)
                        })
                }
                    
          } else {
                AuthView()
          }
        }.onAppear(perform: getUser)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SessionStore())
    }
}
