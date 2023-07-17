//
//  TableViewModel.swift
//  UberPath
//
//  Created by IPS-161 on 17/07/23.
//

import Foundation
import UIKit

struct TableViewModel {
    var img : String
    var lbl1 :String
    var lbl2 :String
    var lbl3 :String
}

class TableViewModelClass {
    
    var TableViewModelClassArray = [TableViewModel(img: "Amazon", lbl1: "Amazon", lbl2: "Payment", lbl3: "- $59.00"),TableViewModel(img: "Gym", lbl1: "Gym", lbl2: "Payment", lbl3: "- $45.99"),TableViewModel(img: "Deposit", lbl1: "Bank of America", lbl2: "Deposit", lbl3: "+ $1,328.00"),TableViewModel(img: "Bitcoin", lbl1: "Bitcoin", lbl2: "Deposit", lbl3: "- $2,550.99"),TableViewModel(img: "Paypal", lbl1: "Paypal", lbl2: "Freelance", lbl3: "+ $2,328.00"),TableViewModel(img: "Spotify premium", lbl1: "Spotify premium", lbl2: "Payment", lbl3: "- $24.00")]
}
