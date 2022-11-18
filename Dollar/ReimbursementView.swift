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
	
	var body: some View {
		Form {
			VStack(
				alignment: .leading,
				spacing: 10
			) {
				Text("Reimbursement Request").font(.title2)
				
				Spacer()
				
				HStack() {
					Text("Title")
					TextField("", text: $title, prompt: Text("Request Title"))
				}
				
				Spacer()
				
				HStack() {
					Text("Amount")
					TextField("", text: $title, prompt: Text("Request Amount"))
				}
				
				Spacer()
				
				HStack() {
					Text("Description")
					TextField("", text: $title, prompt: Text("Request Description"), axis: .vertical).lineLimit(5...10)
				}
				
				Spacer()

				Button("Submit") {
					page_index = 0
				}
			}.frame(maxWidth: .infinity, alignment: .leading)
				.padding()
		}.textFieldStyle(.roundedBorder)
	}
	
}

struct ReimbursementView_Previews: PreviewProvider {
	static var previews: some View {
		ReimbursementView(page_index: .constant(1))
	}
}
