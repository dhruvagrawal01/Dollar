//
//  PaymentReqMethod.swift
//  Dollar
//
//  Created by Dhruv Agrawal on 11/17/22.
//

import SwiftUI

struct PaymentReqMethod: View {
    @Binding var page_index: Int
    
    @State private var method: String = ""
    @State private var note: String = ""
    @State private var amount: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form {
            VStack(
                alignment: .leading,
                spacing: 10
            ) {
                Text("Pay Using:").font(.title2)
                
                Spacer()
                
                Button("PayPal") {
                    method = "PayPal"
                }
                
                Button("Venmo") {
                    method = "Venmo"
                }
                
                Button("Zelle") {
                    method = "Zelle"
                }
                
                Spacer()
                
                HStack() {
                    Text("Note:")
                    TextField("", text: $note, prompt: Text("Any comments?"), axis: .vertical).lineLimit(5...10)
                }
                
                Spacer()
                
                Button("Mark as Completed") {
                    page_index = 0
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }.textFieldStyle(.roundedBorder)
    }
}

struct PaymentReqMethod_Previews: PreviewProvider {
    static var previews: some View {
        PaymentReqMethod(page_index: .constant(1))
    }
}
