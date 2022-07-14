//
//  HomeView.swift
//  LayoutGame
//
//  Created by MiharuNaruse on 2022/07/13.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        List {
            NavigationLink(destination: Try001View()) {
                Text("001")
            }
        }
        .navigationTitle("レイアウト一本勝負")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
