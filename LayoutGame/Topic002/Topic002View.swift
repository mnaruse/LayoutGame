//
//  Topic002View.swift
//  LayoutGame
//
//  Created by MiharuNaruse on 2022/07/23.
//

import SwiftUI

struct Topic002View: View {
    // MARK: Private Stored Properties

    @State private var vitals: [Vital] = Vital.sampleData

    // MARK: Body

    var body: some View {
        List {
            ForEach($vitals) { $vital in
                NavigationLink(destination: Topic002DetailView(vital: $vital)) {
                    Topic002CardView(vital: vital)
                }
            }
        }
        .navigationTitle("バイタルデータ")
    }
}

struct Topic002View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Topic002View()
        }
    }
}
