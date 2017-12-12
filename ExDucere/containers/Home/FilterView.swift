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
    @IBOutlet weak var filterTableView: UITableView!
    
    @IBOutlet weak var closeButton: UIButton!
    
    var view:UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "FilterView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0]as! UIView
        
        return view
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        
        addSubview(view)
    }
}
