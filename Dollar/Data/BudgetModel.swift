//
//  BudgetModel.swift
//  Dollar
//
//  Created by Pranav Burugula on 11/29/22.
//

import Foundation

class Budget: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var allocatedAmount: Float
    var balance: Float
    var transactions: [Transaction]
    
    init(budgetName: String, initBudget: Float) {
        name = budgetName
        allocatedAmount = initBudget
        balance = initBudget
        transactions = []
    }
    
    static func == (lhs: Budget, rhs: Budget) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func addTransaction(transaction: Transaction, transGroup: String) {
        let ownedTrans = Transaction(origTrans: transaction, transBudgetName: name, transGroup: transGroup)
        transactions.append(ownedTrans)
        
        balance += ownedTrans.amount
    }
    
    func addTransaction(transName: String, transFrom: String, transTo: String, transAmount: Float, transDesc: String, transDate: Date, transGroup: String) {
        let transaction = Transaction(transName: transName, transFrom: transFrom, transTo: transTo, transAmount: transAmount, transDesc: transDesc, transDate: transDate, transGroup: transGroup)
        transaction.budget = name
        
        transactions.append(transaction)
        
        balance += transAmount
    }
    
    func getGroups() -> [String: [Transaction]] {
        Dictionary(grouping: transactions, by: {$0.group})
    }
}

extension Budget {
    static var samples: [Budget] {
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
        
        let today = Date.now
        let tomorrow = Calendar.current.date(byAdding: oneDay, to: Date.now)!
        let dayAfterTomorrow = Calendar.current.date(byAdding: twoDays, to: Date.now)!
        
        budgets.forEach { budget in
            
            budget.addTransaction(transaction: Transaction(transName: "Posters", transFrom: "Pranav", transTo: "Amazon", transAmount: 49.99, transDesc: "Posters for Quad Day", transDate: today, transGroup: "General"), transGroup: "General")
            
            var sampleTransaction = Transaction(transName: "Motor Controllers", transFrom: "Person", transTo: "Amazon", transAmount: 195, transDesc: "Motor controllers for project", transDate: tomorrow, transGroup: "Project")
            budget.addTransaction(transaction: sampleTransaction, transGroup: "Project")
            
            sampleTransaction = Transaction(transName: "Event catering", transFrom: "Person", transTo: "Jimmy Johns", transAmount: 249, transDesc: "Food for recent tech talk event", transDate: dayAfterTomorrow, transGroup: "General")
            budget.addTransaction(transaction: sampleTransaction, transGroup: "General")
        }
        
        return budgets
    }
    
    static var sample: Budget {
        let budget = Budget(budgetName: "General", initBudget: 1000)
        
        var oneDay = DateComponents()
        var twoDays = DateComponents()
        
        oneDay.day = 1
        twoDays.day = 2
        
        let today = Date.now
        let tomorrow = Calendar.current.date(byAdding: oneDay, to: Date.now)!
        let dayAfterTomorrow = Calendar.current.date(byAdding: twoDays, to: Date.now)!
            
        budget.addTransaction(transaction: Transaction(transName: "Posters", transFrom: "Pranav", transTo: "Amazon", transAmount: 49.99, transDesc: "Posters for Quad Day", transDate: today, transGroup: "General"), transGroup: "General")
        
        var sampleTransaction = Transaction(transName: "Motor Controllers", transFrom: "Person", transTo: "Amazon", transAmount: 195, transDesc: "Motor controllers for project", transDate: tomorrow, transGroup: "Project")
        budget.addTransaction(transaction: sampleTransaction, transGroup: "Project")
        
        sampleTransaction = Transaction(transName: "Event catering", transFrom: "Person", transTo: "Jimmy Johns", transAmount: 249, transDesc: "Food for recent tech talk event", transDate: dayAfterTomorrow, transGroup: "General")
        budget.addTransaction(transaction: sampleTransaction, transGroup: "General")
        
        return budget
    }
}
