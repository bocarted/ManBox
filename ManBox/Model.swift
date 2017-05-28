//
//  Model.swift
//  ManBox
//
//  Created by Таня on 11.05.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import Foundation


struct Position : Hashable, Equatable {
    
    var x : Int
    
    var y : Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    
// Hashable
    var hashValue: Int {
        return Int(String("\(x)\(y)"))!
    }
    
// Equatable
    static func == (p1: Position, p2: Position) -> Bool {
        return (p1.x == p2.x) && (p1.y == p2.y)
    }
    
    static func != (p1: Position, p2: Position) -> Bool {
        return !(p1 == p2)
    }
// Coding for CoreData
    var codedPosition : CodingPosition {
        return CodingPosition(position: self)
    }
    
    init(withCodedPosition codingPosition : CodingPosition) {
        self.x = codingPosition.x
        self.y = codingPosition.y
    }
    


}

class CodingPosition : NSObject, NSCoding {
    
    var x : Int
    var y : Int
    
    init(position: Position) {
        self.x = position.x
        self.y = position.y
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        let x = aDecoder.decodeInteger(forKey: "x")
        let y = aDecoder.decodeInteger(forKey: "y")
        self.init(position: Position(x: x, y: y))
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(x, forKey: "x")
        aCoder.encode(y, forKey: "y")
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
    
    var manPosition : Position
    
    var boxPosition : Position {
        didSet {
            if boxPosition == winPosition {
                manWin = true
            }
        }
    }
    
    let winPosition : Position
    
    let levelDescription: String
    
    var blocks : Set<Position>
    
    var moves : [Move]
    

    
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
        

    
    func moveObjectAtPosition(_ startPoint: Position, byVector vector: Vector) -> Position {
        var newPoint = startPoint
        newPoint.x += vector.x
        newPoint.y += vector.y
        
        if pointIsValid(newPoint) {
            return newPoint
        } else {
            return startPoint
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


