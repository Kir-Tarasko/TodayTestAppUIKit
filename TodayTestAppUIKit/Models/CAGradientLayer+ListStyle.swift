//
//  CAGradientLayer+ListStyle.swift
//  TodayTestAppUIKit
//
//  Created by Kirill Tarasko on 07.02.2023.
//

import UIKit

extension CAGradientLayer {
    static func gradientLayer(for style: ReminderListStyle, in frame: CGRect) -> Self {
        let layer = Self()
        layer.colors = colors(for: style)
        layer.frame = frame
        return layer
    }
    private static func colors(for style: ReminderListStyle) -> [CGColor] {
        let begibColor: UIColor
        let endColor: UIColor
        
        switch style {
        case .all:
            begibColor = .todayGradientAllBegin
            endColor = .todayGradientAllEnd
        case .future:
            begibColor = .todayGradientFutureBegin
            endColor = .todayGradientFutureEnd
        case .today:
            begibColor = .todayGradientTodayBegin
            endColor = .todayGradientTodayEnd
        }
        return [begibColor.cgColor, endColor.cgColor]
    }
}
