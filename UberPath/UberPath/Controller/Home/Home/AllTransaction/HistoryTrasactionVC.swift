//
//  HistoryTrasactionVC.swift
//  UberPath
//
//  Created by IPS-161 on 18/07/23.
//

import UIKit

class HistoryTrasactionVC: UIViewController {
    @IBOutlet weak var amountShowLblView: UIView!
    @IBOutlet weak var amountHideShowBtn: UIButton!
    @IBOutlet weak var tableViewOne: UITableView!
    @IBOutlet weak var tableViewTwo: UITableView!
    @IBOutlet weak var tableViewThree: UITableView!
    @IBOutlet weak var janLbl: UILabel!
    @IBOutlet weak var febLbl: UILabel!
    @IBOutlet weak var marLbl: UILabel!
    @IBOutlet weak var aprlbl: UILabel!
    @IBOutlet weak var mayLbl: UILabel!
    @IBOutlet weak var junLbl: UILabel!
    @IBOutlet weak var janBarView: UIView!
    @IBOutlet weak var febBarView: UIView!
    @IBOutlet weak var marBarView: UIView!
    @IBOutlet weak var aprBarView: UIView!
    @IBOutlet weak var mayBarView: UIView!
    @IBOutlet weak var junBarView: UIView!
    var previouslyTappedLabel: UILabel? = nil
    var isAmountShow = true
    var viewModel = TableViewModelClass()
    var viewModelForTableViewThree = TableViewThreeModelClass()
    override func viewDidLoad() {
        super.viewDidLoad()
        amountShowLblView.isHidden = false
        let nib = UINib(nibName: "TableViewOneAndTwoCell", bundle: nil)
        tableViewOne.register(nib, forCellReuseIdentifier: "TableViewOneAndTwoCell")
        tableViewTwo.register(nib, forCellReuseIdentifier: "TableViewOneAndTwoCell")
        configureLbls()
    }
    
    @IBAction func amountHideShowBtnPressed(_ sender: UIButton) {
        amountShowLblView.isHidden.toggle()
        isAmountShow.toggle()
        if isAmountShow {
            let image = UIImage(systemName: "eye")
            amountHideShowBtn.setImage(image, for: .normal)
        }else{
            let image = UIImage(systemName: "eye.slash")
            amountHideShowBtn.setImage(image, for: .normal)
        }
    }
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func configureLbls(){
        addTapGestureToLabel(janLbl)
        addTapGestureToLabel(febLbl)
        addTapGestureToLabel(marLbl)
        addTapGestureToLabel(aprlbl)
        addTapGestureToLabel(mayLbl)
        addTapGestureToLabel(junLbl)
        if let janLblTapGesture = janLbl.gestureRecognizers?.first as? UITapGestureRecognizer {
            labelTapped(janLblTapGesture)
        }
    }
    
    func addTapGestureToLabel(_ label: UILabel) {
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        label.addGestureRecognizer(tapGesture)
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        if let tappedLabel = sender.view as? UILabel {
            guard let LaunchscreenColor = UIColor(named: "LaunchscreenColor") else { return }
            guard let GlobalButtonColor = UIColor(named: "GlobalButtonColor") else { return }
            tappedLabel.textColor = LaunchscreenColor
            // Reset the color of the previously tapped label and its corresponding view
            previouslyTappedLabel?.textColor = .black
            updateViewColorForLabel(previouslyTappedLabel, withColor: GlobalButtonColor)
            // Remove border and shadow from the previously tapped label
            previouslyTappedLabel?.layer.borderWidth = 0
            previouslyTappedLabel?.layer.shadowOpacity = 0
            // Store the current tapped label as the previously tapped label
            previouslyTappedLabel = tappedLabel
            // Update the corresponding view's color for the current tapped label
            updateViewColorForLabel(tappedLabel, withColor: LaunchscreenColor)
            // Add border and shadow to the tapped label
            tappedLabel.layer.borderWidth = 1.0
            tappedLabel.layer.borderColor = GlobalButtonColor.cgColor
            tappedLabel.layer.cornerRadius = 5.0
            tappedLabel.layer.shadowColor = GlobalButtonColor.cgColor
            tappedLabel.layer.shadowOffset = CGSize(width: 0, height: 2)
            tappedLabel.layer.shadowOpacity = 0.5
            tappedLabel.layer.shadowRadius = 2.0
        }
    }
    
    private func updateViewColorForLabel(_ label: UILabel?, withColor color: UIColor) {
        switch label {
        case janLbl:
            janBarView.backgroundColor = color
        case febLbl:
            febBarView.backgroundColor = color
        case marLbl:
            marBarView.backgroundColor = color
        case aprlbl:
            aprBarView.backgroundColor = color
        case mayLbl:
            mayBarView.backgroundColor = color
        case junLbl:
            junBarView.backgroundColor = color
        default:
            break
        }
    }
    
}

extension HistoryTrasactionVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewOne {
            return 3
        }
        if tableView == tableViewTwo {
            return 3
        }
        if tableView == tableViewThree {
            return viewModelForTableViewThree.TableViewThreeModelClassArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let dataFortableViewOne = viewModel.TableViewModelClassArray
        let dataFortableViewTwo = viewModel.TableViewModelClassArray.enumerated().filter { $0.offset > 2 }.map { $0.element }
        if tableView == tableViewOne {
            let cell = tableViewOne.dequeueReusableCell(withIdentifier: "TableViewOneAndTwoCell", for: indexPath) as! TableViewOneAndTwoCell
            cell.img.image = UIImage(named: dataFortableViewOne[indexPath.row].img)
            cell.lbl1.text = dataFortableViewOne[indexPath.row].lbl1
            cell.lbl2.text = dataFortableViewOne[indexPath.row].lbl2
            cell.lbl3.text = dataFortableViewOne[indexPath.row].lbl3
            return cell
        }
        
        if tableView == tableViewTwo {
            let cell = tableViewTwo.dequeueReusableCell(withIdentifier: "TableViewOneAndTwoCell", for: indexPath) as! TableViewOneAndTwoCell
            cell.img.image = UIImage(named: dataFortableViewTwo[indexPath.row].img)
            cell.lbl1.text = dataFortableViewTwo[indexPath.row].lbl1
            cell.lbl2.text = dataFortableViewTwo[indexPath.row].lbl2
            cell.lbl3.text = dataFortableViewTwo[indexPath.row].lbl3
            return cell
        }
        
        if tableView == tableViewThree {
            let cellForTableViewThree = tableViewThree.dequeueReusableCell(withIdentifier: "TableViewThreeCell", for: indexPath) as!TableViewThreeCell
            cellForTableViewThree.lbl1.text = viewModelForTableViewThree.TableViewThreeModelClassArray[indexPath.row].lbl1
            cellForTableViewThree.lbl2.text = viewModelForTableViewThree.TableViewThreeModelClassArray[indexPath.row].lbl2
            return cellForTableViewThree
        }
        
        return UITableViewCell()
    }
    
}
