//
//  ContentView.swift
//  Dollar
//
//  Created by Pranav Burugula on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var page_index = 0
    
    var body: some View {
        switch page_index {
        case 0:
            HomeView(page_index: $page_index)
        case 1:
            RequestView(page_index: $page_index)
        default:
            HomeView(page_index: $page_index)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
