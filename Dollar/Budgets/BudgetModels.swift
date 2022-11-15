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
    
    func addTransaction(item: String, entityFrom: String, entityTo: String, amount: Float, description: String, groupName: String, date: Date) {
        transactions.append(Transaction(item: item, entityFrom: entityFrom, entityTo: entityTo, amount: amount, description: description, budget: name, group: groupName, date: date))
        
        if !groups.contains(groupName) {
            groups.append(groupName)
            groups = groups.sorted()
        }
        
        balance -= amount
    }
    
    func addTransaction(transaction: Transaction) {
        let newTransaction = Transaction(item: transaction.item, entityFrom: transaction.entityFrom, entityTo: transaction.entityTo, amount: transaction.amount, description: transaction.description, budget: name, group: transaction.group, date: transaction.date)
        transactions.append(newTransaction)
        
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
        
        var oneDay = DateComponents()
        var twoDays = DateComponents()
        
        oneDay.day = 1
        twoDays.day = 2
        
        budgets.forEach { budget in
            budget.addTransaction(transaction: Transaction.sample)
            
            var sampleTransaction = Transaction(item: "Test 2", entityFrom: "Person", entityTo: "Org", amount: 195, description: "Test", budget: "Test", group: "Project", date: Calendar.current.date(byAdding: oneDay, to: Date.now)!)
            budget.addTransaction(transaction: sampleTransaction)
            
            sampleTransaction = Transaction(item: "Test 3", entityFrom: "Person", entityTo: "Org", amount: 249, description: "Test", budget: "Test", group: "General", date: Calendar.current.date(byAdding: twoDays, to: Date.now)!)
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
    var budget: String
    var group = ""
    var date: Date
}

extension Transaction {
    static var sample: Transaction {
        Transaction(item: "Test", entityFrom: "Pranav", entityTo: "Amazon", amount: 49.99, description: "Test item from Amazon", budget: "General", group: "General", date: Date.now)
    }
}
