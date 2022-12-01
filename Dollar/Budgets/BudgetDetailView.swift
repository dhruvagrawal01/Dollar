//
//  BudgetDetailView.swift
//  Dollar
//
//  Created by Pranav Burugula on 11/12/22.
//

import SwiftUI

struct BudgetDetailView: View {
    let orgName: String
    let selectedBudget: Budget
    
    @State private var searchString = ""
    @State var transactions: [Transaction]
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                HStack {
                    
                    BudgetChartView(data: transactions, initBudget: selectedBudget.allocatedAmount, budget: selectedBudget.name)
                    
                }.frame(alignment: .center)
                    .padding()
            }
            
//            NavigationStack {
                List {
                    ForEach(transactions, id: \.id) { transaction in
                        NavigationLink(value: transaction) {
                            TransactionHighlightView(transaction: transaction)
                        }
                    }
                }.searchable(text: $searchString)
                    .onChange(of: searchString, perform: { newValue in
                        if newValue.isEmpty {
                            transactions = selectedBudget.transactions
                        } else {
                            transactions = selectedBudget.transactions.filter { $0.itemName.lowercased().hasPrefix(searchString.lowercased())}
                        }
                    })
                    .listStyle(.sidebar)
//            }
        .navigationTitle(selectedBudget.name)
            .navigationDestination(for: Transaction.self) { transaction in
                TransactionDetailView(transaction: transaction)
            }
        }
    }
}

struct BudgetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetDetailView(orgName: "SPYDR", selectedBudget: Budget.sample, transactions: Budget.sample.transactions)
    }
}
