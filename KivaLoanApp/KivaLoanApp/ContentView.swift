//
//  ContentView.swift
//  KivaLoanApp
//
//  Created by Olena Stepaniuk on 30.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var loanStore = LoanStore()

    @State private var filterEnabled = false
    @State private var maxLoanAmount = 10000.0
    
    var body: some View {
        NavigationStack {
            if filterEnabled {
                LoanFilterView(amount: self.$maxLoanAmount)
                    .transition(.opacity)
            }
            
            List(loanStore.loans) { loan in
                LoanCellView(loan: loan)
                    .padding(.vertical, 5)
            }
            .navigationTitle("Kiva Loan")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation(.linear) {
                            self.filterEnabled.toggle()
                            self.loanStore.filterLoans(maxAmount: Int(self.maxLoanAmount))
                        }
                    } label: {
                        Text("Filter")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }

                }
            }
        }
        // unlike .onAppear, .task will be automatically cancelled when the view is destroyed 
        .task {
            self.loanStore.fetchLatestLoans()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
