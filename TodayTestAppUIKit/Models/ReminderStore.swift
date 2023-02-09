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
}
