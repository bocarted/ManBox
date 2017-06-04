//
//  MenuViewController.swift
//  ManBox
//
//  Created by Таня on 28.05.17.
//  Copyright © 2017 Таня. All rights reserved.
//
import UIKit
import CoreData

class MenuViewController: UIViewController, UITableViewDataSource {
    var menuModel : MenuModel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        menuModel = MenuModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        cell.textLabel!.text = "Bye"
        return cell
    }

}

