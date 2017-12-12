//
//  AddRecommendationViewController.swift
//  ExDucere
//
//  Created by Pedro Gonçalves Rossi Rodrigues on 10/12/17.
//  Copyright © 2017 Pedro Gonçalves Rossi Rodrigues. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class AddRecommendationViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    // MARK: Properties
    
    let subjects:[String] = ["Português", "Matemática", "História", "Geografia", "Biologia", "Literatura","Religião","Inglês","Francês","Latim","Música"]
    let ageRanges:[String] = ["3 a 5","5 a 7","7 a 9","9 a 11","11 a 13","13 a 15","15 a 17"]
    let ageRangesPair:[(Int,Int)] = [(3,5),(5,7),(7,9),(9,11),(11,13),(13,15),(15,17)]
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var subjectPicker: UIPickerView!
    @IBOutlet weak var topicTextField: UITextField!
    @IBOutlet weak var ageRangeLabel: UILabel!
    @IBOutlet weak var ageRangeSlider: UISlider!
    @IBOutlet weak var typeOfMaterialLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var guideTextField: UITextView!
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subjectPicker.delegate = self
        subjectPicker.dataSource = self
        
        topicTextField.delegate = self
        
        descriptionTextField.delegate = self
        guideTextField.delegate = self
        
        typeSegmentedControl.selectedSegmentIndex = 0
        typeOfMaterialLabel.text = "Livro"
        descriptionLabel.text = "Livro/Autor/Editora:"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Segmented Control
    
    @IBAction func onChangeTypeSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            typeOfMaterialLabel.text = "Livro"
            descriptionLabel.text = "Livro/Autor/Editora:"
        case 1:
            typeOfMaterialLabel.text = "Site"
            descriptionLabel.text = "Link:"
        case 2:
            typeOfMaterialLabel.text = "Música"
            descriptionLabel.text = "Artista/Álbum/Compositor:"
        case 3:
            typeOfMaterialLabel.text = "Atividade"
            descriptionLabel.text = "Descrição:"
        default:
            break
        }
    }
    
    // MARK: UIPickerDelegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return subjects.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return subjects[row]
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: UITextViewDelegate
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            //action here
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    // MARK: Slider
    
    @IBAction func onChangeAgeRangeSlider(_ sender: UISlider) {
        ageRangeLabel.text = "\(ageRanges[Int(sender.value)]) anos"
    }
    
    @IBAction func confirm(_ sender: Any) {
        let type: Int = typeSegmentedControl.selectedSegmentIndex
        let subject: String = subjects[subjectPicker.selectedRow(inComponent: 0)]
        let topic: String = topicTextField.text!
        let ageRange: (Int, Int) = ageRangesPair[Int(ageRangeSlider.value)]
        let description: String = descriptionTextField.text!
        let guide: String = guideTextField.text!
        let owner = Auth.auth().currentUser?.uid
        let rank = -1
        let ref = Database.database().reference()
        var data = [String: Any]()
        data = ["owner": owner!,"type":type,"subject":subject,"topic":topic,"min_age":ageRange.0,"max_age":ageRange.1,"description":description,"guide":guide,"rank":rank]
        for param in data {
            if (String(describing: param.value) == "") {
                sendAlert(title: "Erro de Validação", message: "Por favor preencha todos os campos!")
                return;
            }
        }
        ref.child("recommendations").childByAutoId().setValue(data)
        self.navigationController?.tabBarController?.selectedIndex = 2
        self.cleanFields()
    }
    
    // MARK: Private
    
    private func cleanFields() {
        typeSegmentedControl.selectedSegmentIndex = 0
        subjectPicker.selectRow(0, inComponent: 0, animated: false)
        topicTextField.text = ""
        ageRangeSlider.value = 0.0
        typeOfMaterialLabel.text = "Livro"
        descriptionLabel.text = "Livro/Autor/Editora:"
        descriptionTextField.text = ""
        guideTextField.text = ""
    }
    
    private func sendAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .cancel , handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
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
