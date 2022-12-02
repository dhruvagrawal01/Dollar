//
//  HomeView.swift
//  Dollar
//
//  Created by Pranav Burugula on 11/11/22.
//

import SwiftUI

struct transaction_card: View {
    @Binding var page_index: Int
    @Binding var transaction_id: Int
    @State var id: Int
    @State var t_names : [String]
    @State var t_names_from : [String]
    @State var t_nums : [String]
    @State var t_descriptions : [String]
    @State var is_upcoming : Bool
    @State var expanded = false
    @State var h = CGFloat(100)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25).fill(.gray.opacity(0.5))
            .overlay(
                VStack {
                    if (!expanded) {
                        Spacer(minLength: 50)
                    }
                    if expanded == false {
                        Spacer(minLength: 25)
                    }
                    HStack {
                        Text(t_names_from[id])
                        Text("->").font(.system(size: 20))
                        Text(t_names[id])
                    }
                    Text(t_nums[id]).font(.system(size: 30))
                    Text("Description").opacity(expanded ? 1 : 0).fontWeight(.bold)
                    Text(t_descriptions[id]).multilineTextAlignment(.center).opacity(expanded ? 1 : 0)
                    Spacer().frame(height: 30)
//                    if t_names[id] == u_names[id] && t_names_from[id] == u_names_from[id] && t_nums[id] == u_nums[id] && t_descriptions[id] == u_descriptions[id] {
//                        can_pay = true
//                    }
                    VStack {
                        NavigationLink(value: Transaction(transName: "Spyder", transFrom: t_names_from[id], transTo: t_names[id], transAmount: Float(t_nums[id]) ?? Float(0), transDesc: t_descriptions[id], transDate: Date.now, transGroup: "General")) {
                            Text("More Info").frame(height: 10).background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white).frame(width: 100, height: 30)).opacity(expanded ? 1 : 0)
                        }
                        Button("Pay") {
                            expanded = false
                            transaction_id = id
                            page_index = 7
                        }.opacity(expanded && is_upcoming ? 1 : 0)
                    }
                }
                
            )
            .foregroundColor(.black)
            .frame(width: 300, height: h)
            .animation(.easeIn, value: 1.0)
            .onTapGesture {
                if (expanded == true) {
                    h = CGFloat(100)
                    expanded.toggle()
                } else {
                    h = CGFloat(200)
                    expanded.toggle()
                }
            }
            

    }
}

struct HomeView: View {
    @Binding var page_index: Int
    @Binding var transaction_id: Int
    @State var view_toggle = 0 //me = 0, org = 1, upcoming = 2
    
    //Me
    @Binding var t_names : [String]
    @Binding var t_names_from : [String]
    @Binding var t_nums : [String]
    @Binding var t_descriptions : [String]
    
    
    //Org
    @Binding var o_names : [String]
    @Binding var o_names_from : [String]
    @Binding var o_nums : [String]
    @Binding var o_descriptions : [String]
    
    //Upcoming
    @Binding var u_names : [String]
    @Binding var u_names_from : [String]
    @Binding var u_nums : [String]
    @Binding var u_descriptions : [String]
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                VStack {
                    ZStack {
                        HStack {
                            Button {
                                view_toggle = 0
                            } label: {
                                Text("Upcoming")
                            }.foregroundColor(.black).background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray.opacity(0.5)).frame(minWidth: 35).opacity(view_toggle == 0 ? 1 : 0))
                            Button {
                                view_toggle = 1
                            } label: {
                                Text("Me")
                            }.foregroundColor(.black).background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray.opacity(0.5)).frame(minWidth: 35).opacity(view_toggle == 1 ? 1 : 0))
                            Button {
                                view_toggle = 2
                            } label: {
                                Text("Org")
                            }.foregroundColor(.black).background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray.opacity(0.5)).frame(minWidth: 35).opacity(view_toggle == 2 ? 1 : 0))
                        }.position(x: geo.size.width/2, y: geo.size.height/6)
                    }
                
                    ZStack {
                        ScrollView {
                            ForEach((0...u_names.count-1), id: \.self) {
                                transaction_card(page_index: $page_index, transaction_id: $transaction_id, id: $0, t_names: u_names, t_names_from: u_names_from, t_nums: u_nums, t_descriptions: u_descriptions, is_upcoming: true)
                            }
                        }.frame(width: geo.size.width / 1.5, height: geo.size.height / 2).position(x: geo.size.width / 2).opacity(view_toggle == 0 ? 1 : 0)
                        
                        ScrollView {
                            ForEach((0...t_names.count-1), id: \.self) {
                                //Text("\($0)")
                                transaction_card(page_index: $page_index, transaction_id: $transaction_id, id: $0, t_names: t_names, t_names_from: t_names_from, t_nums: t_nums, t_descriptions: t_descriptions, is_upcoming: false)
                            }
                        }.frame(width: geo.size.width / 1.5, height: geo.size.height / 2).position(x: geo.size.width / 2).opacity(view_toggle == 1 ? 1 : 0)
                        
                        
                        ScrollView {
                            ForEach((0...o_names.count-1), id: \.self) {
                                //Text("\($0)")
                                transaction_card(page_index: $page_index, transaction_id: $transaction_id, id: $0, t_names: o_names, t_names_from: o_names_from, t_nums: o_nums, t_descriptions: o_descriptions, is_upcoming: false)
                            }
                        }.frame(width: geo.size.width / 1.5, height: geo.size.height / 2).position(x: geo.size.width / 2).opacity(view_toggle == 2 ? 1 : 0)
                    }
                }.navigationTitle("Spyder")
                    .navigationDestination(for: Transaction.self) { transact in
                        TransactionDetailView(transaction: transact)
                    }
            }
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var t_names = ["Jeff", "Me", "Me", "Andrew", "Lee", "Carl", "Madeline"]
//    static var t_names_from = ["Me", "Greg", "Kate", "Me", "Me", "Carl", "Me"]
//    static var t_nums = ["$10", "$20", "$32", "$12", "$24", "$34", "$124"]
//    static var t_descriptions = ["50 club mixer flyers", "New member lunch for Sammy", "Late fee for coming to club meeting late", "Pizza sales", "Payment plan for car #4 dues", "Cookie Sales", "Barn Dance ticket"]
//
//
//
//    static var o_names = ["Darden", "Org", "Org", "Samitha", "Raymond", "Org", "Madeline"]
//    static var o_names_from = ["Org", "Luke", "Matt", "Org", "Org", "Carl", "Org"]
//    static var o_nums = ["$3", "$60", "$32", "$12", "$24", "$34", "$124"]
//    static var o_descriptions = ["Bonding for club event", "2 axle components for car #2", "Seven screwdrivers for all teams", "20 arduinos", "CIF Room booking", "Photographer for photoshoot", "Misc"]
//
//    
//    static var u_names = ["Spyder", "Jared", "Spyder", "Dak", "Spyder", "Spyder", "Madeline"]
//    static var u_names_from = ["Me", "Me", "Me", "Me", "Me", "Me", "Me"]
//    static var u_nums = ["$33", "$20", "$32", "$28", "$44", "$21", "$18"]
//    static var u_descriptions = ["d", "2 axle components for car #2", "Seven screwdrivers for all teams", "20 arduinos", "CIF Room booking", "Photographer for photoshoot", "Misc"]
//
//    static var previews: some View {
//        HomeView(page_index: .constant(0), transaction_id: .constant(0), t_names: t_names, t_names_from: t_names_from, t_nums: t_nums, t_descriptions: t_descriptions, o_names: o_names, o_names_from: o_names_from, o_nums: o_nums, o_descriptions: o_descriptions, u_names: u_names, u_names_from: u_names_from, u_nums: u_nums, u_descriptions: u_descriptions)
//    }
//}
