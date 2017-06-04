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
    @IBOutlet weak var tableView: UITableView!
    var menuModel : MenuModel!
    var cellTitles = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        menuModel = MenuModel()
        cellTitles =  menuModel.getCellTitles()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "Cell") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        cell.textLabel?.text = cellTitles[indexPath.row]
        return cell
    }

    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toLevel") && segue.destination is ViewController {
            let destination = segue.destination as! ViewController
            let cellSender = sender as! UITableViewCell
            let index = tableView.indexPath(for: cellSender)!.row
            destination.level = menuModel.getLevelsFromCoreData()[index]
        }
    }
}

