//
//  ViewController.swift
//  Demo
//
//  Created by Hiecor Software on 05/01/22.
//

import UIKit

class ViewController: UIViewController{
    
    //MARK: IBOutlet
    @IBOutlet weak var collectionVIew: UICollectionView!
    
    var sectionNew = [TheaterModel]()
    let stringData = "B:1(C)|2(A)|3(C)|4(A)|5(c)|6(A)|7(C)|8(A)|9(C)/C:1(B)|2(C)|3(B)|4(C)|P|P|5(A)|6(C)|7(A)/D:1(C)|2(A)|3(C)|4(A)|P|P|5(C)|6(A)|7(C)/E:1(A)|2(C)|3(A)|4(C)|P|P|5(A)|6(C)|7(A)/F:1(C)|2(A)|3(C)|4(A)| P|P|5(C)|6(A)|7(C)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionVIew.dataSource = self
        collectionVIew.delegate = self
        
        let result = stringData.split(separator: "/")

        for i in result {
            let rowData = i.split(separator: ":")
            let splitStringArray = rowData.last!.split(separator: "|").map({ (substring) in
                return String(substring)
            })
            sectionNew.append(TheaterModel(rowName: String(rowData[0]), rowData: splitStringArray))
            
        }
        collectionVIew.reloadData()
        // Do any additional setup after loading the view.
    }

    
}

//MARK: UICollectionViewDataSource & UICollectionViewDelegate
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate  {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sectionNew.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionNew[section].rowData.count + 1
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionVIew.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath as IndexPath) as! CustomCollectionViewCell
        if indexPath.row == 0 {
            cell.label.isHidden = false
            cell.img.isHidden = true
            cell.label.text = sectionNew[indexPath.section].rowName
            return cell
        }
        let name =  sectionNew[indexPath.section].rowData[indexPath.row-1] as! String
        cell.setValues(rowName: name)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/12
        let yourHeight = yourWidth
        
        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
