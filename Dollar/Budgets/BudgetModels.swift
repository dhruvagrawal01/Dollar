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

class Budget2: Identifiable, Hashable {
    static func == (lhs: Budget2, rhs: Budget2) -> Bool {
        lhs.id == rhs.id
    }
    
    let id = UUID()
    var name: String
    var budget: Float
    var activity: Float
    var balance: Float
    var transactions: [Transaction2]
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
        transactions.append(Transaction2(item: item, entityFrom: entityFrom, entityTo: entityTo, amount: amount, description: description, budget: name, group: groupName, date: date))
        
        if !groups.contains(groupName) {
            groups.append(groupName)
            groups = groups.sorted()
        }
        
        balance -= amount
    }
    
    func addTransaction(transaction: Transaction2) {
        let newTransaction = Transaction2(item: transaction.item, entityFrom: transaction.entityFrom, entityTo: transaction.entityTo, amount: transaction.amount, description: transaction.description, budget: name, group: transaction.group, date: transaction.date)
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

extension Budget2 {
    static var sample: [Budget2] {
        let budgets = [
            Budget2(budgetName: "General", initBudget: 1000),
            Budget2(budgetName: "Project 1", initBudget: 2500),
            Budget2(budgetName: "Social", initBudget: 500),
            Budget2(budgetName: "Project 2", initBudget: 8000)
        ]
        
        var oneDay = DateComponents()
        var twoDays = DateComponents()
        
        oneDay.day = 1
        twoDays.day = 2
        
        budgets.forEach { budget in
            
            budget.addTransaction(transaction: Transaction2(item: "Posters", entityFrom: "Pranav", entityTo: "Amazon", amount: 49.99, description: "Posters for Quad Day", budget: budget.name, group: "General", date: Date.now))
            
            var sampleTransaction = Transaction2(item: "Motor Controllers", entityFrom: "Person", entityTo: "Amazon", amount: 195, description: "Motor controllers for project", budget: budget.name, group: "Project", date: Calendar.current.date(byAdding: oneDay, to: Date.now)!)
            budget.addTransaction(transaction: sampleTransaction)
            
            sampleTransaction = Transaction2(item: "Event catering", entityFrom: "Person", entityTo: "Jimmy Johns", amount: 249, description: "Food for recent tech talk event", budget: budget.name, group: "General", date: Calendar.current.date(byAdding: twoDays, to: Date.now)!)
            budget.addTransaction(transaction: sampleTransaction)
        }
        
        return budgets
    }
}

struct Transaction2: Identifiable, Hashable {
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

extension Transaction2 {
    static var sample: Transaction2 {
        Transaction2(item: "Posters", entityFrom: "Pranav", entityTo: "Amazon", amount: 49.99, description: "Posters for Quad Day", budget: "General", group: "General", date: Date.now)
    }
}
