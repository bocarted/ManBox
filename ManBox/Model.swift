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
    
    var blocks : Set<Point>
    
    init(withLevel level: Level) {
        
        self.roomWidth = level.roomWidth
        self.roomHeight = level.roomHeight
        self.manPosition = level.startManPosition
        self.boxPosition = level.startBoxPosition
        self.blocks = level.blocks
        self.winPosition = level.winPosition
        self.manWin = false
        
    }
    

    func pointIsNotAllowed (_ point: Point) -> Bool {
        
        if (point.x < 0) || (point.x >= roomWidth) {
            return true
        }
        
        if (point.y < 0) || (point.y >= roomHeight) {
            return true
        }
        
        if blocks.contains(point) {
            return true
        }
        
        return false
    }
    

    
    func moveManAtVector (_ vector: Vector) {
        
        let oldManPosition = manPosition
        manPosition = moveObjectAtPosition(manPosition, byVector: vector)
        
        if manPosition == boxPosition {
            let oldBoxPosition = boxPosition
            boxPosition = moveObjectAtPosition(boxPosition, byVector: vector)
            if boxPosition == oldBoxPosition {
                manPosition = oldManPosition
            }
        }
        
    }
        

    
    func moveObjectAtPosition(_ startPoint: Point, byVector vector: Vector) -> Point {
        var newPoint = startPoint
        newPoint.x += vector.x
        newPoint.y += vector.y
        
        if pointIsNotAllowed(newPoint) {
            return startPoint
        } else {
            return newPoint
        }
    }
    
}


