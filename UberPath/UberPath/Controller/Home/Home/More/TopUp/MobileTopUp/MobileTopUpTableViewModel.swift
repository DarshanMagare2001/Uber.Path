//
//  MobileTopUpTableViewModel.swift
//  UberPath
//
//  Created by IPS-161 on 20/07/23.
//

import Foundation
import UIKit

struct MobileTopUpTableViewModel{
    var img : String
    var lbl1 : String
    var lbl2 : String
}

class MobileTopUpTableViewModelClass{
    var modelArray = [MobileTopUpTableViewModel(img: "Bank of America", lbl1: "Bank of America", lbl2: "**** **** **** 1121"),MobileTopUpTableViewModel(img: "Bank of Canada", lbl1: "Bank of Canada", lbl2: "**** **** **** 1564"),MobileTopUpTableViewModel(img: "PaypalDark", lbl1: "Paypal", lbl2: "Easy payment"),MobileTopUpTableViewModel(img: "PayFast", lbl1: "PayFast", lbl2: "Easy payment"),MobileTopUpTableViewModel(img: "Western Union", lbl1: "Western Union", lbl2: "Easy payment")]
}
