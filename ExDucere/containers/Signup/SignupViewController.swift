//
//  SignupViewController.swift
//  ExDucere
//
//  Created by Pedro Gonçalves Rossi Rodrigues on 28/11/17.
//  Copyright © 2017 Pedro Gonçalves Rossi Rodrigues. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {

    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var senhaConfirmada: UITextField!
    
    @IBAction func cadastrarUsuario(_ sender: Any) {
        
        //Recuperar dados digitados
        //if let nomeRecuperado = self.nome.text{
        if let emailRecuperado = self.email.text{
            if let senhaRecuperada = self.senha.text{
                if let confirmarSenhaRecuperada = self.senhaConfirmada.text{
                    
                    //Validar Senha
                    if senhaRecuperada == confirmarSenhaRecuperada{
                        let autenticacao = Auth.auth()
                        
                        autenticacao.createUser(withEmail: emailRecuperado, password: senhaRecuperada){
                            (usuario, erro) in
                            if erro == nil{
                                print("Sucesso ao cadastrar usuário.")
                            }
                            else{
                                
                                let erroRecuperado = erro! as NSError
                                if let codigoErro = erroRecuperado.userInfo["error_name"]{
                                    
                                    let erroTexto = codigoErro as! String
                                    var mensagemErro = ""
                                    
                                    switch erroTexto{
                                        
                                    case "ERROR_INVALID_EMAIL":
                                        mensagemErro = "E-mail inválido, digite um e-mail válido"
                                        break
                                    case "ERROR_EMAIL_ALREADY_IN_USE":
                                        mensagemErro = "Esse e-mail já está sendo utilizado inválido, crie sua conta com outro e-mail."
                                        break
                                    case "ERROR_WEAK_PASSWORD":
                                        mensagemErro = "Senha precisa ter no mínimo 6 caracteres, com letras e números."
                                        break
                                    default:
                                        mensagemErro = "Dados digitados estão incorretos."
                                        
                                    }
                                    
                                    self.exibirMensagem(titulo: "Dados inválidos", mensagem: mensagemErro)
                                }
                            }
                        }
                    }
                    else{
                        self.exibirMensagem(titulo: "Dados Incorretos", mensagem: "As senhas não estão iguais, digite novamente.")
                    }
                    
                }
            }
        }
        //}
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func exibirMensagem(titulo: String, mensagem: String){
        
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel , handler: nil)
        
        alerta.addAction(acaoCancelar)
        present(alerta, animated: true, completion: nil)
    }
    
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
