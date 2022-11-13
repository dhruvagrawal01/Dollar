//
//  BudgetModels.swift
//  Dollar
//
//  Created by Pranav Burugula on 11/11/22.
//

import Foundation

struct BudgetHighlight: Identifiable {
    let id = UUID()
    let name: String
    let budget: Float
    let activity: Float
    let balance: Float
}

class Budget: Identifiable, Hashable {
    static func == (lhs: Budget, rhs: Budget) -> Bool {
        lhs.id == rhs.id
    }
    
    let id = UUID()
    var name: String
    var budget: Float
    var activity: Float
    var balance: Float
    var transactions: [Transaction]
    
    init(budgetName: String, initBudget: Float) {
        name = budgetName
        budget = initBudget
        activity = 0
        balance = 0
        transactions = []
    }
    
    func addTransaction(item: String, entityFrom: String, entityTo: String, amount: Float, description: String) {
        transactions.append(Transaction(item: item, entityFrom: entityFrom, entityTo: entityTo, amount: amount, description: description))
        balance -= amount
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Budget {
    static var sample: [Budget] {
        [
            Budget(budgetName: "General", initBudget: 1000),
            Budget(budgetName: "Project 1", initBudget: 2500),
            Budget(budgetName: "Social", initBudget: 500),
            Budget(budgetName: "Project 2", initBudget: 8000)
        ]
    }
}

struct Transaction: Identifiable {
    let id = UUID()
    var item: String
    var entityFrom: String
    var entityTo: String
    var amount: Float
    var description: String
    
}
