//
//  DataCell.swift
//  ExDucere
//
//  Created by Arthur Barcellos Lopes de Lima on 12/11/17.
//  Copyright © 2017 Pedro Gonçalves Rossi Rodrigues. All rights reserved.
//

import UIKit

class DataCell{
    
    var disciplina:String!
    var assunto:String!
    var nome:String!
    var avaliacao:String!
    var faixaEtaria:String!
    
    var imagem:UIImage!
    var material:UIImage!
    
    init(disciplina:String, assunto:String, nome:String, imagem:UIImage, avaliacao:String, faixaEtaria:String, material:UIImage) {
        
        self.disciplina = disciplina
        self.assunto = assunto
        self.nome = nome
        self.imagem = imagem
        self.avaliacao = avaliacao
        self.faixaEtaria = faixaEtaria
        self.material = material
        
    }
    
}
