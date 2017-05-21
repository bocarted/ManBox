//
//  Model.swift
//  ManBox
//
//  Created by Таня on 11.05.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import Foundation


struct Point : Hashable, Equatable {
    
    var x : Int
    
    var y : Int
    
// Hashable
    var hashValue: Int {
        return Int(String("\(x)\(y)"))!
    }
    
// Equatable
    static func == (p1: Point, p2: Point) -> Bool {
        return (p1.x == p2.x) && (p1.y == p2.y)
    }
    
    static func != (p1: Point, p2: Point) -> Bool {
        return !(p1 == p2)
    }

}

struct Vector {
    var x: Int
    var y: Int
}

struct Move {
    let manPosition : Point
    let boxPosition : Point
}


class RoomModel {
    
    var manWin : Bool
    
    let roomHeight : Int
    let roomWidth : Int
    
    var manPosition : Point
    
    var boxPosition : Point {
        didSet {
            if boxPosition == winPosition {
                manWin = true
            }
        }
    }
    
    let winPosition : Point
    
    let levelDescription: String
    
    var blocks : Set<Point>
    
    var moves : [Move]
    

    
    init(withLevel level: Level) {
        
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
    

    func pointIsValid (_ point: Point) -> Bool {
        
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
        

    
    func moveObjectAtPosition(_ startPoint: Point, byVector vector: Vector) -> Point {
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


