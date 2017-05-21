//
//  ViewController.swift
//  ManBox
//
//  Created by Таня on 11.05.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    

    var roomViewModel : RoomViewModel!
  

    
    func reset () {
        roomViewModel = RoomViewModel()
        printField.text = roomViewModel.contentOfPrintField
    }
    
    @IBOutlet weak var display: UILabel!

    
    @IBOutlet weak var printField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
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
    
    @IBAction func touchDirection(_ sender: UIButton) {
        roomViewModel.moveManByArrow(sender.currentTitle!)
        printField.text = roomViewModel.contentOfPrintField
    }
    
    
    

}

