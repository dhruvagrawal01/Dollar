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
    @State private var transactions: [Transaction] = []
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                HStack {
                    
                    BudgetChartView(data: selectedBudget.transactions, initBudget: selectedBudget.budget, budget: selectedBudget.name)
                    
                }.frame(alignment: .center)
                    .padding()
            }
            
            List {
                ForEach(selectedBudget.groups, id: \.self) { group in
                    Section(header: Text(group)) {
                        ForEach(selectedBudget.transactions.filter {
                            $0.group.lowercased() == group.lowercased()
                        }) { transaction in
                            NavigationLink(value: transaction) {
                                TransactionHighlightView(transaction: transaction)
                            }
                        }
                    }
                }
            }.searchable(text: $searchString)
            .onChange(of: searchString, perform: { newValue in
                if newValue.isEmpty {
                    transactions = selectedBudget.transactions
                } else {
                    transactions = selectedBudget.transactions.filter { $0.item.lowercased().hasPrefix(searchString.lowercased())}
                }
            })
            .listStyle(.sidebar)
            .navigationTitle(selectedBudget.name)
        }
    }
}

struct BudgetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetDetailView(orgName: "SPYDR", selectedBudget: Budget.sample[0])
    }
}
