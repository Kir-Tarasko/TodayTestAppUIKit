//
//  ReminderStore.swift
//  TodayTestAppUIKit
//
//  Created by Kirill Tarasko on 09.02.2023.
//

import EventKit
import Foundation

final class ReminderStore {
    static let shared = ReminderStore()
    
    private let ekStore = EKEventStore()
    
    var isAvailable: Bool {
        EKEventStore.authorizationStatus(for: .reminder) == .authorized
    }
    
    func requestAccess() async throws {
            let status = EKEventStore.authorizationStatus(for: .reminder)
            switch status {
            case .authorized:
                return
            case .restricted:
                throw TodayError.accessRestricted
            case .notDetermined:
                let accessGranted = try await ekStore.requestAccess(to: .reminder)
                guard accessGranted else {
                    throw TodayError.accessDenied
                }
            case .denied:
                throw TodayError.accessDenied
            @unknown default:
                throw TodayError.unknown
            }
        }
    
    func readAll() async throws -> [Reminder] {
        guard isAvailable else {
            throw TodayError.accessDenied
        }
        
        let predicate = ekStore.predicateForReminders(in: nil)
        let ekReminders = try await ekStore.reminders(matching: predicate)
        let reminders: [Reminder] = try ekReminders.compactMap { ekReminder in
            do {
                return try Reminder(with: ekReminder)
            } catch TodayError.reminderHasNoDueDate {
                return nil
            }
        }
        return reminders
    }
}
