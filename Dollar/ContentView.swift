//
//  ContentView.swift
//  Dollar
//
//  Created by Pranav Burugula on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var page_index = 0
    
    @State var t_names = ["Jeff", "Greg", "Kate", "Andrew", "Lee", "Carl", "Madeline"]
    @State var t_nums = ["- $10", "+ $20", "+ $32", "- $12", "- $24", "+ $34", "- $124"]
    @State var t_descriptions = ["50 club mixer flyers", "New member lunch for Sammy", "Late fee for coming to club meeting late", "Pizza sales", "Payment plan for car #4 dues", "Cookie Sales", "Barn Dance ticket"]
    
    
    @State var o_names = ["Darden", "Luke", "Matt", "Samitha", "Raymond", "Carl", "Madeline"]
    @State var o_nums = ["+ $3", "- $60", "- $32", "- $12", "+ $24", "- $34", "+ $124"]
    @State var o_descriptions = ["Bonding for club event", "2 axle components for car #2", "Seven screwdrivers for all teams", "20 arduinos", "CIF Room booking", "Photographer for photoshoot", "Misc"]
    
    
    @State var u_names = ["Spyder", "Jared", "Spyder", "Dak", "Spyder", "Spyder", "Madeline"]
    @State var u_nums = ["$33", "$20", "$32", "$28", "$44", "$21", "$18"]
    @State var u_descriptions = ["d", "2 axle components for car #2", "Seven screwdrivers for all teams", "20 arduinos", "CIF Room booking", "Photographer for photoshoot", "Misc"]
    
    @State var budgets = Budget.samples
    
    var body: some View {
		VStack(alignment: .center) {
			switch page_index {
			case 0:
				HomeView(page_index: $page_index, t_names: t_names, t_nums: t_nums, t_descriptions: t_descriptions, o_names: o_names, o_nums: o_nums, o_descriptions: o_descriptions, u_names: u_names, u_nums: u_nums, u_descriptions: u_descriptions)
			case 1:
				BudgetsOverview(orgName: "SPYDR", origBudgets: budgets, displayedBudgets: budgets)
			case 2:
				OrgnizationOverview(page_index: $page_index)
			case 3:
				OrgView(page_index: $page_index)
			case 4:
				RequestView(page_index: $page_index, t_names: $t_names, t_nums: $t_nums, t_descriptions: $t_descriptions, o_names: $o_names, o_nums: $o_nums, o_descriptions: $o_descriptions, u_names: $u_names, u_nums: $u_nums, u_descriptions: $u_descriptions)
			case 5:
				ReimbursementView(page_index: $page_index, t_names: $t_names, t_nums: $t_nums, t_descriptions: $t_descriptions)
			default:
				HomeView(page_index: $page_index, t_names: t_names, t_nums: t_nums, t_descriptions: t_descriptions, o_names: o_names, o_nums: o_nums, o_descriptions: o_descriptions, u_names: u_names, u_nums: u_nums, u_descriptions: u_descriptions)
			}
			
			if (page_index != 3) {
				NavbarView(page_index: $page_index)
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
