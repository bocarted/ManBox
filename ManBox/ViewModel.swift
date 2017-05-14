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
        case Loose = "⛔️"
        case Box = "💍"
        case Block = "◼️"
        case Win = "👸"
        case Empty = "◻️"
    }
    
    var roomModel : RoomModel
    var squares : [[Square]]
    
    
    init() {
        roomModel = RoomModel()
        squares = Array(repeating: Array(repeatElement(.Empty, count: roomWidth)), count: roomHeight)
    }
}
