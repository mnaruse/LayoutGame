//
//  Topic002DetailView.swift
//  LayoutGame
//
//  Created by MiharuNaruse on 2022/07/23.
//

import SwiftUI

struct Topic002DetailView: View {
    // MARK: Internal Stored Properties

    @Binding var vital: Vital

    // MARK: Body

    var body: some View {
        Text("Hello, world!")
    }
}

struct Topic002DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Topic002DetailView(vital: .constant(Vital.sampleData[0]))
        }
    }
}
