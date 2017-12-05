//
//  LinkViewController.swift
//  ExDucere
//
//  Created by Arthur Barcellos Lopes de Lima on 12/5/17.
//  Copyright © 2017 Pedro Gonçalves Rossi Rodrigues. All rights reserved.
//

import UIKit

class LinkViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var disciplinas:[String] = ["Português", "Matemática", "História", "Geografia", "Biologia", "Literatura","Religião","Inglês","Francês","Latim"]
    var faixasIdade:[String] = ["3 a 5","5 a 7","7 a 9","9 a 11","11 a 13","13 a 15","15 a 17"]
    
    //label
    @IBOutlet weak var valorIdade: UILabel!
    
    
    //picker
    @IBOutlet weak var picker: UIPickerView!
    
    
    @IBAction func silderIdade(_ sender: UISlider) {
        
        valorIdade.text = faixasIdade[Int(sender.value)]
        
    }
    
    //button
    @IBOutlet weak var publicar: UIButton!
    
    @IBAction func publicarButton(_ sender: Any) {
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.picker.delegate = self
        self.picker.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return disciplinas.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return disciplinas[row]
        
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
