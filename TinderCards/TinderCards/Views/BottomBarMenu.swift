//
//  BottomBarMenu.swift
//  TinderCards
//
//  Created by Olena Stepaniuk on 21.03.2023.
//

import SwiftUI

struct BottomBarMenu: View {
    var body: some View {
        HStack {
            Image(systemName: "xmark")
                .font(.system(size: 30))
                .foregroundColor(.black)
            
            Button {
                
            } label: {
                Text("BOOK IT NOW")
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 35)
                    .padding(.vertical, 15)
                    .background(Color.black)
                    .cornerRadius(10)
            }.padding(.horizontal, 20)

            Image(systemName: "heart")
                .font(.system(size: 30))
                .foregroundColor(.black)
        }
    }
}

struct BottomBarMenu_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarMenu()
    }
}
