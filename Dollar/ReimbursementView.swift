//
//  ReimbursementView.swift
//  Dollar
//
//  Created by Rohan Vasavada on 11/15/22.
//

import SwiftUI

struct ReimbursementView: View {
	@Binding var page_index: Int
	
	@State private var title: String = ""
	@State private var amount: String = ""
	@State private var description: String = ""
	
	@Binding var t_names : [String]
	@Binding var t_nums : [String]
	@Binding var t_descriptions : [String]
	
	var body: some View {
		VStack(
			alignment: .leading,
			spacing: 10
		) { Form {
			Section(header: Text("Reimbursement Request")) {
				HStack() {
					Text("Title")
					TextField("", text: $title, prompt: Text("Request Title"))
				}
				
				HStack() {
					Text("Amount")
					TextField("", text: $amount, prompt: Text("Request Amount"))
				}
								
				HStack() {
					Text("Description")
					TextField("", text: $description, prompt: Text("Request Description"), axis: .vertical).lineLimit(5...10)
				}				
			}
			
			Button("Submit") {
				t_names.append("Org")
				t_nums.append("+$\(amount)")
				t_descriptions.append(description)
				
				page_index = 0
			}
			
		}
		.frame(alignment: .leading)
		.padding()
		.listRowSeparator(.hidden)
		}.textFieldStyle(.roundedBorder)
	}
	
}

