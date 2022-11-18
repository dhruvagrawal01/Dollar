//
//  RequestView.swift
//  Dollar
//
//  Created by Sidd Adatrao on 11/15/22.
//

import SwiftUI

struct RequestView: View {
    @Binding var page_index: Int
    @State var local_page_index = 0
    @State var to_whom = ""
    @State var how_much = ""
    @State var for_what = ""
    @State var description = ""
    
    
    //Dummy variables
    @Binding var t_names : [String]
    @Binding var t_nums : [String]
    @Binding var t_descriptions : [String]
    
    
    @Binding var o_names : [String]
    @Binding var o_nums : [String]
    @Binding var o_descriptions : [String]
    
    var body: some View {
            
        GeometryReader { geo in
            
            
            // To Whom
            QuestionTemplate(text_input: $to_whom, starting_sting: "Who do you want to pay?").opacity(local_page_index == 0 ? 1 : 0)
            
            // How Much
            QuestionTemplate(text_input: $how_much, starting_sting: "How much?").opacity(local_page_index == 1 ? 1 : 0)
    
            QuestionTemplate(text_input: $for_what, starting_sting: "What is being paid for?").opacity(local_page_index == 2 ? 1 : 0)
            

        
            Button {
                if (local_page_index == 2) {
                    //submit
                    t_names.append(to_whom)
                    t_nums.append("- $" + how_much)
                    t_descriptions.append(for_what)
                    
                    to_whom = ""
                    how_much = ""
                    for_what = ""
                    
                    local_page_index = 0
                    page_index = 0
                } else {
                    local_page_index += 1
                }
            } label: {
                Text("Next")
            }
            .buttonStyle(.bordered)
            .position(x:geo.size.width / 2, y: geo.size.height - 20)
        }
    }
}

//struct RequestView_Previews: PreviewProvider {
//    static var t_names = ["Jeff", "Greg", "Kate", "Andrew", "Lee", "Carl", "Madeline", "Sam"]
//    static var t_nums = ["- $10", "+ $20", "+ $32", "- $12", "- $24", "+ $34", "- $124", "+ $1"]
//    static var t_descriptions = ["50 club mixer flyers", "New member lunch for Sammy", "Late fee for coming to club meeting late", "Pizza sales", "Payment plan for car #4 dues", "Cookie Sales", "Barn Dance ticket"]
//
//
//    static var o_names = ["Darden", "Luke", "Matt", "Samitha", "Raymond", "Carl", "Madeline", "Sam"]
//    static var o_nums = ["+ $3", "- $60", "- $32", "- $12", "+ $24", "- $34", "+ $124", "- $1"]
//    static var o_descriptions = ["Bonding for club event", "2 axle components for car #2", "Seven screwdrivers for all teams", "20 arduinos", "CIF Room booking", "Photographer for photoshoot"]
//    static var previews: some View {
//        RequestView(page_index: .constant(1), t_names: $t_names, t_nums: $t_nums, t_descriptions: $t_descriptions, o_names: $o_names, o_nums: $o_nums, o_descriptions: $o_descriptions)
//    }
//}

