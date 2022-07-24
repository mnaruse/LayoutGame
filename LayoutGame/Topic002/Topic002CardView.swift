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

    var dateComponentsFormatter: DateComponentsFormatter {
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
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            switch vital.value {
            case let .number(value: value, style: style, customUnit: customUnit):

                let formatter = numberFormatter(style: style)
                // TODO: フォントサイズ
                Text("\(formatter.string(from: value as NSNumber) ?? "")\(customUnit ?? "")")
                    .font(.title)

            case let .dateComponents(dateComponents):
                // TODO: フォントサイズ
                Text(dateComponentsFormatter.string(from: dateComponents) ?? "")
                    .font(.title)

            case let .measurement(value: value, unit: unit, formattedUnit: formattedUnit):
                // TODO: フォントサイズ
                Text("\(String(format: "%.1f", value))\(unit.symbol)")
                    .font(.title)
            }
        }
        .padding([.top, .bottom])
    }

    func numberFormatter(style: NumberFormatter.Style) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = style
        formatter.locale = .current
        return formatter
    }
}

struct Topic002CardView_Previews: PreviewProvider {
    static var previews: some View {
        Topic002CardView(vital: Vital.sampleData[0])
            .previewLayout(.sizeThatFits)
    }
}
