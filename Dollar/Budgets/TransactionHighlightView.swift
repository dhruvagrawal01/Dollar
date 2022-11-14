//
//  TransactionHighlightView.swift
//  Dollar
//
//  Created by Pranav Burugula on 11/12/22.
//

import SwiftUI

struct TransactionHighlightView: View {
    let transaction: Transaction
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                
                Text(transaction.item).frame(width: geometry.size.width * 0.35, alignment: Alignment(horizontal: .leading, vertical: .center))
                Text(transaction.entityFrom)
                Spacer()
                Text(transaction.entityTo)
                Spacer()
                Text(String(format: "$%.02f", transaction.amount))
                
            }.frame(width: geometry.size.width, alignment: .center)
        }
    }
}

struct TransactionHighlightView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHighlightView(transaction: Transaction.sample)
    }
}
