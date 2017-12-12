//
//  LoginViewController.swift
//  ExDucere
//
//  Created by Pedro Gonçalves Rossi Rodrigues on 28/11/17.
//  Copyright © 2017 Pedro Gonçalves Rossi Rodrigues. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private func sendToTabBar() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let tabBarController = storyBoard.instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
        self.present(tabBarController, animated: false, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let user = Auth.auth().currentUser
        if (user != nil) {
            self.sendToTabBar()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton: FBSDKLoginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["email", "public_profile"]
        if let view = self.view.viewWithTag(100) {
            loginButton.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.bounds.size.width + 30, height: view.bounds.size.height)
            loginButton.center.x = view.center.x + 14
            loginButton.center.y = view.center.y - 50
            view.addSubview(loginButton)
        }
        loginButton.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        // user logged in
        if let error = error {
            print(error.localizedDescription)
            return
        } else if result.isCancelled {
            // Handle cancellations
        } else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            // print("User logged in")
            self.sendToTabBar()
            if result.grantedPermissions.contains("email") {
                let credential = FacebookAuthProvider.credential(withAccessToken: result.token.tokenString)
                Auth.auth().signIn(with: credential) { (user, error) in
                    if let error = error {
                        print(error)
                        return
                    }
                    if let name = user?.displayName {
                        var ref: DatabaseReference!
                        ref = Database.database().reference()
                        ref.child("users").child((user?.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
                            if !snapshot.exists() {
                                ref.child("users").child((user?.uid)!).setValue(["name": name])
                            }
                        })
                    }
                }
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        // print("User Logged Out")
    }
    
    @IBAction func logIn(_ sender: Any) {
        let email = emailTextField.text!
        let pass = passwordTextField.text!
        if (email == "" || pass == "") {
            sendAlert(title: "Erro ao logar", message: "Por favor preencha os campos para logar!")
        } else {
            Auth.auth().signIn(withEmail: email, password: pass) { (user, err) in
                if (err != nil) {
                    self.sendAlert(title: "Erro ao logar", message: "Não foi possível logar, verifique sua senha e email")
                    return;
                }
                self.sendToTabBar()
            }
        }
    }
    
    private func sendAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .cancel , handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let user = Auth.auth().currentUser
        if (user != nil) {
            self.sendToTabBar()
        }
    }

}
