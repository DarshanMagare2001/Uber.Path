//
//  AddNewCardVC.swift
//  UberPath
//
//  Created by IPS-161 on 10/07/23.
//

import UIKit
protocol reloadTable{
    func reloadTable (reload : Bool)
}


class AddNewCardVC: UIViewController {
    @IBOutlet weak var tableOutlet: UITableView!
    var cardsArray = ["CardStyleOne", "CardStyleThree", "CardStyleTwo"]
    var showCardsArray : [String] = []
    var delegate : reloadTable?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateShowCardsArray()
        
    }
    
    func updateShowCardsArray() {
        let cardArray = UserDefaults.standard.stringArray(forKey: "CardArray") ?? []
        for card in cardsArray {
            if !cardArray.contains(card) {
                showCardsArray.append(card)
            }
        }
        
        print(showCardsArray)
    }
    
    
}

extension AddNewCardVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        showCardsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addNewCardCellTableViewCell", for: indexPath) as! AddNewCardCellTableViewCell
        cell.cardImageView.image = UIImage(named: showCardsArray[indexPath.row] )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCardStyle = showCardsArray[indexPath.row]
        // Retrieve the existing card array from UserDefaults or create a new empty array
        var cardArray = UserDefaults.standard.stringArray(forKey: "CardArray") ?? []
        // Append the selected card style to the card array
        cardArray.append(selectedCardStyle)
        // Store the updated card array back in UserDefaults
        UserDefaults.standard.set(cardArray, forKey: "CardArray")
        // Dismiss the AddNewCardVC
        delegate?.reloadTable(reload: true)
        dismiss(animated: true, completion: nil)
    }
    
}
