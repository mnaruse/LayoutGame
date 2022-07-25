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

    private var dateComponentsFormatter: DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.day, .hour, .minute]
        return formatter
    }

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
            switch vital.value {
            case let .number(value: value, style: style, customUnit: customUnit):
                let formatter = numberFormatter(style: style)
                modifiedText("\(formatter.string(from: value as NSNumber) ?? "")\(customUnit ?? "")")

            case let .dateComponents(dateComponents):
                modifiedText(dateComponentsFormatter.string(from: dateComponents) ?? "")

            case let .measurement(value: value, unit: unit, formattedUnit: formattedUnit):
                modifiedText("\(String(format: "%.1f", value))\(formattedUnit?.symbol ?? unit.symbol)")
            }
        }
        .padding(.vertical, 8)
    }

    // MARK: Private Functions

    private func numberFormatter(style: NumberFormatter.Style) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = style
        formatter.locale = .current
        return formatter
    }

    /// 数値か否かによって、テキストを装飾する。
    /// - Parameter text: 装飾対象の文字列
    /// - Returns: 装飾されたテキスト
    private func modifiedText(_ text: String) -> Text {
        text
            .map {
                if $0.isNumber || ["."].contains($0) {
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
