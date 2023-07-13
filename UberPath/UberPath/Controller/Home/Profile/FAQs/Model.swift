//
//  Model.swift
//  UberPath
//
//  Created by IPS-161 on 13/07/23.
//

import Foundation
import UIKit

struct cellModelForFAQsVCCell{
    var question : String
    var ans : String
}

class cellModelDataForFAQsVCCell {
    var cellDataArray = [cellModelForFAQsVCCell(question: "How do I create a Smartpay account?", ans: "You can create a Smartpay account by: download and open the smartpay application first then select."),cellModelForFAQsVCCell(question: "How to create a card for Smartpay?", ans: "You can select the create card menu then select Add New Card select the continue button then you."),cellModelForFAQsVCCell(question: "How to Top Up on Smartpay?", ans: "Click the Top Up menu then select the amount of money and the method then click the top up now button.")]
}
