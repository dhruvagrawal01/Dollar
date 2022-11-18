//
//  OrgnizationOverview.swift
//  Dollar
//
//  Created by Kino on 11/17/22.
//

import SwiftUI

struct OrgnizationOverview: View {
    @Binding var page_index: Int
    @State var view_toggle = true //me = True, org = False
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("Spyder")
                    .font(.system(size: 52))
                    .fontWeight(.bold)
                ZStack {
                    HStack {
                        Text("Orgnization Info Review")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                    }.position(x: geo.size.width/2, y: geo.size.height/6)
                }
                ZStack {
                    ScrollView {
                        RoundedRectangle(cornerRadius: 25).fill(.white)
                            .overlay(
                                VStack {
                                    Text("Orgnization Name").fontWeight(.bold)
                                    Text("Dollar")
                                }
                            )
                            .frame(width: 300, height: CGFloat(150))
                        RoundedRectangle(cornerRadius: 25).fill(.white)
                            .overlay(
                                VStack {
                                    Text("Orgnization Description").fontWeight(.bold)
                                    Text("Hi we are SPYDR")
                                }
                            )
                            .frame(width: 300, height: CGFloat(150))
                        RoundedRectangle(cornerRadius: 25).fill(.white)
                            .overlay(
                                VStack {
                                    Text("Orgnization Members").fontWeight(.bold)
                                    Text("Sidd")
                                    Text("Pranav")
                                    Text("Yuxin")
                                    Text("Dhruv")
                                    Text("Rohan")
                                }
                            )
                            .frame(width: 300, height: CGFloat(150))
                    }.frame(width: geo.size.width / 1.5, height: geo.size.height / 2).position(x: geo.size.width / 2).opacity(view_toggle ? 1 : 0)

                }
            }
        }
    }
}

struct OrgnizationOverview_Previews: PreviewProvider {
        static var previews: some View {
            OrgnizationOverview(page_index: .constant(0))
        }
}
