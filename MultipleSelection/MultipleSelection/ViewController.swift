//
//  ViewController.swift
//  MultipleSelection
//
//  Created by Gaurav Bhatt on 05/07/22.
//

import UIKit
class MultipleSelction_ColCell:UICollectionViewCell {
    
    @IBOutlet weak var viewForSelection: UIView!
    @IBOutlet weak var lbl_Type: UILabel!
    
    override func layoutSubviews() {
        viewForSelection.layer.cornerRadius = viewForSelection.frame.height / 2
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var selectionCol: UICollectionView!
    
    var arrType = ["Chat","Cricket","Hockey","Party","Clubing","Date","Travelling"]
    
    var selectionSeriviceIndex = [-1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = selectionCol.dequeueReusableCell(withReuseIdentifier: "MultipleSelction_ColCell", for: indexPath) as! MultipleSelction_ColCell
        cell.lbl_Type.text = arrType[indexPath.row]
        if selectionSeriviceIndex.contains(indexPath.item) {
            cell.viewForSelection.backgroundColor = UIColor.blue
            cell.lbl_Type.textColor = UIColor.white
        } else {
            cell.viewForSelection.backgroundColor = .white
            cell.lbl_Type.textColor = .darkGray
        }
        cell.layoutIfNeeded()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let market = self.arrType[indexPath.row]
        let label = UILabel(frame: CGRect.zero)
        label.text =  market
        label.sizeToFit()
        return CGSize(width: label.frame.width + 20, height: 30)
//        return CGSize(width: self.selectionCol.frame.width / 5 - 5, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectionSeriviceIndex.contains(indexPath.item) {
            if let index = selectionSeriviceIndex.firstIndex(of: indexPath.item) {
                selectionSeriviceIndex.remove(at: index)
            }
        } else {
            selectionSeriviceIndex.append(indexPath.item)
        }
        selectionCol.reloadData()
    }
    
    
}

