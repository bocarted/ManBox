//
//  ViewController.swift
//  ManBox
//
//  Created by Таня on 11.05.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    var roomViewModel : RoomViewModel!
    @IBOutlet weak var printField: UILabel!
    @IBOutlet weak var movesField: UILabel!
    
//MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }

//MARK: Helpers
    func reset () {
        roomViewModel = RoomViewModel()
        updateLabels()
    }
    
    func updateLabels() {
        printField.text = roomViewModel.contentOfPrintField
        movesField.text = roomViewModel.contentOfMovesField
    }

//MARK: Touch handler
    @IBAction func touchReset(_ sender: UIButton) {
        let alert = UIAlertController(title: "Restart?", message: "Do you want to restart the game?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { [unowned self](action: UIAlertAction) -> Void in
            self.reset()
        }
        let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func touchUndo(_ sender: UIButton) {
        roomViewModel.undo()
        updateLabels()
    }
    
    @IBAction func touchDirection(_ sender: UIButton) {
        roomViewModel.moveManByArrow(sender.currentTitle!)
        updateLabels()
    }
    

}

