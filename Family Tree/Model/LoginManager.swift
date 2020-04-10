//
//  LoginManager.swift
//  Family Tree
//
//  Created by Yurii Kravets on 01/04/2020.
//  Copyright © 2020 Yurii Kravets. All rights reserved.
//

import SwiftUI

class LoginManager: ObservableObject {
    @Published var email: String?
    @Published var password: String?
    
    @Published var isLoggedIn: Bool = false
    
    func signIn(_ email: String, _ password: String) -> Bool {
        if checkData(email, password) {
            for user in K.users {
                if email == user.0 && password == user.1 {
                    self.email = email
                    self.password = password
                    return true
                }
            }
            return false
        } else {
            return false
        }
    }
    
    func signUp(_ email: String, _ password: String) -> Bool {
        if checkData(email, password) {
            for user in K.users {
                if email == user.0 {
                    return false
                }
            }
            K.users.append((email, password))
            return true
        } else {
            return false
        }
    }
    func signOut() -> Bool {
        if isLoggedIn {
            email = nil
            password = nil
            isLoggedIn = false
            return true
        }
        return false
    }
    func checkData(_ email: String, _ password: String) -> Bool {
        if email != "" && password != "" && email.isValidEmail() {
            return true
        } else {
            return false
        }
    }
}

//MARK: - Email Validation

extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
