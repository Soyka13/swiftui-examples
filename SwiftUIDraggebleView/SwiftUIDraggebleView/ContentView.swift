//
//  ContentView.swift
//  SwiftUIDraggebleView
//
//  Created by Olena Stepaniuk on 24.02.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        DraggableView {
            Image(systemName: "star.circle.fill")
                .font(.system(size: 200))
                .foregroundColor(.green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
