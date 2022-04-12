//
//  TransactionViewModel.swift
//  TechChallenge
//
//  Created by Anuj Joshi on 12/04/22.
//

import Foundation
import SwiftUI

class TransactionViewModel: ObservableObject {
    
    @Published var transcationFilter: TransactionModel.Category?
    @Published var transactions: [TransactionModel] = ModelData.sampleTransactions

    func transcationFilter(category: TransactionModel.Category?) {
        guard category != .none else {
            transactions = ModelData.sampleTransactions
            transcationFilter = .none
            return
        }
        transactions = ModelData.sampleTransactions.filter({ $0.category == category })
        transcationFilter = category
    }
    
    func getSumFiltered() -> Double {
        transactions
            .reduce(0, { $0 + $1.amount })
    }
}
