//
//  ActivityVC.swift
//  UberPath
//
//  Created by IPS-161 on 03/07/23.
//

import UIKit

class ActivityVC: UIViewController {
    @IBOutlet weak var collectionViewOne: UICollectionView!
    @IBOutlet weak var pageControllForCollectionViewOne: UIPageControl!
    @IBOutlet weak var btn1: UILabel!
    @IBOutlet weak var btn2: UILabel!
    @IBOutlet weak var btn3: UILabel!
    @IBOutlet weak var btn4: UILabel!
    @IBOutlet weak var barGraphView: RoundedButtonWithBorder!
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var durationShowLbl: UILabel!
    @IBOutlet weak var durationShowBtn: UIButton!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var weekLbl: UILabel!
    @IBOutlet weak var monthLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var durationView: RoundedButtonWithBorder!
    var collectionViewOneArray = ["Co.payment Cards", "Smartpay Cards"]
    var barGraphLayers: [CALayer] = []
    var showBar : Bool = true
    var viewModel = TableViewModelClass()
    var showDurationBtn = false
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        updateCell()
        durationView.isHidden = true
        [btn1, btn2, btn3, btn4].enumerated().forEach { index, button in
            button?.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(btnTapped(_:)))
            tapGesture.view?.tag = index
            button?.addGestureRecognizer(tapGesture)
        }
    }
    
    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
        let page = sender.currentPage
        let offsetX = CGFloat(page) * collectionViewOne.frame.width
        let offset = CGPoint(x: offsetX, y: 0)
        collectionViewOne.setContentOffset(offset, animated: true)
    }
    
    
    @IBAction func toggleBtnPressed(_ sender: UISwitch) {
        if sender.isOn {
            showBarGraph()
            showBar = true
        } else {
            hideBarGraph()
            showBar = false
        }
    }
    
    func showBarGraph() {
        for layer in barGraphLayers {
            if let barLayer = layer as? CALayer {
                barLayer.isHidden = false
            }
            
            if let lineLayer = layer as? CAShapeLayer {
                lineLayer.isHidden = false
            }
        }
    }
    
    func hideBarGraph() {
        for layer in barGraphLayers {
            if let barLayer = layer as? CALayer {
                barLayer.isHidden = true
            }
            if let lineLayer = layer as? CAShapeLayer {
                lineLayer.isHidden = false
            }
        }
    }
    
    @IBAction func durationShowBtnPressed(_ sender: UIButton) {
        showDurationBtn.toggle()
        
        if showDurationBtn {
            durationShowBtn.setImage(UIImage(named: "ForwardArrow"), for: .normal)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.durationView.frame.size.height = 0
                self?.durationView.alpha = 0
            } completion: { [weak self] _ in
                self?.durationView.isHidden = true
                self?.durationView.frame.size.height = self?.durationView.intrinsicContentSize.height ?? 0
                UIView.animate(withDuration: 0.3) {
                    self?.durationView.alpha = 1
                }
            }
        } else {
            durationShowBtn.setImage(UIImage(named: "DownArrow"), for: .normal)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.durationView.alpha = 0
            } completion: { [weak self] _ in
                self?.durationView.isHidden = false
                UIView.animate(withDuration: 0.3) {
                    self?.durationView.frame.size.height = self?.durationView.intrinsicContentSize.height ?? 0
                    self?.durationView.alpha = 1
                }
            }
        }
    }



    
    @objc func btnTapped(_ gesture: UITapGestureRecognizer) {
        guard let tappedLabel = gesture.view as? UILabel else {
            return
        }
        // Set the tapped label's background color to gray
        tappedLabel.backgroundColor = .systemGray6
        tappedLabel.font = UIFont.boldSystemFont(ofSize: tappedLabel.font.pointSize)
        // Set the background color of all other labels to white
        let allLabels = [btn1, btn2, btn3, btn4]
        for label in allLabels {
            if label != tappedLabel {
                label?.backgroundColor = .white
                label?.font = UIFont.systemFont(ofSize: (label?.font.pointSize)!)
                label?.layer.borderWidth = 0
                label?.layer.borderColor = UIColor.white.cgColor
                label?.layer.cornerRadius = 0
                label?.layer.shadowColor = UIColor.white.cgColor
                label?.layer.shadowOffset = CGSize(width: 0, height: 0)
                label?.layer.shadowRadius = 0
                label?.layer.shadowOpacity = 0
            }
        }
        // Add border and shadow to the tapped label
        tappedLabel.layer.borderWidth = 1.0
        tappedLabel.layer.borderColor = UIColor.gray.cgColor
        tappedLabel.layer.cornerRadius = 5.0
        tappedLabel.layer.shadowColor = UIColor.black.cgColor
        tappedLabel.layer.shadowOffset = CGSize(width: 0, height: 2)
        tappedLabel.layer.shadowRadius = 4.0
        tappedLabel.layer.shadowOpacity = 0.5
        removeBarGraph()
        
        switch tappedLabel {
        case btn1:
            drawBarGraph(withTimeInterval: .day)
        case btn2:
            drawBarGraph(withTimeInterval: .weekOfYear)
        case btn3:
            drawBarGraph(withTimeInterval: .month)
        case btn4:
            drawBarGraph(withTimeInterval: .year)
        default:
            break
        }
    }
    
    func drawBarGraph(withTimeInterval timeInterval: Calendar.Component) {
        let barGraphHeight = barGraphView.frame.height
        let barGraphWidth = barGraphView.frame.width
        
        // Sample data values for the different time intervals
        let barValues: [CGFloat]
        switch timeInterval {
        case .day:
            barValues = [50, 80, 120, 90, 110, 70, 100]
        case .weekOfYear:
            barValues = [70, 110, 90, 120, 80, 100, 50]
        case .month:
            barValues = [120, 90, 110, 100, 80, 70, 50]
        case .year:
            barValues = [110, 80, 90, 70, 50, 120, 100]
        default:
            barValues = []
        }
        
        let maxBarValue = barValues.max() ?? 0 // Get the maximum value from the data
        
        for (index, barValue) in barValues.enumerated() {
            let barX = (barGraphWidth / 7.0) * CGFloat(index)
            let barY = barGraphHeight - (barValue / maxBarValue) * barGraphHeight
            let barLayer = CALayer()
            barLayer.frame = CGRect(x: barX, y: barY, width: 20, height: barGraphHeight - barY) // Adjust the bar size as per your preference
            barLayer.backgroundColor = UIColor.blue.cgColor // Adjust the color as per your preference
            barGraphView.layer.addSublayer(barLayer)
            barGraphLayers.append(barLayer)
            if showBar {
                for layer in barGraphLayers {
                    if let barLayer = layer as? CALayer {
                        barLayer.isHidden = false
                    }
                    if let lineLayer = layer as? CAShapeLayer {
                        lineLayer.isHidden = false
                    }
                }
            }else{
                for layer in barGraphLayers {
                    if let barLayer = layer as? CALayer {
                        barLayer.isHidden = true
                    }
                    if let lineLayer = layer as? CAShapeLayer {
                        lineLayer.isHidden = false
                    }
                }
            }
            
            if index < barValues.count - 1 {
                let nextBarValue = barValues[index + 1]
                let nextBarX = (barGraphWidth / 7.0) * CGFloat(index + 1)
                let nextBarY = barGraphHeight - (nextBarValue / maxBarValue) * barGraphHeight
                let lineLayer = CAShapeLayer()
                let linePath = UIBezierPath()
                linePath.move(to: CGPoint(x: barX + 6, y: barY))
                linePath.addLine(to: CGPoint(x: nextBarX + 6, y: nextBarY))
                lineLayer.path = linePath.cgPath
                lineLayer.strokeColor = UIColor.blue.cgColor // Adjust the line color as per your preference
                lineLayer.lineWidth = 1.0 // Adjust the line width as per your preference
                barGraphView.layer.addSublayer(lineLayer)
                barGraphLayers.append(lineLayer)
            }
            
        }
    }
    
    func removeBarGraph() {
        for layer in barGraphLayers {
            layer.removeFromSuperlayer()
        }
        barGraphLayers.removeAll()
    }
    
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let currentPage = Int(scrollView.contentOffset.x / pageWidth)
        pageControllForCollectionViewOne.currentPage = currentPage
    }
    
    func updateCell(){
        pageControllForCollectionViewOne.numberOfPages = collectionViewOneArray.count
        let layout = UICollectionViewFlowLayout()
        let cellWidth = collectionViewOne.frame.width - 40 // Adjust the width as per your requirement
        layout.itemSize = CGSize(width: cellWidth, height: collectionViewOne.frame.height)
        layout.minimumLineSpacing = 40 // Adjust the spacing as per your requirement
        let horizontalInset = (collectionViewOne.frame.width - cellWidth) / 2
        layout.sectionInset = UIEdgeInsets(top: 20, left: horizontalInset, bottom: 20, right: horizontalInset) // Adjust the insets as per your requirement
        layout.scrollDirection = .horizontal
        collectionViewOne.collectionViewLayout = layout
    }
    
}

extension ActivityVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewOneArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewOneCell", for: indexPath) as! CollectionViewOneCell
        cell.cellImg.image = UIImage(named: collectionViewOneArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width - 40 // Adjust the width as per your requirement
        return CGSize(width: cellWidth, height: collectionView.frame.height)
    }
    
}

extension ActivityVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.TableViewModelClassArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        cell.cellImg.image = UIImage(named: viewModel.TableViewModelClassArray[indexPath.row].img)
        cell.cellLbl1.text = viewModel.TableViewModelClassArray[indexPath.row].lbl1
        cell.cellLbl2.text = viewModel.TableViewModelClassArray[indexPath.row].lbl2
        cell.cellLbl3.text = viewModel.TableViewModelClassArray[indexPath.row].lbl3
        return cell
    }
    
}
