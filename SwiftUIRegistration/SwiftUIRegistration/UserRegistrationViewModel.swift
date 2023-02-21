//
//  UserRegistrationViewModel.swift
//  SwiftUIRegistration
//
//  Created by Olena Stepaniuk on 21.02.2023.
//

import Foundation
import Combine

class UserRegistrationViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var password = ""
    @Published var passwordConfirm = ""
    
    @Published var isUsernameLengthValid = false
    @Published var isPasswordLengthValid = false
    @Published var isPasswordCapitalLetter = false
    @Published var isPasswordConfirmValid = false
    
    private var disposed: Set<AnyCancellable> = []
    
    init() {
        $username
            .receive(on: RunLoop.main)
            .map { username in
                return username.count >= 4
            }
            .assign(to: \.isUsernameLengthValid, on: self)
            .store(in: &disposed)
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                return password.count >= 8
            }
            .assign(to: \.isPasswordLengthValid, on: self)
            .store(in: &disposed)
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                let pattern = "[A-Z]"
                
                return password.range(of: pattern, options: .regularExpression) != nil
            }
            .assign(to: \.isPasswordCapitalLetter, on: self)
            .store(in: &disposed)
        
        Publishers.CombineLatest($password, $passwordConfirm)
            .receive(on: RunLoop.main)
            .map { password, passwordConfirm in
                return !passwordConfirm.isEmpty && passwordConfirm == password
            }
            .assign(to: \.isPasswordConfirmValid, on: self)
            .store(in: &disposed)
    }
}
