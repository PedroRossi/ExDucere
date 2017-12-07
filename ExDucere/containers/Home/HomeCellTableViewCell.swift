//
//  HomeCellTableViewCell.swift
//  ExDucere
//
//  Created by Arthur Barcellos Lopes de Lima on 12/7/17.
//  Copyright © 2017 Pedro Gonçalves Rossi Rodrigues. All rights reserved.
//

import UIKit

class HomeCellTableViewCell: UITableViewCell {

    @IBOutlet weak var disciplina: UILabel!
    @IBOutlet weak var assunto: UILabel!
    @IBOutlet weak var nome: UILabel!
    
    @IBOutlet weak var imagem: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
