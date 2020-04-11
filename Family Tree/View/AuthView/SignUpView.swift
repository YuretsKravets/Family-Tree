//
//  SignUpView.swift
//  Family Tree
//
//  Created by Yurii Kravets on 11/04/2020.
//  Copyright © 2020 Yurii Kravets. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var session: SessionStore

    //  textfield values
    @State var email: String = ""
    @State var emailVerification: String = ""
    @State var password: String = ""
    
    //  condition vars
    @State var loading = false
    @State var error = false
    @State var errorDescription: String = ""

    //  fields comletion status
    var fieldsAreReady: Bool {
        return (email == emailVerification) && (email != "") && (password != "")
    }
    
    // enebled/disabled button styles
    var buttonColor: Color {
        return fieldsAreReady ? Color(K.Colors.green) : .gray
    }
    
    var body: some View {
        VStack {
            
            //  Image Section
            Group {
                Image(K.Images.registerImage)
                    .padding(.all)
                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
            
            //  Textfields Section
            Group {
                TextField("Email", text: $email)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30).padding(.top, 20)
                Divider()
                    .padding(.horizontal, 30)
                TextField("Confirm email", text: $emailVerification)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30).padding(.top, 20)
                Divider()
                    .padding(.horizontal, 30)
                if(email != emailVerification && emailVerification != "") {
                    Text("Confirmation email doesn't match")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
                SecureField("Password", text: $password)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30).padding(.top, 20)
                Divider()
                    .padding(.horizontal, 30)
                if (error) {
                    Text(errorDescription)
                        .font(.footnote)
                        .foregroundColor(.red)
                }
            }
            
            //  Button Section
            Group {
                Spacer()
                Button(action: signUp) {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 180, height: 50, alignment: .center)
                        .foregroundColor(buttonColor)
                        .overlay(
                            Text("Sign Up")
                                .foregroundColor(Color.white)
                        )
                        .padding(.bottom, 20)
                }.disabled(!fieldsAreReady)
            }
        }
        .modifier(AdaptsToSoftwareKeyboard())
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

//MARK: - Sign Up method

extension SignUpView {
    
    func signUp () {
        loading = true
        error = false
        session.signUp(email: email, password: password) { (result, error) in
            self.loading = false
            if let e = error {
                self.error = true
                self.errorDescription = e.localizedDescription
            } else {
                self.email = ""
                self.emailVerification = ""
                self.password = ""
                self.errorDescription = ""
            }
        }
    }
}
