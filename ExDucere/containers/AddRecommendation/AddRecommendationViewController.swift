//
//  AddRecommendationViewController.swift
//  ExDucere
//
//  Created by Pedro Gonçalves Rossi Rodrigues on 10/12/17.
//  Copyright © 2017 Pedro Gonçalves Rossi Rodrigues. All rights reserved.
//

import UIKit

class AddRecommendationViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: Properties
    
    let subjects:[String] = ["Português", "Matemática", "História", "Geografia", "Biologia", "Literatura","Religião","Inglês","Francês","Latim","Música"]
    let ageRanges:[String] = ["3 a 5","5 a 7","7 a 9","9 a 11","11 a 13","13 a 15","15 a 17"]
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var subjectPicker: UIPickerView!
    @IBOutlet weak var topicTextField: UITextField!
    @IBOutlet weak var ageRangeSlider: UISlider!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var guideTextField: UITextView!
    
    var type: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subjectPicker.delegate = self
        subjectPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTypeSegmentedControlChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            type = 0;
        case 1:
            type = 1;
        case 2:
            type = 2;
        case 3:
            type = 3;
        default:
            break
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return subjects.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return subjects[row]
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
