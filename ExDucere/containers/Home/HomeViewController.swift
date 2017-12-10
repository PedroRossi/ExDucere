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
    
    let list:[String] = ["João", "Maria", "Fernando", "Alice", "José"]
    var filterView:FilterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    
    @IBAction func typeFilter(_ sender: Any) {
        
        if (filterView != nil){
            filterView.view.removeFromSuperview()
        }
        
        switch segmentControlFilter.selectedSegmentIndex {
        case 0:
            filterView = FilterView(frame: CGRect(x: 0, y: 50, width: 220, height: 414))
            filterView.closeButton.addTarget(self, action:"closed", for: .touchUpInside)
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
