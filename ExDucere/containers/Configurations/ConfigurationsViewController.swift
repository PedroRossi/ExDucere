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

class ConfigurationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Ajustes"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            FBSDKLoginManager().logOut()
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let tabBarController = storyBoard.instantiateViewController(withIdentifier: "login") as! LoginViewController
            self.present(tabBarController, animated: false, completion: nil)
        } catch {
            
        }
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
