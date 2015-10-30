//
//  ProductCell.swift
//  Catalog
//
//  Created by 박주영 on 2015. 10. 25..
//  Copyright © 2015년 tAcademy. All rights reserved.
//

import UIKit

protocol ProductCellDelegate : class {
    func addCart(productName : String)
}


class ProductCell: UITableViewCell {

    
    weak var delegate :ProductCellDelegate!
    
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    var productCode : String!
    var productNameString :String!
    
    
    @IBAction func addButtonClicked(sender: UIButton) {
        delegate.addCart(productNameString)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

/*
/////////////
import UIKit

protocol ProductCellDelegate : class {
    func addCart(productCode : String)
}

class ProductCell: UITableViewCell {
    
    weak var delegate : ProductCellDelegate!
    
    @IBAction func addButtonClicked(sender: AnyObject) {
        delegate.addCart(productCode)
    }
    
    var productCode : String!
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
}*/