//
//  HomeView.swift
//  Dollar
//
//  Created by Pranav Burugula on 11/11/22.
//

import SwiftUI

struct transaction_card: View {
    @State var id: Int
    @State var t_names : [String]
    @State var t_nums : [String]
    @State var t_descriptions : [String]
    @State var expanded = false
    @State var h = CGFloat(100)
    var body: some View {
        RoundedRectangle(cornerRadius: 25).fill(.gray)
            .overlay(
                VStack {
                    if (!expanded) {
                        Spacer(minLength: 50)
                    }
                    HStack {
                        Text(t_names[id])
                        Text(t_nums[id]).font(.system(size: 25)).padding()
                    }
                    Text("Description").opacity(expanded ? 1 : 0).fontWeight(.bold)
                    Text(t_descriptions[id]).multilineTextAlignment(.center).opacity(expanded ? 1 : 0)
                }
                
            )
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
    @State var view_toggle = true //me = True, org = False
    
    //Dummy variables
    @State var t_names : [String]
    @State var t_nums : [String]
    @State var t_descriptions : [String]
    
    
    @State var o_names : [String]
    @State var o_nums : [String]
    @State var o_descriptions : [String]
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("Spyder")
                    .font(.system(size: 52))
                    .fontWeight(.bold)
                ZStack {
                    HStack {
                        Button {
                            view_toggle.toggle()
                        } label: {
                            Text("Me")
                        }.foregroundColor(.black).background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray).frame(minWidth: 35).opacity(view_toggle ? 1 : 0))
                        Button {
                            view_toggle.toggle()
                        } label: {
                            Text("Org")
                        }.foregroundColor(.black).background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray).frame(minWidth: 35).opacity(view_toggle ? 0 : 1))
                    }.position(x: geo.size.width/2, y: geo.size.height/6)
                }
                ZStack {
                    ScrollView {
                        ForEach((0...t_names.count-1), id: \.self) {
                            //Text("\($0)")
                            transaction_card(id: $0, t_names: t_names, t_nums: t_nums, t_descriptions: t_descriptions)
                        }
                    }.frame(width: geo.size.width / 1.5, height: geo.size.height / 2).position(x: geo.size.width / 2).opacity(view_toggle ? 1 : 0)
                    
                    
                    ScrollView {
                        ForEach((0...o_names.count-1), id: \.self) {
                            //Text("\($0)")
                            transaction_card(id: $0, t_names: o_names, t_nums: o_nums, t_descriptions: o_descriptions)
                        }
                    }.frame(width: geo.size.width / 1.5, height: geo.size.height / 2).position(x: geo.size.width / 2).opacity(view_toggle ? 0 : 1)
                }
                    
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var t_names = ["Jeff", "Greg", "Kate", "Andrew", "Lee", "Carl", "Madeline"]
    static var t_nums = ["- $10", "+ $20", "+ $32", "- $12", "- $24", "+ $34", "- $124"]
    static var t_descriptions = ["50 club mixer flyers", "New member lunch for Sammy", "Late fee for coming to club meeting late", "Pizza sales", "Payment plan for car #4 dues", "Cookie Sales", "Barn Dance ticket"]
    
    
    static var o_names = ["Darden", "Luke", "Matt", "Samitha", "Raymond", "Carl", "Madeline"]
    static var o_nums = ["+ $3", "- $60", "- $32", "- $12", "+ $24", "- $34", "+ $124"]
    static var o_descriptions = ["Bonding for club event", "2 axle components for car #2", "Seven screwdrivers for all teams", "20 arduinos", "CIF Room booking", "Photographer for photoshoot", "Misc"]
    static var previews: some View {
        HomeView(page_index: .constant(0), t_names: t_names, t_nums: t_nums, t_descriptions: t_descriptions, o_names: o_names, o_nums: o_nums, o_descriptions: o_descriptions)
    }
}
