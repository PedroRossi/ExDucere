//
//  FilterView.swift
//  ExDucere
//
//  Created by Raquel Maria Santos de Oliveira on 10/12/17.
//  Copyright © 2017 Pedro Gonçalves Rossi Rodrigues. All rights reserved.
//

import UIKit

@IBDesignable
class FilterView: UIView {
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var filterTableView: UITableView!
    
    var view:UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
  
    }
    
}
