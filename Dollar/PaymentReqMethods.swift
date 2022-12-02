//
//  PaymentReqMethods.swift
//  Dollar
//
//  Created by Dhruv Agrawal on 11/17/22.
//
import SwiftUI

struct RadioButton: View {
    @Binding var isSelected: Bool
    @State var color: Color
    @State var text: String
    
    var body: some View {
        ZStack {
            Capsule()
                .frame( height: 50)
                .foregroundColor(isSelected ? color : .gray)
            Text(text)
                .foregroundColor(.white)
        }
    }
}

struct PaymentReqMethod: View {
    @Binding var page_index: Int
    
    @Binding var transaction_id: Int
    @Binding var t_names : [String]
    @Binding var t_names_from : [String]
    @Binding var t_nums : [String]
    @Binding var t_descriptions : [String]
    
    @Binding var u_names : [String]
    @Binding var u_names_from : [String]
    @Binding var u_nums : [String]
    @Binding var u_descriptions : [String]
    
    @State private var method: String = ""
    @State private var note: String = ""
    @State private var amount: String = ""
    @State private var description: String = ""
    
    @State private var paypal = false
    @State private var venmo = false
    @State private var zelle = false
    
    var body: some View {
        Form {
            VStack(
                alignment: .leading,
                spacing: 10
            ) {
                Text("Pay Using:").font(.title2)
                
                Spacer()
                RadioButton(isSelected: $paypal, color: .blue, text: "PayPal").onTapGesture {
                    paypal.toggle()
                    if paypal {
                        venmo = false
                        zelle = false
                    }
                }
                RadioButton(isSelected: $venmo, color: .blue, text: "Venmo").onTapGesture {
                    venmo.toggle()
                    if venmo {
                        paypal = false
                        zelle = false
                    }
                }
                RadioButton(isSelected: $zelle, color: .blue, text: "Zelle").onTapGesture {
                    zelle.toggle()
                    if zelle {
                        paypal = false
                        venmo = false
                    }
                }
                
//                Button("PayPal") {
//                    method = "PayPal"
//                }
//
//                Button("Venmo") {
//                    method = "Venmo"
//                }
//
//                Button("Zelle") {
//                    method = "Zelle"
//                }
                
                Spacer()
                
                HStack() {
                    Text("Note:")
                    TextField("", text: $note, prompt: Text("Any comments?"), axis: .vertical).lineLimit(5...10)
                }
                
                Spacer()
                
                Button("Submit") {
                    t_names.append(u_names[transaction_id])
                    t_names_from.append(u_names_from[transaction_id])
                    t_nums.append(u_nums[transaction_id])
                    t_descriptions.append(u_descriptions[transaction_id])
                    
                    u_names.remove(at: transaction_id)
                    u_names_from.remove(at: transaction_id)
                    u_nums.remove(at: transaction_id)
                    u_descriptions.remove(at: transaction_id)
                    
                    page_index = 0
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }.textFieldStyle(.roundedBorder)
    }
}

//struct PaymentReqMethod_Previews: PreviewProvider {
//    static var previews: some View {
//        PaymentReqMethod(page_index: .constant(1))
//    }
//}
