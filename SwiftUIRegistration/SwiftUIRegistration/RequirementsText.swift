//
//  RequirementsText.swift
//  SwiftUIRegistration
//
//  Created by Olena Stepaniuk on 21.02.2023.
//

import SwiftUI

struct RequirementsText: View {
    
    var image: String
    var imageTintColor = Color.red
    var text: String
    var textColor = Color(.systemGray2)
    
    var isStrikeThrough = false
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(imageTintColor)
            
            Text(text)
                .foregroundColor(textColor)
                .font(.caption)
                .strikethrough(isStrikeThrough)
        }
    }
}

struct RequirementsText_Previews: PreviewProvider {
    static var previews: some View {
        RequirementsText(image: "square.split.diagonal.2x2", text: "A minimum of 4 characters")
    }
}
