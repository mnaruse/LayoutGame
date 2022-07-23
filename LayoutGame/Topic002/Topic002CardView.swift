//
//  Topic002CardView.swift
//  LayoutGame
//
//  Created by MiharuNaruse on 2022/07/23.
//

import SwiftUI

struct Topic002CardView: View {
    // MARK: Internal Stored Properties

    var vital: Vital

    // MARK: Body

    var body: some View {
        Text("Hello, world!")
    }
}

struct Topic002CardView_Previews: PreviewProvider {
    static var previews: some View {
        Topic002CardView(vital: Vital.sampleData[0])
    }
}
