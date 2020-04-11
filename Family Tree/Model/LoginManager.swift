//
//  LoginManager.swift
//  Family Tree
//
//  Created by Yurii Kravets on 01/04/2020.
//  Copyright © 2020 Yurii Kravets. All rights reserved.
//

import SwiftUI
import Firebase

class LoginManager: ObservableObject {
    @Published var user: User?
    
    @Published var isLoggedIn: Bool = false
    @Published var errorDescription: String = ""
    
    func signIn(_ email: String, _ password: String) -> Bool {
        var result: Bool = false
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let e = error {
                self.errorDescription = e.localizedDescription
                self.isLoggedIn = false
                result =  false
            } else {
                self.user = authResult?.user
                self.errorDescription = ""
                self.isLoggedIn = true
                result = true
            }
        }
        return result
    }
    
    func signUp(_ email: String, _ password: String) -> Bool {
        var result: Bool = false
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                self.errorDescription = e.localizedDescription
                result =  false
            } else {
                
                self.errorDescription = ""
                self.isLoggedIn = true
                result = true
            }
        }
        return result
    }
    
    func signOut() -> Bool {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            errorDescription = ""
            user = nil
            isLoggedIn = false
            return true
        } catch let signOutError {
            errorDescription = signOutError.localizedDescription
            return false
        }
    }
//    func checkData(_ email: String, _ password: String) -> Bool {
//        if email != "" && password != "" && email.isValidEmail() {
//            return true
//        } else {
//            return false
//        }
//    }
}

//MARK: - Email Validation

//extension String {
//    func isValidEmail() -> Bool {
//        // here, `try!` will always succeed because the pattern is valid
//        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
//        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
//    }
//}
