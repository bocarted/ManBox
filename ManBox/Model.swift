//
//  Model.swift
//  ManBox
//
//  Created by Таня on 11.05.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import Foundation

let roomHeight = 6
let roomWidth = 6

enum Direction : String {
    case Left
    case Right
    case Up
    case Down
}

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
    
//    //if they are near
//    static func >= (p1: Point, p2: Point) -> Bool {
//        if (p1.x == p2.x) {
//            return (p1.y - 1 == p2.y) || (p1.y + 1 == p2.y)
//        } else if (p1.y == p2.y) {
//            return (p1.x - 1 == p2.x) || (p1.x + 1 == p2.x)
//        } else {
//            return false
//        }
//    }
}


class Room {
    
    var manWin = false

    var man : Point {
        didSet {
            for block in blocks {
                if block == man {
                    man = oldValue
                    break
                }
            }
        }
    }
    
    var box : Point {
        didSet {
            for block in blocks {
                if block == box {
                    box = oldValue
                    break
                }
            }
        }
    }
    
    let win = Point(x: roomHeight-1, y: roomWidth-1)
    
    var blocks = [Point]()
    
    init() {
        self.man = Point(x: 0, y: 0)
        self.box = Point(x: 3, y: 3)
        self.blocks.append(Point(x: 2, y: 2))
        self.blocks.append(Point(x: 4, y: 3))
        self.blocks.append(Point(x: 1, y: 0))
        self.blocks.append(Point(x: 4, y: 5))
        self.blocks.append(Point(x: 1, y: 3))
    }
    
    func moveBox (_ direction: Direction) -> Bool {
        let oldPoint = box
        
        switch direction {
        case .Up:
            box.y -= 1
        case .Down:
            box.y += 1
        case .Left:
            box.x -= 1
        case .Right:
            box.x += 1
        }
        
        if box == win {
            manWin = true
        }
        
        return oldPoint != box
        
    }
    
    func moveMan (_ direction: Direction) {
        
        let oldPosition = man
        
        switch direction {
        case .Up:
            man.y -= 1
        case .Down:
            man.y += 1
        case .Left:
            man.x -= 1
        case .Right:
            man.x += 1
        }
        
        if man == box {
            if !moveBox(direction) {
                man = oldPosition
            }
        }
    
        
    }
    
}


