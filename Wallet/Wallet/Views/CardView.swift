//
//  CardView.swift
//  Wallet
//
//  Created by Olena Stepaniuk on 21.03.2023.
//

import SwiftUI

struct CardView: View {
    
    var card: Card
    
    var body: some View {
        Image(card.image)
            .resizable()
            .scaledToFit()
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading) {
                    Text(card.number)
                        .bold()
                    
                    HStack {
                        Text(card.name)
                            .bold()
                        Text("Valid Thru")
                            .font(.footnote)
                        Text(card.expiryDate)
                            .font(.footnote)
                    }
                }
                .foregroundColor(.white)
                .padding(.leading, 25)
                .padding(.bottom, 20)
            }
            .shadow(color: .gray, radius: 1.0, x: 0.0, y: 1.0)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(testCards) { card in
            CardView(card: card).previewDisplayName(card.type.rawValue)
        }
    }
}
