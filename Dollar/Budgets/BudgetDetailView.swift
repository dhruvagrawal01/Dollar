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
    
    var body: some View {
        VStack {
            
            List {
                Text("Test")
            }.navigationTitle(selectedBudget.name)
        }
    }
}

struct BudgetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetDetailView(orgName: "SPYDR", selectedBudget: Budget.sample[0])
    }
}
