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
    
    var body: some View {
            
        GeometryReader { geo in
            
            
            // To Whom
            QuestionTemplate(text_input: $to_whom, starting_sting: "Who do you want to pay?").opacity(local_page_index == 0 ? 1 : 0)
            
            // How Much
            QuestionTemplate(text_input: $how_much, starting_sting: "How much?").opacity(local_page_index == 1 ? 1 : 0)
    
            QuestionTemplate(text_input: $for_what, starting_sting: "What is being paid for?").opacity(local_page_index == 2 ? 1 : 0)
            
            QuestionTemplate(text_input: $description, starting_sting: "Notes?").opacity(local_page_index == 3 ? 1 : 0)
        
            Button {
                if (local_page_index == 3) {
                    //submit
                    page_index = 0
                }
                local_page_index += 1
            } label: {
                Text("Next")
            }
            .buttonStyle(.bordered)
            .position(x:geo.size.width / 2, y: geo.size.height)
        }
    }
}

struct RequestView_Previews: PreviewProvider {

    static var previews: some View {
        RequestView(page_index: .constant(1))
    }
}

