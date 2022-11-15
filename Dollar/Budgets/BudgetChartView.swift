//
//  BudgetChartView.swift
//  Dollar
//
//  Created by Pranav Burugula on 11/14/22.
//

import SwiftUI
import Charts

struct BudgetChartView: View {
    let data: [Transaction]
    var initBudget: Float
    let budget: String
    
    func aggregateTransactions() -> [BudgetChartAggregate] {
        let transByDate = Dictionary(grouping: data, by: {$0.date})
        
        var curBudget: Float = initBudget
        
        let aggregates: [BudgetChartAggregate] = transByDate.compactMap { dateGroup in
            
            curBudget -= dateGroup.value.lazy.compactMap{$0.amount}.reduce(0, +)
            
            return BudgetChartAggregate(date: dateGroup.key, balance: curBudget, budget: budget)
            
        }
        
//        var aggregates = [Dictionary<String, BudgetChartAggregate>()]
//
//        var i = 0
//
//        transByDate.forEach { group in
//
//            var curAgg = aggregates[i]
//
//            group.value.forEach { trans in
//
//                if var budgetAgg = curAgg[trans.budget] {
//                    budgetAgg.balance -= trans.amount
//                } else {
//                    curAgg[trans.budget] = BudgetChartAggregate(date: group.key, balance:  trans.amount, budget: trans.budget)
//                }
//            }
//
//            i += 1
//            aggregates.append(Dictionary<String, BudgetChartAggregate>())
//        }
//
//        let allAggs = aggregates.flatMap { dateAgg in
//
//            Array(dateAgg.values)
//
//        }
        
        return aggregates
    }
    
    var body: some View {
        
        Chart(aggregateTransactions()) {
            
            LineMark(x: .value("Date", $0.date), y: .value("Balance", $0.balance))
                .foregroundStyle(by: .value("Budget", $0.budget))
            
        }
    }
}

struct BudgetChartView_Previews: PreviewProvider {
    static var previews: some View {
        var oneDay = DateComponents()
        var twoDays = DateComponents()
        
        oneDay.day = 1
        twoDays.day = 2
        
        return BudgetChartView(data: [
            Transaction.sample,
            Transaction(item: "Test", entityFrom: "Person", entityTo: "Org", amount: 195, description: "Test", budget: "Test", date: Calendar.current.date(byAdding: oneDay, to: Date.now)!),
            Transaction(item: "Test 2", entityFrom: "Person 2", entityTo: "Org", amount: 249, description: "Test 2", budget: "Test", date: Calendar.current.date(byAdding: twoDays, to: Date.now)!)
        ], initBudget: 1000, budget: "General")
    }
}

struct BudgetChartAggregate: Identifiable {
    var id = UUID()
    var date: Date
    var balance: Float
    var budget: String
}
