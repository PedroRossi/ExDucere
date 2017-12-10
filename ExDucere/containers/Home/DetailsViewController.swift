//
//  DetailsViewController.swift
//  ExDucere
//
//  Created by Raquel Maria Santos de Oliveira on 10/12/17.
//  Copyright © 2017 Pedro Gonçalves Rossi Rodrigues. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var descricaoComoUsar: UILabel!
    @IBOutlet weak var labelComoUsar: UILabel!
    @IBOutlet weak var descricaoTitulo: UILabel!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var assunto: UILabel!
    @IBOutlet weak var faixaEtaria: UILabel!
    @IBOutlet weak var disciplina: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
