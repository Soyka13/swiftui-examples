//
//  SwiftUIRegistrationApp.swift
//  SwiftUIRegistration
//
//  Created by Olena Stepaniuk on 21.02.2023.
//

import SwiftUI

@main
struct SwiftUIRegistrationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(userRegistrationViewModel: UserRegistrationViewModel())
        }
    }
}
