//
//  ViewController.swift
//  ManBox
//
//  Created by Таня on 11.05.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var room : RoomModel!
    
    enum Square : String {
        case Man = "😍"
        case Loose = "⛔️"
        case Box = "💍"
        case Block = "◼️"
        case Win = "👸"
        case Empty = "◻️"
    }
    
    var squares : [[Square]]!
    
    
    var contentOfPrintField : String {
        get {
            
            var line : String = ""
            
            for i in 0...roomHeight - 1 {
                for j in 0...roomWidth - 1 {
                    line += squares[i][j].rawValue
                    }                
                line += "\n"
            }
            if room.manWin {
                line = "I LOVE YOU"
            }
            return line
        }
    }
    
    func reset () {
        room = RoomModel()
        squares = Array(repeating: Array(repeatElement(.Empty, count: roomWidth)), count: roomHeight)
        squares[room.man.y][room.man.x] = .Man
        squares[room.box.y][room.box.x] = .Box
        squares[room.win.y][room.win.x] = .Win
        for block in room.blocks {
            squares[block.y][block.x] = .Block
        }
        
        printField.text = contentOfPrintField
    }
    
    @IBOutlet weak var display: UILabel!

    
    @IBOutlet weak var printField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    @IBAction func touchReset(_ sender: UIButton) {
        reset()
    }
    
    @IBAction func touchDirection(_ sender: UIButton) {
        squares[room.man.y][room.man.x] = .Empty
        squares[room.box.y][room.box.x] = .Empty
        room.moveMan(Direction(rawValue: sender.currentTitle!)!)
        squares[room.man.y][room.man.x] = .Man
        squares[room.box.y][room.box.x] = .Box
        printField.text = contentOfPrintField
    }
    
    
    

}

