//
//  RootViewController.swift
//  ExDucere
//
//  Created by Pedro Gonçalves Rossi Rodrigues on 11/12/17.
//  Copyright © 2017 Pedro Gonçalves Rossi Rodrigues. All rights reserved.
//

import UIKit
import FirebaseAuth

class RootViewController: UINavigationController {

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
