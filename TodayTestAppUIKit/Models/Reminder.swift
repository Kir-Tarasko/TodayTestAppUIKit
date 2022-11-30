//
//  Reminder.swift
//  TodayTestAppUIKit
//
//  Created by Kirill Tarasko on 22.11.2022.
//

import Foundation

struct Reminder {
    var title: String
    var dueDate: Date
    var notes: String? = nil
    var isComplete: Bool = false
}

#if DEBUG
extension Reminder {
    static var sampleData = [
        Reminder(title: "Английский язык", dueDate: Date().addingTimeInterval(2000), notes: "Изучение английского языка по приложению Duolingo"),
        Reminder(title: "Программирование", dueDate: Date().addingTimeInterval(10000), notes: "Изучение языка Swift"),
        Reminder(title: "Португальский язык", dueDate: Date().addingTimeInterval(20000), notes: "Изучение португальского языка по приложению Duolingo")
    ]
}
#endif
