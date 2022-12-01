//
//  TransactionDetailView.swift
//  Dollar
//
//  Created by Pranav Burugula on 11/18/22.
//

import SwiftUI

struct TransactionDetailView: View {
    let transaction: Transaction
    
    var body: some View {
        GeometryReader { geometry in
            Spacer()
            VStack(alignment: .leading) {
                Text(transaction.itemName)
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                
                Text(transaction.description)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                
                Spacer().frame(height: 20)
                
                HStack {
                    Text(transaction.entityFrom)
                    Spacer()
                    Image(systemName: "ArrowIcon")
                    Spacer()
                    Text(transaction.entityTo)
                }
                
                Text("Budget: \(transaction.budget)")
                    .font(.headline)
                Text("Group: \(transaction.group)")
                    .font(.headline)
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .frame(width: geometry.size.width * 0.95, alignment: .center)
                .overlay(
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).stroke(Color.black, lineWidth: 3)
            ).navigationTitle("")
            Spacer()
        }
    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailView(transaction: Transaction.sample)
    }
}
