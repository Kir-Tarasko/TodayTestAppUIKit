//
//  TodayError.swift
//  TodayTestAppUIKit
//
//  Created by Kirill Tarasko on 07.02.2023.
//

import Foundation

enum TodayError: LocalizedError {
    
    case failedReadingReminders
    
    var errorDescription: String? {
        switch self {
        case .failedReadingReminders:
            return NSLocalizedString("Failed to read reminders.", comment: "failed reading reminders error description")
        }
    }
}
