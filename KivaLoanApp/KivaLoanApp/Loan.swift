//
//  Loan.swift
//  KivaLoanApp
//
//  Created by Olena Stepaniuk on 30.03.2023.
//

import Foundation

class LoanStore: Decodable, ObservableObject {
    
    @Published var loans: [Loan] = []
    
    private var cachedLoans: [Loan] = []
    
    private static var kivaLoanURL = "https://api.kivaws.org/v1/loans/newest.json"
    
    enum CodingKeys: CodingKey {
        case loans
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        loans = try values.decode([Loan].self, forKey: .loans)
    }
    
    init() {}
    
    func filterLoans(maxAmount: Int) {
        self.loans = self.cachedLoans.filter({ $0.amount < maxAmount})
    }
    
    func fetchLatestLoans() {
        
        guard let url = URL(string: Self.kivaLoanURL) else {
            return
        }
        
        let reqeust = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: reqeust) { data, _, error in
            
            if let error {
                print(error)
                return
            }
            
            if let data {
                DispatchQueue.main.async {
                    self.loans = self.parseJSONData(data: data)
                    self.cachedLoans = self.loans
                }
            }
        }.resume()
        
    }
    
    func parseJSONData(data: Data) -> [Loan] {
        
        let decoder = JSONDecoder()
        
        do {
            let loanStore = try decoder.decode(LoanStore.self, from: data)
            self.loans = loanStore.loans
        } catch {
            print(error)
        }
        
        return loans
    }
}

struct Loan: Codable {

    var name: String
    var location: Location
    var use: String
    var amount: Int
    
    enum CodingKeys: String, CodingKey {
        case name, location, use
        case amount = "loan_amount"
    }
}

struct Location: Codable {
    var country: String
}

extension Loan: Identifiable {
    var id: UUID {
        UUID()
    }
}
