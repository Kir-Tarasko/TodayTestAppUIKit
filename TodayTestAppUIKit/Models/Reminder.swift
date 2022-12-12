//
//  Reminder.swift
//  TodayTestAppUIKit
//
//  Created by Kirill Tarasko on 22.11.2022.
//

import Foundation

struct Reminder : Identifiable{
    var id: String = UUID().uuidString
    var title: String
    var dueDate: Date
    var notes: String? = nil
    var isComplete: Bool = false
}

extension Array where Element == Reminder {
    func indexOfReminder(with id: Reminder.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}

#if DEBUG
extension Reminder {
    static var sampleData = [
        Reminder(title: "Английский язык", dueDate: Date().addingTimeInterval(2000), notes: "Изучение английского языка по приложению Duolingo", isComplete: true),
        Reminder(title: "Программирование", dueDate: Date().addingTimeInterval(10000), notes: "Изучение языка Swift"),
        Reminder(title: "Португальский язык", dueDate: Date().addingTimeInterval(20000), notes: "Изучение португальского языка по приложению Duolingo")
    ]
}
#endif
