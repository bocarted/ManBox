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
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let moc = appDelegate.managedObjectContext
        
        
//        let level1 = NSEntityDescription.insertNewObject(forEntityName: "Level", into: moc) as! Level
//        level1.levelName = "Level 1"
//        level1.levelDescription = "Bring me the ring"
//        let p1 = Position(x: 0, y: 1)
//        level1.startManPosition = NSKeyedArchiver.archivedData(withRootObject: p1.codedPosition)
//        try! moc.save()
//        

//        let requestLevel = NSFetchRequest<NSManagedObject>(entityName: "Level")
//        var levels = try! moc.fetch(requestLevel) as! [Level]
//        print(levels.count)
//        let level1 = levels[0]
//        let p1 = NSKeyedUnarchiver.unarchiveObject(with: level1.startManPosition) as! CodingPosition
//        let pp1 = Position(withCodedPosition: p1)
//
//
//        print(level1.levelDescription)
//        print(pp1)
        let array = [1,2,3]
        let a : Data = NSKeyedArchiver.archivedData(withRootObject: array)
        
        try! moc.save()
        
        
        
        
//        let newElement = NSEntityDescription.insertNewObject(forEntityName: "Level", into: moc) as! Level
//        newElement.levelName = "Level1"
//        let p1 = Position(x: 1, y: 1)
//        let ap1 = Point(position: p1)
//        newElement.startManPosition = NSKeyedArchiver.archivedData(withRootObject: ap1)
//        try! moc.save()
        

        
//        let p1 = Position(x: 0, y: 0)
//        let p2 = Position(x: 1, y: 1)
//        let p3 = Position(x: 2, y: 2)
//        
//        levels[0].levelName = "Level 1"
//        levels[0].startManPosition = NSKeyedArchiver.archivedData(withRootObject: p1)
//        
//        levels[1].levelName = "Level 2"
//        levels[1].startManPosition = NSKeyedArchiver.archivedData(withRootObject: p2)
//        
//        
//        levels[2].levelName = "Level 3"
//        levels[2].startManPosition = NSKeyedArchiver.archivedData(withRootObject: p3)
//       try! moc.save()
        
//        for level in levels {
//            let p = NSKeyedUnarchiver.unarchiveObject(with: level.startManPosition) as! Position
//            print(level.levelName + " x: \(p.x)")
//        }
        
        
    }
    

    var roomViewModel : RoomViewModel!
  

    
    func reset () {
        roomViewModel = RoomViewModel()
        printField.text = roomViewModel.contentOfPrintField
        descriptionField.text = roomViewModel.contentOfDescriptionField
        movesField.text = roomViewModel.contentOfMovesField
    }
    

    @IBOutlet weak var descriptionField: UILabel!
    
    @IBOutlet weak var printField: UILabel!
    
    
    @IBOutlet weak var movesField: UILabel!
    
    
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
    @IBAction func touchUndo(_ sender: UIButton) {
        roomViewModel.undo()
        printField.text = roomViewModel.contentOfPrintField
        movesField.text = roomViewModel.contentOfMovesField
    }
    
    @IBAction func touchDirection(_ sender: UIButton) {
        roomViewModel.moveManByArrow(sender.currentTitle!)
        printField.text = roomViewModel.contentOfPrintField
        movesField.text = roomViewModel.contentOfMovesField
    }
    
    
    

}

