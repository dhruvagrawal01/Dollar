//
//  TransactionModel.swift
//  Dollar
//
//  Created by Pranav Burugula on 11/29/22.
//

import Foundation

class Transaction: Identifiable, Hashable {
    
    let id = UUID()
    var itemName: String
    var entityFrom: String
    var entityTo: String
    var amount: Float
    var description: String
    var date: Date
    var group: String
    var budget: String
    
    enum Status {
        case pending, sent, delivered, cancelled
    }
    var status: Status = Status.pending
    
    init(transName: String, transFrom: String, transTo: String, transAmount: Float, transDesc: String, transDate: Date, transGroup: String) {
        itemName = transName
        entityFrom = transFrom
        entityTo = transTo
        amount = transAmount
        description = transDesc
        date = transDate
        group = transGroup
        budget = "None"
    }
    
    init(origTrans: Transaction, transBudgetName: String, transGroup: String) {
        itemName = origTrans.itemName
        entityFrom = origTrans.entityFrom
        entityTo = origTrans.entityTo
        amount = origTrans.amount
        description = origTrans.description
        date = origTrans.date
        group = transGroup
        budget = transBudgetName
    }
    
    static func == (lhs: Transaction, rhs: Transaction) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

extension Transaction {
    static var sample: Transaction {
        Transaction(transName: "Posters", transFrom: "Pranav", transTo: "Amazon", transAmount: 49.99, transDesc: "Posters for Quad Day", transDate: Date.now, transGroup: "General")
    }
    
    static var samples: [Transaction] {
        var oneDay = DateComponents()
        var twoDays = DateComponents()
        
        oneDay.day = 1
        twoDays.day = 2
        
        let tomorrow = Calendar.current.date(byAdding: oneDay, to: Date.now)!
        let dayAfterTomorrow = Calendar.current.date(byAdding: twoDays, to: Date.now)!
        
        let transactions = [
            Transaction.sample,
            Transaction(transName: "Test", transFrom: "Person", transTo: "Org", transAmount: 195, transDesc: "Test", transDate: tomorrow, transGroup: "General"),
            Transaction(transName: "Test 2", transFrom: "Person 2", transTo: "Org", transAmount: 249, transDesc: "Test 2", transDate: dayAfterTomorrow, transGroup: "General")
        ]
        
        return transactions
    }
}
