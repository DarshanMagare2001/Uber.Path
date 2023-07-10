//
//  MyCardVC.swift
//  UberPath
//
//  Created by IPS-161 on 03/07/23.
//

import UIKit

class MyCardVC: UIViewController, reloadTable {
    @IBOutlet weak var tableViewOutlet: UITableView!
    var cardArray : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        cardArray = retrieveCardArrayFromUserDefaults()
        
    }
    
    @IBAction func addNewCardBtnPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "AddNewCardVC") as! AddNewCardVC
        destinationVC.delegate = self
        present(destinationVC, animated: true, completion: nil)
        
    }
    
    func retrieveCardArrayFromUserDefaults() -> [String] {
        if let cardArray = UserDefaults.standard.stringArray(forKey: "CardArray") {
            return cardArray
        } else {
            return []
        }
    }
    
    func reloadTable(reload: Bool) {
        cardArray = retrieveCardArrayFromUserDefaults()
        tableViewOutlet.reloadData()
    }
}

extension MyCardVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCardCell", for: indexPath) as! MyCardCell
        cell.cardImageView.image = UIImage(named: cardArray[indexPath.row])
        return cell
    }
    
    
}
