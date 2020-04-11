//
//  AuthView.swift
//  Family Tree
//
//  Created by Yurii Kravets on 01/04/2020.
//  Copyright © 2020 Yurii Kravets. All rights reserved.
//

import SwiftUI

struct AuthView : View {
    
    var body : some View {
        NavigationView {
            SignInView()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
