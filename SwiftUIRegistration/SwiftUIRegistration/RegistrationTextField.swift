//
//  RegistrationTextField.swift
//  SwiftUIRegistration
//
//  Created by Olena Stepaniuk on 21.02.2023.
//

import SwiftUI

struct RegistrationTextField: View {
    
    var titleKey: String
    @Binding var text: String
    
    var isSecure = false
    
    var body: some View {
        
        VStack {
            if isSecure {
                SecureField(titleKey, text: $text)
            } else {
                TextField(titleKey, text: $text)
            }
            
            Divider()
                .frame(height: 1)
        }
    }
}

struct RegistrationTextField_Previews: PreviewProvider {
    
    @State private static var username = ""
    
    static var previews: some View {
        RegistrationTextField(titleKey: "Username", text: $username)
    }
}
