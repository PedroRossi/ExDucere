//
//  ConfigurationsViewController.swift
//  ExDucere
//
//  Created by Pedro Gonçalves Rossi Rodrigues on 11/12/17.
//  Copyright © 2017 Pedro Gonçalves Rossi Rodrigues. All rights reserved.
//

import UIKit
import FirebaseAuth
import FBSDKLoginKit

class ConfigurationsViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Ajustes"
        let loginButton: FBSDKLoginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["email", "public_profile"]
        if let view = self.view.viewWithTag(300) {
            loginButton.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.bounds.size.width + 30, height: view.bounds.size.height)
            loginButton.center.x = view.center.x + 14
            loginButton.center.y = view.center.y - 80
            view.addSubview(loginButton)
        }
        loginButton.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: FBSDKLoginButtonDelegate
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        // will never login on this page
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        do {
           try Auth.auth().signOut()
        } catch {
            
        }
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let tabBarController = storyBoard.instantiateViewController(withIdentifier: "login") as! LoginViewController
        self.present(tabBarController, animated: false, completion: nil)
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
