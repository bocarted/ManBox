//
//  Model.swift
//  ManBox
//
//  Created by Таня on 11.05.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import Foundation


class Position : NSObject, NSCoding {
    
    var x : Int
    var y : Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        let x = aDecoder.decodeInteger(forKey: "x")
        let y = aDecoder.decodeInteger(forKey: "y")
        self.init(x: x, y: y)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(x, forKey: "x")
        aCoder.encode(y, forKey: "y")
    }

    static func == (p1: Position, p2: Position) -> Bool {
        return (p1.x == p2.x) && (p1.y == p2.y)
    }
    
    static func != (p1: Position, p2: Position) -> Bool {
        return !(p1 == p2)
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if object is Position {
            let p = object as! Position
            return self == p
        } else {
            return false
        }
    }
    
    override var hashValue: Int {
        return String("\(x)\(y)")!.hashValue
    }
}


struct Vector {
    var x: Int
    var y: Int
}

struct Move {
    let manPosition : Position
    let boxPosition : Position
}


class RoomModel {
    
    var manWin : Bool
    let roomHeight : Int
    let roomWidth : Int
    let winPosition : Position
    let levelDescription: String
    var blocks : Set<Position>
    var moves : [Move]
    var manPosition : Position
    var boxPosition : Position {
        didSet {
            if boxPosition == winPosition {
                manWin = true
            }
        }
    }

    
    init(withLevel level: LevelStruct) {
        self.roomWidth = level.roomWidth
        self.roomHeight = level.roomHeight
        self.manPosition = level.startManPosition
        self.boxPosition = level.startBoxPosition
        self.blocks = level.blocks
        self.winPosition = level.winPosition
        self.manWin = false
        self.moves = []
        self.levelDescription = level.levelDescription
    }
    

    func pointIsValid (_ point: Position) -> Bool {
        
        if (point.x < 0) || (point.x >= roomWidth) {
            return false
        }
        
        if (point.y < 0) || (point.y >= roomHeight) {
            return false
        }
        
        if blocks.contains(point) {
            return false
        }
        
        return true
    }
    

    
    func moveManAtVector (_ vector: Vector) {
        
        let oldManPosition = manPosition
        let oldBoxPosition = boxPosition
        
        manPosition = moveObjectAtPosition(manPosition, byVector: vector)
        
        if manPosition == boxPosition {
            boxPosition = moveObjectAtPosition(boxPosition, byVector: vector)
            if boxPosition == oldBoxPosition {
                manPosition = oldManPosition
            }
        }
        
        if manPosition != oldManPosition {
            moves.append(Move(manPosition: oldManPosition, boxPosition: oldBoxPosition))
        }
        
    }
        

    
    func moveObjectAtPosition(_ startPosition: Position, byVector vector: Vector) -> Position {
        let newPosition = Position(x: startPosition.x + vector.x, y: startPosition.y + vector.y)

        if pointIsValid(newPosition) {
            return newPosition
        } else {
            return startPosition
        }
    }
    
    func undo() {
        if moves.count > 0 {
            manPosition = moves[moves.count - 1].manPosition
            boxPosition = moves[moves.count - 1].boxPosition
            moves.removeLast()
        }
    }
    
}


