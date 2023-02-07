//
//  EKEventStore+AsyncFetch.swift
//  TodayTestAppUIKit
//
//  Created by Kirill Tarasko on 07.02.2023.
//

import EventKit
import Foundation

extension EKEventStore {
    func reminders(matching predicate: NSPredicate) async throws -> [EKReminder] {
        try await withCheckedThrowingContinuation { continuation in
            fetchReminders(matching: predicate) { reminders in
                if let reminders {
                    continuation.resume(returning: reminders)
                } else {
                    continuation.resume(throwing: TodayError.failedReadingReminders)
                }
            }
        }
    }
}
