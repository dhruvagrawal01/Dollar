//
//  NavbarView.swift
//  Dollar
//
//  Created by Rohan Vasavada on 11/16/22.
//

import SwiftUI

struct NavbarView: View {
	@Binding var page_index: Int
	
	var body: some View {
		HStack {
			Button(action: {
				page_index = 0
			}) {
				Image(systemName: "list.dash")
			}
			
			Button(action: {
				page_index = 1
			}) {
				Image(systemName: "chart.bar")
			}
			
			Button(action: {
				page_index = 2
			}) {
				Image(systemName: "person.3")
			}
			
			Spacer()
	
			Button(action: {
				page_index = 4
			}) {
				Image(systemName: "plus.circle")
				
			}
			
			Button(action: {
				page_index = 5
			}) {
				Text("Reimbursement")
			}
		}.padding()
	}
}

struct NavbarView_Previews: PreviewProvider {
	static var previews: some View {
		NavbarView(page_index: .constant(0))
	}
}
