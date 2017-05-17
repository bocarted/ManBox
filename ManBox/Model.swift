//
//  Model.swift
//  ManBox
//
//  Created by Таня on 11.05.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import Foundation

let roomHeight = 5
let roomWidth = 5

struct Point {
    
    var x : Int {
        didSet {
            if (x > roomWidth - 1) || (x < 0) {
                x = oldValue
            }
        }
    }
    
    var y : Int {
        didSet {
            if (y > roomHeight - 1) || (y < 0) {
                y = oldValue
            }
        }
    }
    
    
    static func != (p1: Point, p2: Point) -> Bool {
        return (p1.x != p2.x) || (p1.y != p2.y)
    }
    
    static func == (p1: Point, p2: Point) -> Bool {
        return !(p1 != p2)
    }
    
}

struct Vector {
    var x: Int
    var y: Int
}

class RoomModel {
    
    var manWin = false
    
    var manPosition : Point {
        didSet {
            for block in blocks {
                if block == manPosition {
                    manPosition = oldValue
                    break
                }
            }
        }
    }
    
    var boxPosition : Point {
        didSet {
            for block in blocks {
                if block == boxPosition {
                    boxPosition = oldValue
                    break
                }
            }
        }
    }
    
    let win = Point(x: roomHeight-1, y: roomWidth-1)
    
    var blocks = [Point]()
    
    init() {

        self.boxPosition = Point(x: 2, y: 3)
        self.manPosition = Point(x: 0, y: 0)
        self.blocks.append(Point(x: 2, y: 1))
        self.blocks.append(Point(x: 4, y: 3))
        self.blocks.append(Point(x: 1, y: 0))
        self.blocks.append(Point(x: 1, y: 3))
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
            if boxPosition == win {
                manWin = true
            }
        
    }
        

    
    func moveObjectAtPosition(_ startPoint: Point, byVector vector: Vector) -> Point {
        var newPoint = startPoint
        newPoint.x += vector.x
        newPoint.y += vector.y
        return newPoint
    }
    
}


