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
    @State var from_whom = ""
    @State var how_much = ""
    @State var for_what = ""
    @State var description = ""
    
    
    //Dummy variables
    @Binding var t_names : [String]
    @Binding var t_names_from : [String]
    @Binding var t_nums : [String]
    @Binding var t_descriptions : [String]
    
    
    @Binding var o_names : [String]
    @Binding var o_names_from : [String]
    @Binding var o_nums : [String]
    @Binding var o_descriptions : [String]
    
    @Binding var u_names : [String]
    @Binding var u_names_from : [String]
    @Binding var u_nums : [String]
    @Binding var u_descriptions: [String]
    
    @State var me_paying = false
    
    @State var input: String = ""
    
    var body: some View {
            
        GeometryReader { geo in
            // Recepient
                VStack {
                    ZStack {
                        Group {
                            QuestionTemplate(text_input: $to_whom, starting_sting: "Who is being payed?").opacity(me_paying ? 0 : 1).position(x:geo.size.width / 2, y:geo.size.height / 2)
                            Text("Continue placing reimbursemnt request!").opacity(me_paying ? 1 : 0).position(x:geo.size.width / 2, y:geo.size.height / 2)
                        }.opacity(local_page_index == 0 ? 1 : 0)
                        
                        ZStack {
                            Group {
                                VStack {
                                    ZStack {
                                        Button {
                                            me_paying = true
                                        } label: {
                                            Text("I am being paying")
                                        }.opacity(me_paying ? 0 : 1).foregroundColor(.black).background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray.opacity(0.5)).frame(width: 200, height: 30).opacity(me_paying ? 0 : 1))
                                        Button {
                                            me_paying = false
                                        } label: {
                                            Text("Someone else is being payed")
                                        }.opacity(me_paying ? 1 : 0).foregroundColor(.black).background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray.opacity(0.5)).frame(minWidth: 200, minHeight: 30).opacity(me_paying ? 1 : 0))
                                    }
                                }
                            }.position(x:geo.size.width / 2,y:geo.size.height / 4)
                        }.opacity(local_page_index == 0 ? 1 : 0)
                        
                        // Sender
                        QuestionTemplate(text_input: $from_whom, starting_sting: "Who is paying?").opacity(local_page_index == 1 ? 1 : 0).position(x:geo.size.width / 2, y:geo.size.height / 2)
                        // Quantitiy
                        QuestionTemplate(text_input: $how_much, starting_sting: "How much?").opacity(local_page_index == 2 ? 1 : 0).position(x:geo.size.width / 2, y:geo.size.height / 2)
                        // Description
                        QuestionTemplate(text_input: $for_what, starting_sting: "What is being paid for?").opacity(local_page_index == 3 ? 1 : 0).position(x:geo.size.width / 2, y:geo.size.height / 2)
                    }
                    
                    HStack {
                        Button {
                            if local_page_index != 0 {
                                local_page_index -= 1
                            }
                        } label : {
                            Text("Back")
                        }.buttonStyle(.bordered)
                        
                        Button {
                            if (local_page_index == 3) {
                                
                                if me_paying == true {
                                    print("me_paying")
                                    u_names.append("me")
                                    u_names_from.append(from_whom)
                                    u_nums.append("$" + how_much)
                                    u_descriptions.append(for_what)
                                } else {
                                    //submit
                                    t_names.append(to_whom)
                                    t_names_from.append(from_whom)
                                    t_nums.append("$" + how_much)
                                    t_descriptions.append(for_what)
                                }
                                
                                to_whom = ""
                                how_much = ""
                                for_what = ""
                                from_whom = ""
                                
                                local_page_index = 0
                                page_index = 0
                            } else {
                                local_page_index += 1
                            }
                        } label: {
                            Text("Next")
                        }
                        .buttonStyle(.bordered)
                    }
                }
            }
    }
}
//
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
//        RequestView(page_index: .constant(1), t_names: t_names, t_nums: t_nums, t_descriptions: t_descriptions, o_names: o_names, o_nums: o_nums, o_descriptions: o_descriptions)
//    }
//}
//
