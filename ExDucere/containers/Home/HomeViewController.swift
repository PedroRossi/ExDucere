//
//  HomeViewController.swift
//  ExDucere
//
//  Created by Arthur Barcellos Lopes de Lima on 12/7/17.
//  Copyright © 2017 Pedro Gonçalves Rossi Rodrigues. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var faixasIdade:[String] = ["3 a 5","5 a 7","7 a 9","9 a 11","11 a 13","13 a 15","15 a 17"]
    var material:String = "livro"
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var pesquisa: UITextField!
    
    //label idade
    @IBOutlet weak var valorIdade: UILabel!
    
    //slider
    @IBAction func sliderIdade(_ sender: UISlider) {
        
        valorIdade.text = faixasIdade[Int(sender.value)]
        
    }
    
    @IBOutlet weak var tipoMaterial: UISegmentedControl!
    
    @IBAction func escolherMaterial(_ sender: UISegmentedControl) {
        
        switch tipoMaterial.selectedSegmentIndex {
        case 0:
            material = "livro"
        case 1:
            material = "site"
        case 2:
            material = "musica"
        case 3:
            material = "atividade"
        default:
            break
        }
        
        print(material)
        
    }
    
    
    var dados:[DataCell] = []
    var filterView:FilterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        ref.child("recommendations").observe(.value, with: { (snapshot: DataSnapshot) in
            for child in snapshot.children {
                break;
                let snap = child as! DataSnapshot
                let subject = snap.value(forKey: "subject") as! String
                let topic = snap.value(forKey: "topic") as! String
                let type = snap.value(forKey: "type") as! Int
                let minAge = snap.value(forKey: "min_age") as! Int
                let maxAge = snap.value(forKey: "max_age") as! Int
                let ageRange = String(minAge) + "-" + String(maxAge)
                var material: UIImage = #imageLiteral(resourceName: "icons8-book-filled-50")
                switch (type) {
                case 0:
                    material = #imageLiteral(resourceName: "icons8-book-filled-50")
                case 1:
                    material = #imageLiteral(resourceName: "icons8-internet-50")
                case 2:
                    material = #imageLiteral(resourceName: "icons8-musical-notes-50")
                case 3:
                    material = #imageLiteral(resourceName: "icons8-idea-50")
                default:
                    break
                }
                let data = DataCell(disciplina: subject, assunto: topic, nome: "José Pereira", imagem: #imageLiteral(resourceName: "padrao_480"), avaliacao: "5", faixaEtaria: ageRange, material: material)
                print(data)
                // self.dados.append(data)
            }
        })
        
        self.pesquisa.delegate = self
        valorIdade.text = faixasIdade[0]
        
        var dado:DataCell
        var dado1:DataCell
        var dado2:DataCell
        var dado3:DataCell
        var dado4:DataCell
        var dado5:DataCell
        
        dado = DataCell(disciplina: "Português", assunto: "Gramática", nome: "José Pereira", imagem: #imageLiteral(resourceName: "padrao_480"), avaliacao: "5", faixaEtaria: "3-5", material: #imageLiteral(resourceName: "icons8-book-filled-50") )
        dado1 = DataCell(disciplina: "Matemática", assunto: "Aritmética", nome: "João Augusto", imagem: #imageLiteral(resourceName: "padrao_480"), avaliacao: "4", faixaEtaria: "5-7", material: #imageLiteral(resourceName: "icons8-internet-50"))
        dado2 = DataCell(disciplina: "Música", assunto: "Compasso", nome: "Flávia Mozart", imagem: #imageLiteral(resourceName: "padrao_480"), avaliacao: "3", faixaEtaria: "7-9", material: #imageLiteral(resourceName: "icons8-musical-notes-50"))
        dado3 = DataCell(disciplina: "Francês", assunto: "Conjugaison des verbes", nome: "François Montand", imagem: #imageLiteral(resourceName: "padrao_480"), avaliacao: "4", faixaEtaria: "9-11", material:#imageLiteral(resourceName: "icons8-idea-50"))
        dado4 = DataCell(disciplina: "História", assunto: "História de Pernambuco", nome: "Henrique Dias", imagem: #imageLiteral(resourceName: "padrao_480"), avaliacao: "5", faixaEtaria: "11-14", material:#imageLiteral(resourceName: "icons8-idea-50"))
        dado5 = DataCell(disciplina: "Religião", assunto: "Catecismo", nome: "Maria de Lourdes", imagem: #imageLiteral(resourceName: "padrao_480"), avaliacao: "5", faixaEtaria: "7-9", material: #imageLiteral(resourceName: "icons8-book-filled-50") )
        
        dados.append(dado)
        dados.append(dado1)
        dados.append(dado2)
        dados.append(dado3)
        dados.append(dado4)
        dados.append(dado5)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dados.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dado:DataCell = dados[indexPath.row]
        
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell") as! HomeCellTableViewCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeCellTableViewCell
        
        cell.disciplina.text = dado.disciplina
        cell.assunto.text = dado.assunto
        cell.nome.text = dado.nome
        cell.avaliacao.text = dado.avaliacao
        cell.faixaEtaria.text = dado.faixaEtaria
        
        cell.imagem.image = dado.imagem
        cell.material.image = dado.material
        
        cell.imagem.layer.cornerRadius = 32
        cell.imagem.clipsToBounds = true
        
        return cell
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detalhePost"{
            
        
        }
        
    }
    
}
