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
    override func viewDidLoad() {
        super.viewDidLoad()
        amountShowLblView.isHidden = false
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "TableViewCellForOneAndTwo", bundle: bundle)
        tableViewOne.register(nib, forCellReuseIdentifier: "TableViewCellForOneAndTwo")
        tableViewTwo.register(nib, forCellReuseIdentifier: "TableViewCellForOneAndTwo")
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
    }
    
    func addTapGestureToLabel(_ label: UILabel) {
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        label.addGestureRecognizer(tapGesture)
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        if let tappedLabel = sender.view as? UILabel {
            guard let LaunchscreenColor = UIColor(named: "LaunchscreenColor") else {return}
            guard let GlobalButtonColor = UIColor(named: "GlobalButtonColor") else {return}
            tappedLabel.textColor = LaunchscreenColor
            // Reset the color of the previously tapped label and its corresponding view
            previouslyTappedLabel?.textColor = .black
            updateViewColorForLabel(previouslyTappedLabel, withColor: GlobalButtonColor )
            // Store the current tapped label as the previously tapped label
            previouslyTappedLabel = tappedLabel
            // Update the corresponding view's color for the current tapped label
            updateViewColorForLabel(tappedLabel, withColor: LaunchscreenColor)
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
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellForOneAndTwo", for: indexPath) as! TableViewCellForOneAndTwo
        let dataFortableViewOne = viewModel.TableViewModelClassArray
        let dataFortableViewTwo = viewModel.TableViewModelClassArray.enumerated().filter { $0.offset > 2 }.map { $0.element }
        if tableView == tableViewOne {
            cell.img.image = UIImage(named: dataFortableViewOne[indexPath.row].img)
            cell.lbl1.text = dataFortableViewOne[indexPath.row].lbl1
            cell.lbl2.text = dataFortableViewOne[indexPath.row].lbl2
            cell.lbl3.text = dataFortableViewOne[indexPath.row].lbl3
            return cell
        }
        
        if tableView == tableViewTwo {
            cell.img.image = UIImage(named: dataFortableViewTwo[indexPath.row].img)
            cell.lbl1.text = dataFortableViewTwo[indexPath.row].lbl1
            cell.lbl2.text = dataFortableViewTwo[indexPath.row].lbl2
            cell.lbl3.text = dataFortableViewTwo[indexPath.row].lbl3
            return cell
        }
        return UITableViewCell()
    }
    
}
