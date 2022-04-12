//
//  TransactionFilterView.swift
//  TechChallenge
//
//  Created by Anuj Joshi on 12/04/22.
//

import SwiftUI

struct TransactionFilterView: View {
    var body: some View {
        ScrollView(.horizontal) {
        HStack(spacing: 15) {
                ForEach(TransactionModel.Category.allCases) { category in
                    Button(action: {
                        //Add action of Button
                    }) {
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
        TransactionFilterView()
    }
}
