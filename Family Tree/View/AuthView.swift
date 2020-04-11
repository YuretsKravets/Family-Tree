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

//MARK: - Sign In

struct SignInView: View {
    //  UNCOMMENT while releasing the app
    //  @State var email: String = "a@b.com"
    //  @State var password: String = "123456"
    
    //  initialazing with this values for faster login while developing
    @State var email: String = "a@b.com"
    @State var password: String = "123456"
    
    @State var loading = false
    @State var error = false
    var errorDescription = ""

    @EnvironmentObject var loginManager: LoginManager

    func signIn () {
        loading = true
        error = false
        
        if loginManager.signIn(email,password) {
            email = ""
            password = ""
            loginManager.isLoggedIn = true
        } else {
            error = true
            loginManager.isLoggedIn = false
        }
        
        loading = false
    }
    
    var body: some View {
        VStack {
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
                    Text(loginManager.errorDescription)
                            .foregroundColor(.red)
                }
            }
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

//MARK: - Sign Up

struct SignUpView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false
    @State var success = false

    @EnvironmentObject var loginManager: LoginManager

    func signUp () {
        loading = true
        error = false
        success = false
        
        if loginManager.signUp(email,password) {
            success = true
            email = ""
            password = ""
        } else {
            error = true
        }
        
        loading = false
    }
    
    var body: some View {
        VStack {
            Group {
                Spacer()
                    .frame(height: 50)
                Image(K.Images.registerImage)
                    .padding(.all)
                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
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
                if (success) {
                    Text("You've successfuly signed up. Please, log in your account.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.green)
                }
                if (error) {
                    Text(loginManager.errorDescription)
                            .foregroundColor(.red)
                }
            }
            Group {
                Spacer()
                Button(action: signUp) {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 180, height: 50, alignment: .center)
                        .foregroundColor(Color(K.Colors.green))
                        .overlay(
                            Text("Sign Up")
                                .foregroundColor(Color.white)
                        )
                        .padding(.bottom, 20)
                }
            }
        }
        .modifier(AdaptsToSoftwareKeyboard())
    }
}
