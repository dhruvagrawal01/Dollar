//
//  BudgetsOverview.swift
//  Dollar
//
//  Created by Pranav Burugula on 11/11/22.
//

import SwiftUI


struct BudgetsOverview: View {
    let orgName: String
    let pageName = "Budgets Overview"
    let origBudgets: [Budget]
    
    @State private var searchString = ""
    @State var displayedBudgets: [Budget]
    
    var body: some View {
        VStack {
            NavigationStack {
                
                List {
                    
                    Section(header: GeometryReader { geometry in
                        HStack{
                            
                            Text("Name").frame(width: geometry.size.width * 0.335, alignment: .leading)
                            Text("Budget")
                            Spacer()
                            Text("Balance").frame(width: geometry.size.width * 0.26, alignment: .leading)
                            
                        }
                    }) {
                        ForEach(displayedBudgets) { budget in
                            
                            NavigationLink(value: budget) {
                                BudgetHighlightView(budget: budget)
                            }
                            
                        }
                    }
                }.searchable(text: $searchString)
                    .onChange(of: searchString, perform: { newValue in
                        if newValue.isEmpty {
                            displayedBudgets = origBudgets
                        } else {
                            displayedBudgets = origBudgets.filter { $0.name.lowercased().hasPrefix(searchString.lowercased())}
                        }
                    })
                .navigationTitle("Budgets")
                .navigationDestination(for: Budget.self) { budget in
                    BudgetDetailView(orgName: orgName, selectedBudget: budget, transactions: budget.transactions)
                }
            }
        }
    }
}

struct BudgetsOverview_Previews: PreviewProvider {
    static var previews: some View {
        BudgetsOverview(orgName: "SPYDR", origBudgets: Budget.samples, displayedBudgets: Budget.samples)
    }
}
