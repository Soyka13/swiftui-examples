//
//  LoanCellView.swift
//  KivaLoanApp
//
//  Created by Olena Stepaniuk on 30.03.2023.
//

import SwiftUI

struct LoanCellView: View {
    
    var loan: Loan
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(loan.name)
                    .font(.system(.headline, design: .rounded))
                    .bold()
                Text(loan.location.country)
                    .font(.system(.subheadline, design: .rounded))
                Text(loan.use)
                    .font(.system(.body, design: .rounded))
            }
            
            Spacer()
            
            VStack {
                Text("$\(loan.amount)")
                    .font(.system(.title, design: .rounded))
                    .bold()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct LoanCellView_Previews: PreviewProvider {
    static var previews: some View {
        LoanCellView(loan: Loan(name: "test", location: Location(country: "test"), use: "test", amount: 1)).previewLayout(.sizeThatFits)
    }
}
