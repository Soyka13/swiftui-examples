//
//  ContentView.swift
//  SwiftUIRegistration
//
//  Created by Olena Stepaniuk on 21.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userRegistrationViewModel: UserRegistrationViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                HStack {
                    Spacer()
                    
                    Text("Create an account")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                    
                    Spacer()
                }.padding()
                
                RegistrationTextField(
                    titleKey: "Username",
                    text: $userRegistrationViewModel.username
                )
                .padding(.bottom, 5)
                
                RequirementsText(
                    image: "square.split.diagonal.2x2",
                    text: "A minimum of 4 characters",
                    isStrikeThrough: userRegistrationViewModel.isUsernameLengthValid
                )
                .padding(.bottom, 15)
                
                RegistrationTextField(
                    titleKey: "Password",
                    text: $userRegistrationViewModel.password,
                    isSecure: true
                )
                .padding(.bottom, 5)
                
                RequirementsText(
                    image: "lock.open",
                    text: "A minimum of 8 characters",
                    isStrikeThrough: userRegistrationViewModel.isPasswordLengthValid
                )
                .padding(.bottom, 5)
                
                RequirementsText(
                    image: "lock.open",
                    text: "One uppercase letter",
                    isStrikeThrough: userRegistrationViewModel.isPasswordCapitalLetter
                )
                .padding(.bottom, 15)
                
                RegistrationTextField(
                    titleKey: "Confirm password",
                    text: $userRegistrationViewModel.passwordConfirm,
                    isSecure: true
                )
                .padding(.bottom, 5)
                
                RequirementsText(
                    image: "square.split.diagonal.2x2",
                    text: "Your confirm password should be the same as password",
                    isStrikeThrough: userRegistrationViewModel.isPasswordConfirmValid
                )
                .padding(.bottom, 55)
                
                Button {
                    
                } label: {
                    Text("Sign Up")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background {
                            LinearGradient(gradient: .redYellow, startPoint: .leading, endPoint: .trailing)
                        }
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                HStack {
                    Spacer()
                    
                    Text("Already have an account?")
                        .bold()
                        .font(.caption)
                    Button {
                        
                    } label: {
                        Text("Sign in")
                            .foregroundColor(Color(red: 251/255, green: 128/255, blue: 128/255))
                            .font(.caption)
                    }

                    Spacer()
                }
                .padding()
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userRegistrationViewModel: UserRegistrationViewModel())
    }
}

