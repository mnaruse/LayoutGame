//
//  Topic002CardView.swift
//  LayoutGame
//
//  Created by MiharuNaruse on 2022/07/23.
//

import Foundation
import SwiftUI

struct Topic002CardView: View {
    // MARK: Internal Stored Properties

    var vital: Vital

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Label(vital.title, systemImage: vital.iconSystemName)
                    .foregroundColor(vital.color)
                    .font(.headline)
                Spacer()
                Text(RelativeDateTimeFormatter().localizedString(for: vital.date, relativeTo: Date.now))
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer(minLength: 16)
            modifiedText(vital.value.text)
        }
        .padding(.vertical, 8)
    }

    // MARK: Private Functions

    /// 目立つ装飾にすべきか否かを判別し、テキストを装飾する。
    /// - Parameter text: 装飾対象の文字列
    /// - Returns: 装飾されたテキスト
    private func modifiedText(_ text: String) -> Text {
        text
            .map {
                if vital.value.shouldBeProminentDecoration($0) {
                    return Text(String($0))
                        .font(.system(.title, design: .rounded).weight(.medium))
                } else {
                    return Text(String($0))
                        .font(.callout.weight(.medium))
                        .foregroundColor(.secondary)
                }
            }
            .reduce(Text("")) { $0 + $1 }
    }
}

struct Topic002CardView_Previews: PreviewProvider {
    static var previews: some View {
        Topic002CardView(vital: Vital.sampleData[0])
            .previewLayout(.sizeThatFits)
    }
}
