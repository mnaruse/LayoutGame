//
//  Try001View.swift
//  LayoutGame
//
//  Created by MiharuNaruse on 2022/07/13.
//

// `layoutPriority(_:)`
// https://developer.apple.com/documentation/swiftui/path/layoutpriority(_:)

import SwiftUI

struct Try001View: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hello, world!")
                    .layoutPriority(1)
                Spacer()
                Text("Hello, world!")
            }
            Spacer()
            Text("Hello, world!")
            Spacer()
            HStack {
                Text("Hello, world!")
                Spacer()
                Text("Hello, world!")
                    .layoutPriority(1)
            }
        }
        .padding()
    }
}

struct Try001View_Previews: PreviewProvider {
    static var previews: some View {
        Try001View()
    }
}
