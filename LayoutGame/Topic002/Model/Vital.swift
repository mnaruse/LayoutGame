//
//  Vital.swift
//  LayoutGame
//
//  Created by MiharuNaruse on 2022/07/23.
//

import SwiftUI

// MARK: - Vital

struct Vital: Identifiable {
    let id = UUID()
    let title: LocalizedStringKey
    let value: Value
    let date: Date
    let iconSystemName: String
    let color: Color
}

// MARK: - Extension Vital

extension Vital {
    // MARK: Enums

    enum Value {
        case number(value: Double, style: NumberFormatter.Style, customUnit: String? = nil)
        case dateComponents(_ dateComponents: DateComponents)
        case measurement(value: Double, unit: Dimension, formattedUnit: Dimension? = nil)

        // MARK: Private Computed Properties

        private var dateComponentsFormatter: DateComponentsFormatter {
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .full
            formatter.allowedUnits = [.day, .hour, .minute]
            return formatter
        }

        // MARK: Internal Computed Properties

        /// 値のデータを整理し、単位付きの文字列に変換した文字列。
        var text: String {
            switch self {
            case let .number(value, style, customUnit):
                let formatter = numberFormatter(style: style)
                return "\(formatter.string(from: value as NSNumber) ?? "")\(customUnit ?? "")"
            case let .dateComponents(dateComponents):
                return dateComponentsFormatter.string(from: dateComponents) ?? ""
            case let .measurement(value, unit, formattedUnit):
                return "\(String(format: "%.1f", value))\(formattedUnit?.symbol ?? unit.symbol)"
            }
        }

        // MARK: Internal Functions

        /// 文字を目立つ装飾にすべきか否か。
        /// - Parameter character: 一文字
        /// - Returns: `true` : 目立つ装飾にすべき。 `false` : 目立つ装飾にすべきでない。
        func shouldBeProminentDecoration(_ character: String.Element) -> Bool {
            character.isNumber || ["."].contains(character)
        }

        // MARK: Private Functions

        private func numberFormatter(style: NumberFormatter.Style) -> NumberFormatter {
            let formatter = NumberFormatter()
            formatter.numberStyle = style
            formatter.locale = .current
            return formatter
        }
    }
}

// MARK: - Extension Sample Data

extension Vital {
    static let sampleData: [Vital] = [
        .init(title: "取り込まれた酸素のレベル", value: .number(value: 0.99, style: .percent), date: Date(timeIntervalSinceNow: -300), iconSystemName: "o.circle.fill", color: .blue),
        .init(title: "心拍数", value: .number(value: 61, style: .decimal, customUnit: "拍/分"), date: Date(timeIntervalSinceNow: -5400), iconSystemName: "heart.fill", color: .red),
        .init(title: "睡眠", value: .dateComponents(.init(minute: 451)), date: Date(timeIntervalSinceNow: -87000), iconSystemName: "bed.double.fill", color: .green),
        .init(title: "体温", value: .measurement(value: 36.4, unit: UnitTemperature.celsius), date: Date(timeIntervalSinceNow: -172800), iconSystemName: "thermometer", color: .red),
    ]
}
