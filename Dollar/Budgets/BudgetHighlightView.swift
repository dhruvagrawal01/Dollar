//
//  BudgetHighlightView.swift
//  Dollar
//
//  Created by Pranav Burugula on 11/11/22.
//

import SwiftUI

struct BudgetHighlightView: View {
    let budget: Budget
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                
                Text(budget.name).frame(width: geometry.size.width * 0.35, alignment: Alignment(horizontal: .leading, vertical: .center))
                Text(String(format: "$%.02f", budget.budget))
                Spacer()
                Text(String(format: "$%.02f", budget.activity))
                Spacer()
                Text(String(format: "$%.02f", budget.balance))
                
            }.frame(width: geometry.size.width, alignment: .center)
        }
    }
}

struct BudgetHighlightView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetHighlightView(budget: Budget.sample[0])
    }
}
