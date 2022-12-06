//
//  ReminderListViewController+Actions.swift
//  TodayTestAppUIKit
//
//  Created by Kirill Tarasko on 06.12.2022.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(with: id)
    }
}
