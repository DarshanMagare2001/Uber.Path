//
//  NotificationVCModel.swift
//  UberPath
//
//  Created by IPS-161 on 14/07/23.
//

import Foundation
import UIKit

struct NotificationVCModel {
    var image : String
    var lbl1 : String
    var lbl2 : String
    var time : String
}

class NotificationVCModelClass {
    var NotificationVCModelClassArray = [NotificationVCModel(image: "Rewards", lbl1: "Rewards", lbl2: "Loyal user rewards!😘", time: "5m ago"),NotificationVCModel(image: "Withdraw", lbl1: "Money Transfer", lbl2: "You have successfully sent money to Maria of.", time: "25m ago"),NotificationVCModel(image: "Payment Notification", lbl1: "Payment Notification", lbl2: "Successfully paid!🤑", time: "Mar 20"),NotificationVCModel(image: "Deposit", lbl1: "Top Up", lbl2: "Your top up is successfully!", time: "Mar 13"),NotificationVCModel(image: "Withdraw", lbl1: "Money Transfer", lbl2: "You have successfully sent money to Maria of.", time: "Mar 09"),NotificationVCModel(image: "Cashback 25%", lbl1: "Cashback 25%", lbl2: "You have successfully sent money to Maria of.", time: "Mar 20"),NotificationVCModel(image: "Payment Notification Orange", lbl1: "Payment Notification", lbl2: "Successfully paid!🤑", time: "Mar 13")]
}
