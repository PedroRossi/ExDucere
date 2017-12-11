//
//  DetailsViewController.swift
//  ExDucere
//
//  Created by Raquel Maria Santos de Oliveira on 10/12/17.
//  Copyright © 2017 Pedro Gonçalves Rossi Rodrigues. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var detalhe:DataCell!
    
    @IBOutlet weak var descricaoComoUsar: UILabel!
    @IBOutlet weak var labelComoUsar: UILabel!
    @IBOutlet weak var descricaoTitulo: UILabel!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var assunto: UILabel!
    @IBOutlet weak var disciplina: UILabel!
    
    @IBOutlet weak var avaliacao: UILabel!
    @IBOutlet weak var material: UIImageView!
    @IBOutlet weak var faixaEtaria: UILabel!
    @IBOutlet weak var nome: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        assunto.text = detalhe.assunto
        disciplina.text = detalhe.disciplina
        avaliacao.text = detalhe.avaliacao
        material.image = detalhe.material
        faixaEtaria.text = detalhe.faixaEtaria
        
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
