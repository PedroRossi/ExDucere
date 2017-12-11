//
//  HomeViewController.swift
//  ExDucere
//
//  Created by Arthur Barcellos Lopes de Lima on 12/7/17.
//  Copyright © 2017 Pedro Gonçalves Rossi Rodrigues. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var segmentControlFilter: UISegmentedControl!
    
    var dados:[DataCell] = []
    var filterView:FilterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var dado:DataCell
        var dado1:DataCell
        var dado2:DataCell
        var dado3:DataCell
        var dado4:DataCell
        var dado5:DataCell
        
        dado = DataCell(disciplina: "Português", assunto: "Gramática", nome: "José Pereira", imagem: #imageLiteral(resourceName: "padrao_480"), avaliacao: "5", faixaEtaria: "3-5 anos", material: #imageLiteral(resourceName: "icons8-book-filled-50") )
        dado1 = DataCell(disciplina: "Matemática", assunto: "Aritmética", nome: "João Augusto", imagem: #imageLiteral(resourceName: "padrao_480"), avaliacao: "4", faixaEtaria: "5-7 anos", material: #imageLiteral(resourceName: "icons8-internet-50"))
        dado2 = DataCell(disciplina: "Música", assunto: "Compasso", nome: "Flávia Mozart", imagem: #imageLiteral(resourceName: "padrao_480"), avaliacao: "3", faixaEtaria: "7-9 anos", material: #imageLiteral(resourceName: "icons8-musical-notes-50"))
        dado3 = DataCell(disciplina: "Francês", assunto: "Conjugaison des verbes", nome: "François Montand", imagem: #imageLiteral(resourceName: "padrao_480"), avaliacao: "4", faixaEtaria: "9-11 anos", material:#imageLiteral(resourceName: "icons8-idea-50"))
        dado4 = DataCell(disciplina: "História", assunto: "História de Pernambuco", nome: "Henrique Dias", imagem: #imageLiteral(resourceName: "padrao_480"), avaliacao: "5", faixaEtaria: "11-14 anos", material:#imageLiteral(resourceName: "icons8-idea-50"))
        dado5 = DataCell(disciplina: "Religião", assunto: "Catecismo", nome: "Maria de Lourdes", imagem: #imageLiteral(resourceName: "padrao_480"), avaliacao: "5", faixaEtaria: "7-9 anos", material: #imageLiteral(resourceName: "icons8-book-filled-50") )
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detalhePost"{
            
        
        }
        
    }
    
    @IBAction func typeFilter(_ sender: Any) {
        
        if (filterView != nil){
            filterView.view.removeFromSuperview()
        }
        
        switch segmentControlFilter.selectedSegmentIndex {
        case 0:
            filterView = FilterView(frame: CGRect(x: 0, y: 50, width: 220, height: 414))
            filterView.closeButton.addTarget(self, action:Selector(("closed:")), for: .touchUpInside)
            self.view.addSubview(filterView)
        case 1:
            filterView = FilterView(frame: CGRect(x: 70, y: 50, width: 220, height: 414))
            filterView.closeButton.addTarget(self, action: "closed:", for: UIControlEvents.touchUpInside)
            self.view.addSubview(filterView)
        case 2:
            filterView = FilterView(frame: CGRect(x: 150, y: 50, width: 220, height: 414))
            filterView.closeButton.addTarget(self, action: "closed:", for: UIControlEvents.touchUpInside)
            self.view.addSubview(filterView)
        default:
            break
        }
    }
    
    func closed(sender:UIButton) {
        print("closed its ok")
        filterView.view.removeFromSuperview()
    }
}
