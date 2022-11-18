//
//  OrgView.swift
//  Dollar
//
//  Created by Kino on 11/17/22.
//

import SwiftUI

struct OrgView: View {
    @Binding var page_index: Int
    @State var local_page_index = 0
    @State var org_name = ""
    @State var org_description = ""
    @State var org_members = ""

    var body: some View {
        GeometryReader { geo in

            QuestionTemplate(text_input: $org_name, starting_sting: "What is your orgnization name?").opacity(local_page_index == 0 ? 1 : 0)
            
            QuestionTemplate(text_input: $org_description, starting_sting: "What is your orgnization for?").opacity(local_page_index == 1 ? 1 : 0)
    
            QuestionTemplate(text_input: $org_members, starting_sting: "Who are the members?").opacity(local_page_index == 2 ? 1 : 0)

        
            Button {
                if (local_page_index == 2) {
                    //submit
                    
                    org_name = ""
                    org_description = ""
                    org_members = ""
                    
                    local_page_index = 0
                    page_index = 4
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
