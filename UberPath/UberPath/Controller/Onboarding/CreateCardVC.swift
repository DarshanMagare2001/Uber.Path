//
//  CreateCardVC.swift
//  UberPath
//
//  Created by IPS-161 on 29/06/23.
//

import UIKit

class CreateCardVC: UIViewController , UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var createLbl: UILabel!
    @IBOutlet weak var theCustomizeLbl: UILabel!
    @IBOutlet weak var chooseLbl: UILabel!
    @IBOutlet weak var cardTableViewOutlet: UITableView!
    @IBOutlet weak var cardViewOne: UIView!
    @IBOutlet weak var cardViewTwo: UIView!
    var cards :[String] = ["CardStyleOne","CardStyleTwo","CardStyleThree"]
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        cardTableViewOutlet.delegate = self
        cardTableViewOutlet.dataSource = self
        cardViewOne.isHidden = false
        cardViewTwo.isHidden = true
        
    }
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        UIView.transition(with: view, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews], animations: {
            self.cardViewOne.isHidden = true
            self.cardViewTwo.isHidden = false
        }, completion: nil)
    }
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateFont() {
        createLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 21.0))
        theCustomizeLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 13.0))
        chooseLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 23.0))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cardTableViewOutlet.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardCell
        cell.cardImageView.image = UIImage(named: cards[indexPath.row])
        
        return cell
    }
    
}
