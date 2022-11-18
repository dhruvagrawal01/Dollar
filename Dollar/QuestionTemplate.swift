//
//  QuestionTemplate.swift
//  Dollar
//
//  Created by Sidd Adatrao on 11/15/22.
//
import SwiftUI

struct QuestionTemplate: View {
    @Binding var text_input: String
    @State var starting_sting : String

    var body: some View {
        GeometryReader { geometry in
            
            //Basic Textbox
            TextField(
                starting_sting,
                text: $text_input
            )
            .disableAutocorrection(true)
            .textFieldStyle(.roundedBorder)
            .frame(width: geometry.size.width / 1.5)
            .position(x:geometry.size.width / 2, y: geometry.size.height / 3)
        }
    
    }
}
