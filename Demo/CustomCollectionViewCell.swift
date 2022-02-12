//
//  CustomCollectionViewself.swift
//  Demo
//
//  Created by Hiecor Software on 05/01/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    //MARK: IBOutlet
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    func setValues(rowName: String)  {

        self.isHidden = false
        self.label.isHidden = true
        
        if (rowName.capitalized.contains("C")){
            self.img.image = #imageLiteral(resourceName: "square1")
            self.isHidden = false
        }else if (rowName.capitalized.contains("A")){
            self.img.image = #imageLiteral(resourceName: "square.png")
            self.img.contentMode = .scaleAspectFit
        }else if (rowName.capitalized.contains("B")){
            self.img.image = #imageLiteral(resourceName: "square2")
            self.isHidden = false
        }else if (rowName.capitalized.contains("P")){
            self.isHidden = true
            self.img.image = #imageLiteral(resourceName: "square.png")
        }
       }
    
}
