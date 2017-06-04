//
//  ViewModel.swift
//  ManBox
//
//  Created by Таня on 14.05.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import Foundation



class RoomViewModel {
    
    enum Square : String {
        case Man = "😍"
        case Box = "💍"
        case Block = "◼️"
        case Win = "👸"
        case Empty = "◻️"
    }
    
    
    var roomModel : RoomModel
    var squares : [[Square]]
    var contentOfDescriptionField : String
    var contentOfMovesField : String {
        return "Moves: \(roomModel.moves.count)"
    }
    
    let roomHeight : Int
    let roomWidth : Int
    
    var contentOfPrintField : String {
        get {
            var line : String = ""
            for i in 0...roomHeight - 1 {
                for j in 0...roomWidth - 1 {
                    line += squares[i][j].rawValue
                }
                line += "\n"
            }
            if roomModel.manWin {
                line = "👸: I LOVE YOU"
            }
            return line
        }
    }
    
    
    init(withLevel level: Level) {
        roomModel = RoomModel(withLevel: level)
        self.contentOfDescriptionField = roomModel.levelDescription
        self.roomHeight = roomModel.roomHeight
        self.roomWidth = roomModel.roomWidth
        squares = Array(repeating: Array(repeatElement(.Empty, count: roomWidth)), count: roomHeight)
        squares[roomModel.manPosition.y][roomModel.manPosition.x] = .Man
        squares[roomModel.boxPosition.y][roomModel.boxPosition.x] = .Box
        squares[roomModel.winPosition.y][roomModel.winPosition.x] = .Win
        for block in roomModel.blocks {
            squares[block.y][block.x] = .Block
        }
        
        
    }
    

    
    func moveManByArrow (_ arrowName: String) {

        squares[roomModel.manPosition.y][roomModel.manPosition.x] = .Empty
        squares[roomModel.boxPosition.y][roomModel.boxPosition.x] = .Empty

        var vector = Vector(x: 0, y: 0)
        
        switch arrowName {
        case "Up":
            vector.y -= 1
        case "Down":
            vector.y += 1
        case "Left":
            vector.x -= 1
        case "Right":
            vector.x += 1
        default:
            break
        }
        roomModel.moveManAtVector(vector)
        
        squares[roomModel.manPosition.y][roomModel.manPosition.x] = .Man
        squares[roomModel.boxPosition.y][roomModel.boxPosition.x] = .Box

    }
    
    func undo() {
        squares[roomModel.manPosition.y][roomModel.manPosition.x] = .Empty
        squares[roomModel.boxPosition.y][roomModel.boxPosition.x] = .Empty
        
        roomModel.undo()
        
        squares[roomModel.manPosition.y][roomModel.manPosition.x] = .Man
        squares[roomModel.boxPosition.y][roomModel.boxPosition.x] = .Box
    }
}
