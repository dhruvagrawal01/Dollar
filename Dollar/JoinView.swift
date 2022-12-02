//
//  JoinView.swift
//  Dollar
//
//  Created by Rohan Vasavada on 12/1/22.
//

import SwiftUI

struct JoinView: View {
	@Binding var page_index: Int
	
	@State var code = ""
	
	var body: some View {
			
		GeometryReader { geo in
			Text("Enter Code to Join Organization")
				.multilineTextAlignment(.center)
				.position(x:geo.size.width / 2, y: geo.size.height / 10)
				.font(.title2)
			
			QuestionTemplate(text_input: $code, starting_sting: "Enter organization join code")
			
			Button {
				page_index = 0
			} label: {
				Text("Enter")
			}
			.buttonStyle(.bordered)
			.position(x:geo.size.width / 2, y: 4 * geo.size.height / 10)
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

