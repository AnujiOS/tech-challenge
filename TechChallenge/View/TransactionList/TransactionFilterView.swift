//
//  TransactionFilterView.swift
//  TechChallenge
//
//  Created by Anuj Joshi on 12/04/22.
//

import SwiftUI

struct TransactionFilterView: View {
    
    let noFilter: String = "all"
   
    @ObservedObject var viewModel: TransactionViewModel

    var body: some View {
        ScrollView(.horizontal) {
        HStack(spacing: 15) {
            Button {
                viewModel.transcationFilter(category: TransactionModel.Category?.none)
            } label: {
                Text(noFilter)
                    .padding([.trailing, .leading], 15)
                    .padding([.top, .bottom], 3)
                    .background(Color.black)
                    .font(.title2.weight(.bold))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }

            ForEach(TransactionModel.Category.allCases) { category in
                    Button{
                        viewModel.transcationFilter(category: category)
                    } label: {
                        Text(category.rawValue)
                            .padding([.trailing, .leading], 15)
                            .padding([.top, .bottom], 3)
                            .background(category.color)
                            .font(.title2.weight(.bold))
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                }
            }.padding([.top, .bottom], 15)
                .padding([.trailing, .leading], 3)
        }.background(Color.accentColor)
            .opacity(0.8)
    }
}

struct TransactionFilterView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionFilterView(viewModel: TransactionViewModel())
    }
}
