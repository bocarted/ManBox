//
//  Model.swift
//  ManBox
//
//  Created by Таня on 11.05.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import Foundation


struct Position {
    var x : Int
    var y : Int
}

extension Position: Equatable {
    static func == (p1: Position, p2: Position) -> Bool {
        return p1.hashValue == p2.hashValue
    }
    
    static func != (p1: Position, p2: Position) -> Bool {
        return !(p1 == p2)
    }
}

extension Position: Hashable {
    var hashValue: Int {
        return String("\(x)\(y)")!.hashValue
    }
}


struct Vector {
    var x: Int
    var y: Int
}



class RoomModel {
    struct Move {
        let manPosition : Position
        let boxPosition : Position
    }
    
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

    
    init(withLevel level: Level) {
        self.roomWidth = Int(level.roomWidth)
        self.roomHeight = Int(level.roomHeight)
        self.manPosition = PositionSerializer.deserializePosition(data: level.startManPosition)!
        self.boxPosition = PositionSerializer.deserializePosition(data: level.startBoxPosition)!
        self.winPosition = PositionSerializer.deserializePosition(data: level.winPosition)!
        self.blocks = PositionSerializer.deserializeSetOfPositions(data: level.blocks)!
        self.manWin = false
        self.moves = []
        self.levelDescription = level.levelDescription
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

        if positionIsValid(newPosition) {
            return newPosition
        } else {
            return startPosition
        }
    }
    
    private func positionIsValid (_ point: Position) -> Bool {
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
    
    func undo() {
        if moves.count > 0 {
            manPosition = moves[moves.count - 1].manPosition
            boxPosition = moves[moves.count - 1].boxPosition
            moves.removeLast()
        }
    }
}

//for future improvments
class MovingObject {
    private var position: Position
    
    init(position: Position) {
        self.position = position
    }
    
    func moveByVector(_ vector : Vector, newPositionValidation: (Position) -> Bool) {
        let newPosition = Position(x: self.position.x + vector.x, y: self.position.y + vector.y)
        if newPositionValidation(newPosition) {
            self.position = newPosition
        }
    }
}



