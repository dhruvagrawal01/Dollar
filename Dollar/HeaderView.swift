//
//  HeaderView.swift
//  Dollar
//
//  Created by Pranav Burugula on 11/11/22.
//

import SwiftUI

struct HeaderView: View {
    let orgName: String
    let pageName: String?
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text(orgName)
                    .font(.system(size: 52))
                    .fontWeight(.bold)
                if pageName != nil {
                    Text(pageName ?? "")
                        .font(.system(size: 36))
                }
            }
            .padding(.top, geometry.size.height * 0.02)
            .padding(.leading, geometry.size.width * 0.07)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(orgName: "SPYDR", pageName: nil)
    }
}
