//
//  TransactionSumView.swift
//  TechChallenge
//
//  Created by Anuj Joshi on 12/04/22.
//

import SwiftUI

struct TransactionSumView: View {
    @ObservedObject var viewModel: TransactionViewModel
    
    let noFilter: String = "all"

    var body: some View {
        VStack {
            HStack {
                VStack {
                    Spacer()
                    Text("Total spent:")
                        .secondary()
                        .padding()
                }
                Spacer()
                VStack (alignment: .trailing, spacing: 5) {
                    Text(viewModel.transcationFilter?.rawValue ?? noFilter)
                        .padding(.trailing, 15)
                        .font(.headline)
                        .foregroundColor(viewModel.transcationFilter?.color ?? .black)
                    
                    Text("$\(viewModel.getSumFiltered(), specifier: "%.2f")")
                        .bold()
                        .secondary()
                        .padding(.trailing, 15)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 70)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.accentColor, lineWidth: 2)
            )
            
        }.padding([.trailing, .leading, .bottom], 5)
    }
}

struct TransactionSumView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionSumView(viewModel: TransactionViewModel())
    }
}
