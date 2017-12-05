//
//  AddPostViewController.swift
//  ExDucere
//
//  Created by Arthur Barcellos Lopes de Lima on 12/1/17.
//  Copyright © 2017 Pedro Gonçalves Rossi Rodrigues. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController{
    
    @IBOutlet weak var livroView: UIView!
    @IBOutlet weak var linkView: UIView!
    
    
    
    //Segmented Control
    @IBOutlet weak var segmentedTipo: UISegmentedControl!
    
    @IBAction func tipoMaterial(_ sender: UISegmentedControl) {
        
        switch segmentedTipo.selectedSegmentIndex {
        case 0:
            livroView.isHidden = false
            linkView.isHidden = true
        case 1:
            livroView.isHidden = true
            linkView.isHidden = false
        default:
            break
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        livroView.isHidden = false
        linkView.isHidden = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
