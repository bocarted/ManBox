//
//  MenuViewController.swift
//  ManBox
//
//  Created by Таня on 28.05.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedLevel : Int16 = 0
    

    
    let context = (UIApplication.shared.delegate as! AppDelegate).dataController.managedObjectContext
    
    let requestAll = NSFetchRequest<NSManagedObject>(entityName: "Level")
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        cell.textLabel!.text = "Hello"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedLevel = Int16(indexPath.row)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

