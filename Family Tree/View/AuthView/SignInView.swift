//
//  LoginView.swift
//  Family Tree
//
//  Created by Yurii Kravets on 11/04/2020.
//  Copyright © 2020 Yurii Kravets. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var session: SessionStore
    
    //  textfield values
    @State var email: String = "a@b.com"
    @State var password: String = "123456"
    
    //  condition vars
    @State var loading = false
    @State var error = false
    @State var errorDescription: String = ""
    
    var body: some View {
        VStack {
            
            //  Image Section
            Group {
                Spacer()
                    .frame(height: 50)
                Image(K.Images.loginImage)
                    .padding(.all)
                Text("Sign in to Account")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
            
            //  Fields Section
            Group {
                TextField("Email", text: $email)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30).padding(.top, 20)
                Divider()
                    .padding(.horizontal, 30)
                SecureField("Password", text: $password)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30).padding(.top, 20)
                Divider()
                    .padding(.horizontal, 30)
                if (error) {
                    Text(errorDescription)
                            .foregroundColor(.red)
                }
            }
            
            //  Button Section
            Group {
                Spacer()
                Button(action: signIn) {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 180, height: 50, alignment: .center)
                    .foregroundColor(Color(K.Colors.green))
                    .overlay(
                        Text("Sign In")
                            .foregroundColor(Color.white)
                    )
                }
            }
            
            //  Sign Up Section
            Group {
                Spacer()
                    .frame(height: 30)
                Divider()
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign up.").font(.footnote)
                    }
                }
                .padding()
            }
        }
        .modifier(AdaptsToSoftwareKeyboard())
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

//MARK: - Sign In method

extension SignInView {

    func signIn () {
        loading = true
        error = false
        session.signIn(email: email, password: password) { (result, error) in
            self.loading = false
            if let e = error {
                self.error = true
                self.errorDescription = e.localizedDescription
            } else {
                self.email = ""
                self.password = ""
                self.errorDescription = ""
            }
        }
    }
}
