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
    var groups: [String]
    
    init(budgetName: String, initBudget: Float) {
        name = budgetName
        budget = initBudget
        activity = 0
        balance = initBudget
        transactions = []
        groups = []
    }
    
    func addTransaction(item: String, entityFrom: String, entityTo: String, amount: Float, description: String, groupName: String) {
        transactions.append(Transaction(item: item, entityFrom: entityFrom, entityTo: entityTo, amount: amount, description: description, group: groupName))
        
        if !groups.contains(groupName) {
            groups.append(groupName)
            groups = groups.sorted()
        }
        
        balance -= amount
    }
    
    func addTransaction(transaction: Transaction) {
        transactions.append(transaction)
        
        if !groups.contains(transaction.group) {
            groups.append(transaction.group)
            groups = groups.sorted()
        }
        
        balance -= transaction.amount
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Budget {
    static var sample: [Budget] {
        let budgets = [
            Budget(budgetName: "General", initBudget: 1000),
            Budget(budgetName: "Project 1", initBudget: 2500),
            Budget(budgetName: "Social", initBudget: 500),
            Budget(budgetName: "Project 2", initBudget: 8000)
        ]
        
        budgets.forEach { budget in
            budget.addTransaction(transaction: Transaction.sample)
            
            var sampleTransaction = Transaction.sample
            sampleTransaction.group = "Project"
            budget.addTransaction(transaction: sampleTransaction)
        }
        
        return budgets
    }
}

struct Transaction: Identifiable, Hashable {
    let id = UUID()
    var item: String
    var entityFrom: String
    var entityTo: String
    var amount: Float
    var description: String
    var group = ""
}

extension Transaction {
    static var sample: Transaction {
        Transaction(item: "Test", entityFrom: "Pranav", entityTo: "Amazon", amount: 49.99, description: "Test item from Amazon", group: "General")
    }
}
