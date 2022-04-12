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
    
    var pinnedTransaction: [Int] = ModelData.sampleTransactions.map({ $0.id })

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
            .filter{ isPinned($0) }
            .reduce(0.0, { $0 + $1.amount })
    }
    
    func isPinned(_ transaction: TransactionModel) -> Bool {
        pinnedTransaction.contains(where: { $0 == transaction.id })
    }

    func togglePin(_ transaction: TransactionModel) -> Bool {
        if isPinned(transaction) {
            pinnedTransaction.removeAll(where: {$0 == transaction.id})
        } else {
            pinnedTransaction.append(transaction.id)
        }
        return !transaction.pinned
    }
}
